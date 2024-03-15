import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as location;
import 'package:mapbox_gl/mapbox_gl.dart';

import './api_response/google_places_details_response_entity.dart';
import './api_response/google_reverse_geo_coding_response_entity.dart';
import './model/retrieve_location_arg.dart';
import '../../const/string_const.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/user_info/db_user_info.dart';
import '../../network/dio_client.dart';
import '../../utils/app_config.dart';
import '../../utils/static_functions.dart';

class FetchLocationProvider extends ChangeNotifier {
  final isarService = IsarService();
  Position? _currentPosition;
  bool _isLocationAddressAvailable = false;
  late Stream<Position> locationStream;
  StreamController<Position>? locationStreamController;
  GoogleReverseGeoCodingResponseEntity? _reverseGeoCodingResponseEntity;

  bool get locationAddressAvailable => _isLocationAddressAvailable;

  Position? get myLocation => _currentPosition;

  GoogleReverseGeoCodingResponseEntity? get geoLocation =>
      _reverseGeoCodingResponseEntity;

  String? currentLocationAddress;
  LatLng? currentLocationLatLng;
  String? landMarkLocationForLocationField;
  static StreamSubscription<Position>? _geoLocationStream;

  Future<bool> _checkForPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      // return Future.error('Location services are disabled.');

