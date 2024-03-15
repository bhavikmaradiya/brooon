import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:provider/provider.dart';

import './api_response/google_reverse_geo_coding_response_entity.dart';
import './fetch_location_provider.dart';
import './location_provider.dart';
import './model/location_content.dart';
import './model/retrieve_location_arg.dart';
import './widget/location_detail_content.dart';
import '../../const/dimen_const.dart';
import '../../const/routes.dart';
import '../../const/string_const.dart';
import '../../utils/app_config.dart';
import '../../utils/choose_location_from_enum.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/loading_map_widget.dart';
import '../../widgets/search_widget.dart';
import '../../widgets/snack_bar_view.dart';

class ChooseLocation extends StatelessWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chooseLocationFrom =
        ModalRoute.of(context)!.settings.arguments as ChooseLocationFrom?;
    return ChangeNotifierProvider(
      create: (_) => LocationProvider(),
      builder: (_, __) => _ChooseLocationBody(
        chooseLocationFrom: chooseLocationFrom,
      ),
    );
  }
}

class _ChooseLocationBody extends StatefulWidget {
  final ChooseLocationFrom? chooseLocationFrom;

  const _ChooseLocationBody({
    Key? key,
    required this.chooseLocationFrom,
  }) : super(key: key);

  @override
  State<_ChooseLocationBody> createState() => _ChooseLocationBodyState();
}

class _ChooseLocationBodyState extends State<_ChooseLocationBody> {
  final _searchFocusNode = FocusNode();
  AppLocalizations? localizationsContext;
  LocationProvider? _locationProvider;
  FetchLocationProvider? _fetchLocationProvider;
  MapboxMapController? _mapController;
  LatLng? _currentPosition;
  String? _selectedArea;
  LatLng _selectedCoordinates = LatLng(0.0, 0.0);

  @override
  void didChangeDependencies() {
    if (localizationsContext == null) {
      localizationsContext = AppLocalizations.of(context)!;
    }
    if (_locationProvider == null) {
      _locationProvider = Provider.of<LocationProvider>(
        context,
        listen: false,
      );
    }
    if (_fetchLocationProvider == null) {
      _fetchLocationProvider = Provider.of<FetchLocationProvider>(
        context,
        listen: false,
      );
      _fetchLocationProvider!.locationStreamController = StreamController();
      _fetchLocationProvider!.init();
      final position = _fetchLocationProvider!.myLocation;
      if (position != null) {
        _currentPosition = LatLng(position.latitude, position.longitude);
      }
      listenOnLocationChanges();
    }
    super.didChangeDependencies();
  }

  _onMapCreated(MapboxMapController controller) {
    Future.delayed(
      Duration(
        milliseconds: widget.chooseLocationFrom == ChooseLocationFrom.splash
            ? AppConfig.defaultDelayToLoadMapInMilliseconds
            : AppConfig.minorDelayToLoadMapInMilliseconds,
      ),
      () {
        _locationProvider?.setMapCreated = true;
      },
    );
    _mapController = controller;
    _mapController?.addListener(() async {
      if (!(_mapController?.isCameraMoving ?? true)) {
        // Center point : Ref. https://stackoverflow.com/a/68093592/5370550
        final visibleRegion = await _mapController?.getVisibleRegion();
        if (visibleRegion != null) {
          LatLng centerLatLng = LatLng(
            (visibleRegion.northeast.latitude +
                    visibleRegion.southwest.latitude) /
                2,
            (visibleRegion.northeast.longitude +
                    visibleRegion.southwest.longitude) /
                2,
          );

          if (centerLatLng.latitude != 0.0 && centerLatLng.longitude != 0.0) {
            debugPrint('Center: $centerLatLng');
            callForReverseGeoCoding(
              centerLatLng.latitude,
              centerLatLng.longitude,
              (widget.chooseLocationFrom == ChooseLocationFrom.splash ||
                  widget.chooseLocationFrom == ChooseLocationFrom.home),
            );
          }
        }
      }
    });
  }

  _animateCameraToCurrentPosition(LatLng location) {
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: location,
          zoom: AppConfig.mapboxDefaultZoom,
          bearing: 0,
        ),
      ),
    );
  }

  listenOnLocationChanges() {
    _fetchLocationProvider!.locationStream.listen(
      (event) {
        if (_currentPosition == null && _mapController != null) {
          _currentPosition = LatLng(event.latitude, event.longitude);
          _animateCameraToCurrentPosition(_currentPosition!);
        } else {
          _currentPosition = LatLng(event.latitude, event.longitude);
        }
      },
    );
  }

  callForReverseGeoCoding(
    double? latitude,
    double? longitude,
    bool isCurrentLocation,
  ) {
    if (latitude != null &&
        longitude != null &&
        latitude > AppConfig.minLatLngToCallReverseGeoCoding &&
        longitude > AppConfig.minLatLngToCallReverseGeoCoding) {
      _selectedCoordinates = LatLng(latitude, longitude);
      _fetchLocationProvider?.doReverseGeoCoding(
        latitude,
        longitude,
        isCurrentLocation,
      );
    }
  }

  _saveArea(String? area) {
    if (area != null) {
      _fetchLocationProvider?.saveUserCurrentArea(area);
    }
  }

  _openHomeScreen() async {
    await _fetchLocationProvider?.saveUserCurrentLocation();
    Navigator.pushReplacementNamed(
      context,
      Routes.home,
    );
  }

  @override
  void dispose() {
    _fetchLocationProvider?.locationStreamController?.close();
    _mapController = null;
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeConfig.appBar(context),
      backgroundColor: StaticFunctions.getColor(
        context,
        ColorEnum.whiteColor,
      ),
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async =>
              (widget.chooseLocationFrom == ChooseLocationFrom.addProperty ||
                  widget.chooseLocationFrom == ChooseLocationFrom.addBuyer ||
                  widget.chooseLocationFrom == ChooseLocationFrom.home),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Stack(
                        children: [
                          MapboxMap(
                            styleString: AppConfig.mapboxStyle,
                            accessToken: AppConfig.mapboxAccessToken,
                            onMapCreated: _onMapCreated,
                            minMaxZoomPreference: const MinMaxZoomPreference(
                              AppConfig.minZoomLevel,
                              AppConfig.maxZoomLevel,
                            ),
                            initialCameraPosition: CameraPosition(
                              target: _currentPosition ?? LatLng(0, 0),
                              zoom: AppConfig.mapboxDefaultZoom,
                            ),
                          ),
                          Positioned(
                            bottom: Dimensions.currentLocationContainerMargin.w,
                            right: 0,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: Dimensions.screenHorizontalMargin.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Dimensions
                                      .currentLocationIconContainerRadius.r,
                                ),
                                color: StaticFunctions.getColor(
                                  context,
                                  ColorEnum.themeColor,
                                ),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: StaticFunctions.getColor(
                                    context,
                                    ColorEnum.touchSplashColor,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    Dimensions
                                        .currentLocationIconContainerRadius.r,
                                  ),
                                  onTap: () {
                                    if (_currentPosition != null) {
                                      debugPrint('$_currentPosition');
                                      _animateCameraToCurrentPosition(
                                        _currentPosition!,
                                      );
                                      callForReverseGeoCoding(
                                        _currentPosition?.latitude,
                                        _currentPosition?.longitude,
                                        true,
                                      );
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(
                                      Dimensions
                                          .currentLocationContainerPadding.w,
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        Strings.iconCurrentLocation,
                                        width: Dimensions
                                            .currentLocationIconSize.w,
                                        height: Dimensions
                                            .currentLocationIconSize.w,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: IgnorePointer(
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Center(
                                      child: Lottie.asset(
                                        Strings.markerAnimation,
                                        width: Dimensions
                                            .currentLocationMarkerAnimationSize
                                            .w,
                                        height: Dimensions
                                            .currentLocationMarkerAnimationSize
                                            .w,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: SvgPicture.asset(
                                      Strings.iconOrangeMarker,
                                      width: Dimensions
                                          .currentLocationMarkerSize.w,
                                      height: Dimensions
                                          .currentLocationMarkerSize.w,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: (widget.chooseLocationFrom ==
                                            ChooseLocationFrom.addProperty ||
                                        widget.chooseLocationFrom ==
                                            ChooseLocationFrom.addBuyer ||
                                        widget.chooseLocationFrom ==
                                            ChooseLocationFrom.home)
                                    ? (Dimensions.screenHorizontalMargin / 2).w
                                    : Dimensions.screenHorizontalMargin.w,
                                right: Dimensions.screenHorizontalMargin.w,
                                top: Dimensions.toolbarVerticalMargin.h,
                                bottom: Dimensions.toolbarVerticalMargin.h,
                              ),
                              child: Row(
                                // direction: Axis.horizontal,
                                children: [
                                  if (widget.chooseLocationFrom ==
                                          ChooseLocationFrom.addProperty ||
                                      widget.chooseLocationFrom ==
                                          ChooseLocationFrom.addBuyer ||
                                      widget.chooseLocationFrom ==
                                          ChooseLocationFrom.home)
                                    Container(
                                      width: Dimensions.toolbarBackArrowSize.w,
                                      height: Dimensions.toolbarBackArrowSize.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          Dimensions.toolbarRippleRadius.r,
                                        ),
                                      ),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          borderRadius: BorderRadius.circular(
                                            Dimensions.toolbarRippleRadius.r,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                              Dimensions
                                                  .toolbarBackArrowPadding.w,
                                            ),
                                            child: SvgPicture.asset(
                                              Strings.iconLeftArrow,
                                              width: Dimensions
                                                  .toolbarBackArrowSize.w,
                                              height: Dimensions
                                                  .toolbarBackArrowSize.w,
                                              color: StaticFunctions.getColor(
                                                context,
                                                ColorEnum.blackColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (widget.chooseLocationFrom ==
                                          ChooseLocationFrom.addProperty ||
                                      widget.chooseLocationFrom ==
                                          ChooseLocationFrom.addBuyer ||
                                      widget.chooseLocationFrom ==
                                          ChooseLocationFrom.home)
                                    SizedBox(
                                      width: Dimensions
                                          .toolbarTextIconBetweenSpace.w,
                                    ),
                                  Expanded(
                                    child: SearchWidget(
                                      searchHint:
                                          localizationsContext!.searchArea,
                                      onSearch: (String searchBy) {},
                                      focusNode: _searchFocusNode,
                                      onFocusChanged: (bool hasFocus) {
                                        if (hasFocus) {
                                          _searchFocusNode.unfocus();
                                          Navigator.pushNamed(
                                            context,
                                            Routes.searchArea,
                                          ).then(
                                            (value) {
                                              if (value != null &&
                                                  value
                                                      is RetrieveLocationArg) {
                                                if (value.useCurrentLocation ==
                                                    true) {
                                                  if (_fetchLocationProvider
                                                          ?.locationAddressAvailable ??
                                                      false) {
                                                    if (widget
                                                            .chooseLocationFrom ==
                                                        ChooseLocationFrom
                                                            .addProperty) {
                                                      Navigator.pop(
                                                        context,
                                                        RetrieveLocationArg(
                                                          areaName: _fetchLocationProvider
                                                                  ?.currentLocationAddress ??
                                                              localizationsContext!
                                                                  .unknownLocation,
                                                          coordinates:
                                                              _fetchLocationProvider
                                                                  ?.currentLocationLatLng,
                                                          landMarkLocationForLocationField:
                                                              _fetchLocationProvider
                                                                  ?.landMarkLocationForLocationField,
                                                        ),
                                                      );
                                                    } else if (widget
                                                            .chooseLocationFrom ==
                                                        ChooseLocationFrom
                                                            .splash) {
                                                      _openHomeScreen();
                                                    }
                                                  } else {
                                                    SnackBarView.showSnackBar(
                                                      context,
                                                      '${localizationsContext!.searchingForGPS}',
                                                    );
                                                  }
                                                } else {
                                                  if (widget
                                                          .chooseLocationFrom ==
                                                      ChooseLocationFrom
                                                          .addProperty) {
                                                    Navigator.pop(
                                                      context,
                                                      RetrieveLocationArg(
                                                        areaName:
                                                            value.areaName,
                                                        placeId: value.placeId,
                                                        landMarkLocationForLocationField:
                                                            value.areaName,
                                                      ),
                                                    );
                                                  } else if (widget
                                                          .chooseLocationFrom ==
                                                      ChooseLocationFrom
                                                          .splash) {
                                                    _saveArea(value.areaName);
                                                    _fetchLocationProvider
                                                        ?.callToRetrieveCoordinatesFromGooglePlaceId(
                                                      RetrieveLocationArg(
                                                        areaName:
                                                            value.areaName,
                                                        placeId: value.placeId,
                                                        landMarkLocationForLocationField:
                                                            _fetchLocationProvider
                                                                ?.landMarkLocationForLocationField,
                                                      ),
                                                      isNeedToSaveCurrentLocation:
                                                          true,
                                                    );
                                                    _openHomeScreen();
                                                  } else if (widget
                                                          .chooseLocationFrom ==
                                                      ChooseLocationFrom.home) {
                                                    final data =
                                                        RetrieveLocationArg(
                                                      areaName: value.areaName,
                                                      placeId: value.placeId,
                                                      landMarkLocationForLocationField:
                                                          _fetchLocationProvider
                                                              ?.landMarkLocationForLocationField,
                                                    );
                                                    _saveArea(value.areaName);
                                                    _fetchLocationProvider
                                                        ?.callToRetrieveCoordinatesFromGooglePlaceId(
                                                      data,
                                                      isNeedToSaveCurrentLocation:
                                                          true,
                                                    );
                                                    Navigator.pop(
                                                      context,
                                                      data,
                                                    );
                                                  }
                                                }
                                              }
                                            },
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Selector<LocationProvider, bool>(
                      selector: (_, state) => state.isMapCreated,
                      shouldRebuild: (prev, next) => true,
                      builder: (context, isMapCreated, child) {
                        return LoadingMapWidget(
                          isMapCreated: isMapCreated,
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      Dimensions.bottomSheetButtonRadius.h,
                    ),
                    topRight: Radius.circular(
                      Dimensions.bottomSheetButtonRadius.h,
                    ),
                  ),
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.themeColorOpacity3Percentage,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: Dimensions.screenHorizontalMargin.w,
                    right: Dimensions.screenHorizontalMargin.w,
                    top: Dimensions.screenHorizontalMargin.h,
                    bottom: Dimensions.screenHorizontalMargin.h,
                  ),
                  child: Text(
                    localizationsContext!.chooseLocationTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: Dimensions.bottomSheetTitleTextSize.sp,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.blackColor,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: Dimensions.currentLocationContentMargin.h,
                  bottom: Dimensions.screenVerticalMarginBottom.h,
                  left: Dimensions.screenHorizontalMargin.w,
                  right: Dimensions.screenHorizontalMargin.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Selector<FetchLocationProvider,
                        GoogleReverseGeoCodingResponseEntity?>(
                      selector: (_, state) => state.geoLocation,
                      builder: (context, response, child) {
                        String landMark = localizationsContext!.unknownLocation;
                        String address = localizationsContext!.unknownLocation;
                        String landMarkLocationForLocationField = '';
                        final list = response?.results;
                        final compoundCode = response?.plusCode?.compoundCode;
                        if (list != null && list.isNotEmpty) {
                          final formattedAddress = list[0].formattedAddress;
                          if (formattedAddress != null) {
                            List<String> parts = formattedAddress.split(',');
                            if (parts.isNotEmpty) {
                              landMark = parts[0];
                              landMarkLocationForLocationField = parts[0];
                              address = '';
                              if (parts.length == 1) {
                                address = parts[0];
                              } else {
                                for (int i = 0; i < parts.length; i++) {
                                  if (i != 0) {
                                    address += parts[i].trim();
                                    if (i != (parts.length - 1)) {
                                      address += ', ';
                                    }
                                  }
                                }
                              }
                              _selectedArea = address;
                            }
                          }
                        } else if (compoundCode != null &&
                            compoundCode.trim().isNotEmpty) {
                          List<String> parts = compoundCode.split(',');
                          if (parts.isNotEmpty) {
                            landMark = parts[0];
                            address = '';
                            if (parts.length == 1) {
                              address = parts[0];
                            } else {
                              for (int i = 0; i < parts.length; i++) {
                                if (i != 0) {
                                  address += parts[i].trim();
                                  if (i != (parts.length - 1)) {
                                    address += ', ';
                                  }
                                }
                              }
                            }
                          }
                          _selectedArea = compoundCode.trim();
                        }

                        // -------------------------------------------------
                        // To get city and country for landMarkLocationForLocationField
                        if (compoundCode != null &&
                            compoundCode.trim().isNotEmpty) {
                          List<String> parts = compoundCode.split(' ');
                          if (parts.isNotEmpty) {
                            if (parts.length == 1) {
                              landMarkLocationForLocationField += parts[0];
                            } else {
                              for (int i = 0; i < parts.length; i++) {
                                if (i != 0) {
                                  if (landMarkLocationForLocationField
                                          .trim()
                                          .isNotEmpty &&
                                      !landMarkLocationForLocationField
                                          .trim()
                                          .endsWith(',')) {
                                    landMarkLocationForLocationField += ', ';
                                  }
                                  landMarkLocationForLocationField +=
                                      ' ${parts[i].trim()}';
                                }
                              }
                            }
                          }
                          if (landMarkLocationForLocationField.endsWith(',')) {
                            landMarkLocationForLocationField =
                                landMarkLocationForLocationField.substring(
                                    0,
                                    (landMarkLocationForLocationField.length -
                                        1));
                          }
                        }
                        // -------------------------------------------------

                        _fetchLocationProvider
                            ?.setLandMarkLocationToUpdateField(
                          landMarkLocationForLocationField.trim(),
                        );
                        return LocationDetailContent(
                          locationContent: LocationContent(
                            landMark: landMark,
                            address: address,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: Dimensions.currentLocationContentMargin.h,
                    ),
                    Selector<FetchLocationProvider, bool>(
                      selector: (_, state) => state.locationAddressAvailable,
                      builder: (context, isEnabled, child) {
                        return ButtonWidget(
                          text: localizationsContext!.confirm,
                          textColor: StaticFunctions.getColor(
                            context,
                            isEnabled
                                ? ColorEnum.whiteColor
                                : ColorEnum.gray90Color,
                          ),
                          bgColor: StaticFunctions.getColor(
                            context,
                            isEnabled
                                ? ColorEnum.themeColor
                                : ColorEnum.themeColorOpacity3Percentage,
                          ),
                          borderColor: StaticFunctions.getColor(
                            context,
                            isEnabled
                                ? ColorEnum.themeColor
                                : ColorEnum.borderColorE0,
                          ),
                          fontWeight: FontWeight.w700,
                          onClick: () {
                            if (isEnabled) {
                              if (widget.chooseLocationFrom ==
                                      ChooseLocationFrom.addProperty ||
                                  widget.chooseLocationFrom ==
                                      ChooseLocationFrom.addBuyer) {
                                Navigator.pop(
                                  context,
                                  RetrieveLocationArg(
                                    areaName: _selectedArea ??
                                        localizationsContext!.unknownLocation,
                                    coordinates: _selectedCoordinates,
                                    landMarkLocationForLocationField:
                                        _fetchLocationProvider
                                            ?.landMarkLocationForLocationField,
                                  ),
                                );
                              } else if (widget.chooseLocationFrom ==
                                  ChooseLocationFrom.splash) {
                                _openHomeScreen();
                              } else if (widget.chooseLocationFrom ==
                                  ChooseLocationFrom.home) {
                                _fetchLocationProvider
                                    ?.saveUserCurrentLocation();
                                Navigator.pop(context);
                              }
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