      // Ref. Update kotlin version to lib as mentioned below:
      // https://github.com/Lyokone/flutterlocation/pull/793/commits/1916bd35880da3fe517db9812bdbc4c58446ab39
      final locationService = await location.Location().requestService();
      if (!locationService) {
        return false;
      }
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        // return Future.error('Location permissions are denied');
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      /*return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');*/
      return false;
    }
    return true;
  }

  init() async {
    if (locationStreamController != null) {
      locationStream = locationStreamController!.stream;
    }
    late LocationSettings locationSettings;
    final permissionGranted = await _checkForPermission();
    if (permissionGranted) {
      if (Platform.isAndroid) {
        locationSettings = AndroidSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 100,
          intervalDuration: const Duration(seconds: 10),
          //(Optional) Set foreground notification config to keep the app alive
          //when going to the background
          foregroundNotificationConfig: const ForegroundNotificationConfig(
            notificationIcon: AndroidResource(
              name: Strings.notificationIcon,
              defType: 'drawable',
            ),
            notificationText:
                "Brooon app will continue to receive your location even when you aren't using it",
            notificationTitle: "Location Running in Background",
            enableWakeLock: true,
          ),
        );
      } else if (Platform.isIOS) {
        locationSettings = AppleSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 100,
          pauseLocationUpdatesAutomatically: true,
          // Only set to true if our app will be started up in the background.
          showBackgroundLocationIndicator: false,
        );
      } else {
        locationSettings = LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 100,
        );
      }

      final lastKnownLocation = await Geolocator.getLastKnownPosition();
      if (lastKnownLocation != null) {
        notifyPositionToScreen(lastKnownLocation);
      }

      try {
        if (_geoLocationStream != null) {
          await _geoLocationStream!.cancel();
        }
        _geoLocationStream =
            Geolocator.getPositionStream(locationSettings: locationSettings)
                .listen(
          (Position? position) {
            debugPrint(position == null
                ? 'Unknown Location'
                : 'Location from Stream: ${position.latitude.toString()}, ${position.longitude.toString()}');
            if (position != null) {
              notifyPositionToScreen(position);
            }
          },
          onError: (error) {
            debugPrint('Geolocation listener: $error');
          },
        );
        final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        notifyPositionToScreen(position);
      } on PlatformException catch (error) {
        debugPrint('Geolocation: PlatformException: $error');
      } on UnimplementedError catch (error) {
        debugPrint('Geolocation: UnimplementedError: $error');
      } catch (error) {
        debugPrint('Geolocation: Exception: $error');
      }
    }
  }

  notifyPositionToScreen(Position position) async {
    // ---------------------------------------------------------------------------
    // IF need to update location once mobile location changes then..
    if (AppConfig.enableNearByRealTimeFeature) {
      await _updateCurrentLocationBasedOnLocationChanges(position);
    }
    // ---------------------------------------------------------------------------
    debugPrint('Geolocation:-> $position');
    _currentPosition = position;
    if (locationStreamController != null &&
        !locationStreamController!.isClosed) {
      locationStreamController!.add(position);
    }
  }

  // ---------------------------------------------------------------------------
  // IF need to update location once mobile location changes then..
  // ---------------------------------------------------------------------------
  _updateCurrentLocationBasedOnLocationChanges(Position position) async {
    final distanceInMeter = Geolocator.distanceBetween(
      StaticFunctions.userInfo?.liveLatitude ?? 0.0,
      StaticFunctions.userInfo?.liveLongitude ?? 0.0,
      position.latitude,
      position.longitude,
    );
    debugPrint(
        'Distance with old location ${StaticFunctions.userInfo?.liveLatitude},${StaticFunctions.userInfo?.liveLongitude} & new location ${position.latitude}, ${position.longitude} :- $distanceInMeter meter');
    if (distanceInMeter > AppConfig.minDistanceInMeterToUpdateLiveLocation) {
      // IF Live location is changed and distance with old location is greater than # {minDistanceInMeterToCallReverseGeoCoding}
      // THEN update live location and near by
      await saveLiveLocationToUserTable(position);
    }
  }

  doReverseGeoCoding(double latitude, double longitude, bool isCurrentLocation,
      {bool isNeedToNotify = true}) async {
    _isLocationAddressAvailable = false;
    _reverseGeoCodingResponseEntity = await DioClient.locationApi()
        .fetchAddressFromLocation(latitude, longitude);
    final list = _reverseGeoCodingResponseEntity?.results;
    final compoundCode =
        _reverseGeoCodingResponseEntity?.plusCode?.compoundCode;
    if (list != null && list.isNotEmpty) {
      _isLocationAddressAvailable = true;
      if (isCurrentLocation) {
        _updateCurrentLocationAddressAndPositions(
          list[0].formattedAddress,
          LatLng(latitude, longitude),
        );
      }
    } else if (compoundCode != null && compoundCode.trim().isNotEmpty) {
      _isLocationAddressAvailable = true;
      if (isCurrentLocation) {
        _updateCurrentLocationAddressAndPositions(
          compoundCode,
          LatLng(latitude, longitude),
        );
      }
    }
    if (isNeedToNotify) {
      notifyListeners();
    }
  }

  _updateCurrentLocationAddressAndPositions(String? address, LatLng positions) {
    currentLocationAddress = address;
    currentLocationLatLng = positions;
  }

  Future<RetrieveLocationArg> callToRetrieveCoordinatesFromGooglePlaceId(
      RetrieveLocationArg arg,
      {bool isNeedToSaveCurrentLocation = false}) async {
    GooglePlacesDetailsResponseEntity? response =
        await DioClient.locationApi().findPlacesDetail(arg.placeId!);
    if (response != null) {
      arg.coordinates = LatLng(
        response.result?.geometry?.location?.lat ?? 0.0,
        response.result?.geometry?.location?.lng ?? 0.0,
      );
      if (isNeedToSaveCurrentLocation) {
        _updateCurrentLocationAddressAndPositions(
          arg.areaName,
          LatLng(
            arg.coordinates?.latitude ?? 0.0,
            arg.coordinates?.longitude ?? 0.0,
          ),
        );
        saveUserCurrentLocation();
      }
    }
    return arg;
  }

  saveUserCurrentLocation() async {
    DbUserInfo? userInfo = await isarService.getUserInfo();
    if (userInfo != null) {
      userInfo.latitude = currentLocationLatLng?.latitude;
      userInfo.longitude = currentLocationLatLng?.longitude;
      userInfo.currentArea = currentLocationAddress;
      await isarService.saveOrUpdateUserInfo(userInfo);
      _updateUsersLocationInfo(userInfo);
    }
  }

  saveUserCurrentArea(String area) async {
    DbUserInfo? userInfo = await isarService.getUserInfo();
    if (userInfo != null) {
      userInfo.currentArea = area;
      await isarService.saveOrUpdateUserInfo(userInfo);
    }
  }

  _updateUsersLocationInfo(DbUserInfo userInfo) async {
    await DioClient().updateLocationInfo(
      userInfo.latitude,
      userInfo.longitude,
      userInfo.currentArea,
    );
  }

  saveLiveLocationToUserTable(Position position) async {
    StaticFunctions.userInfo?.liveLatitude = position.latitude;
    StaticFunctions.userInfo?.liveLongitude = position.longitude;
    DbUserInfo? userInfo = await isarService.getUserInfo();
    if (userInfo != null) {
      userInfo.liveLatitude = position.latitude;
      userInfo.liveLongitude = position.longitude;
      await isarService.saveOrUpdateUserInfo(userInfo);
    }
  }

  static cancelLocationService() async {
    await _geoLocationStream?.cancel();
  }

  setLandMarkLocationToUpdateField(String landMarkLocation) {
    landMarkLocationForLocationField = landMarkLocation;
  }
}
