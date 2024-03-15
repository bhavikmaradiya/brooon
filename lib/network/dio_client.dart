import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

import './interceptors/interceptors.dart';
import './network.dart';
import './network_connectivity.dart';
import './refresh_token/refresh_token_response_entity.dart';
import '../const/string_const.dart';
import '../generated/json/base/json_convert_content.dart';
import '../localdb/save_default_data.dart';
import '../utils/app_config.dart';
import '../utils/static_functions.dart';
import '../views/add_buyer/api_response/add_buyer_response_entity.dart';
import '../views/add_property/api_response/add_property_response_entity.dart';
import '../views/app_feedback/api_response/app_feedback_response_entity.dart';
import '../views/app_update/api_response/ios_app_update_response_entity.dart';
import '../views/authentication/api_response/auth_response_entity.dart';
import '../views/authentication/api_response/logout_response_entity.dart';
import '../views/backup/api_response/upload_backup_info_response_entity.dart';
import '../views/blocked_broooners/api_response/blocked_broooners_response_entity.dart';
import '../views/choose_location/api_response/google_places_details_response_entity.dart';
import '../views/choose_location/api_response/google_places_response_entity.dart';
import '../views/choose_location/api_response/google_reverse_geo_coding_response_entity.dart';
import '../views/choose_location/api_response/update_location_response_entity.dart';
import '../views/home/api_response/check_user_verify_response_entity.dart';
import '../views/inquiry_details/api_response/inquiry_status_response_entity.dart';
import '../views/profile/api_response/update_profile_response_entity.dart';
import '../views/property_details/api_response/property_status_response_entity.dart';
import '../views/report/api_response/report_response_entity.dart';
import '../views/settings/api_response/add_settings_response_entity.dart';
import '../views/shared_by_brooon/api_response/block_unblock_broker_response_entity.dart';
import '../views/shared_by_brooon/api_response/brooon_matching_inquiry_response_entity.dart';
import '../views/shared_by_brooon/api_response/shared_by_brooon_inquiry_response_entity.dart';
import '../views/shared_by_brooon/api_response/shared_by_brooon_matching_response_entity.dart';
import '../views/shared_by_brooon/api_response/shared_by_brooon_property_response_entity.dart';
import '../views/subscription/api_response/add_subscription_response_entity.dart';
import '../views/subscription/api_response/check_purchase_response_entity.dart';
import '../views/subscription/api_response/purchase_history_response_entity.dart';
import '../views/subscription/api_response/subscription_plans_response_entity.dart';
import '../views/watermark/api_response/add_watermark_response_entity.dart';

class DioClient {
  static const _code200 = 200; // success
  static const _code401 = 401; // unAuthorized
  static const _code403 = 403; // Forbidden

  late final Dio _dio;
  late final Dio _dioLocationApi;
  late final Dio _dioAppleApi;

  static bool isUserUnAuthorized(int? statusCode) {
    return statusCode == _code401 || statusCode == _code403;
  }

  DioClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: Endpoints.baseURL,
            connectTimeout: const Duration(
              seconds: Endpoints.connectionTimeout,
            ),
            receiveTimeout: const Duration(
              seconds: Endpoints.receiveTimeout,
            ),
            responseType: ResponseType.json,
            validateStatus: (_) => true,
          ),
        )..interceptors.addAll(
            [
              LoggerInterceptor(),
              AuthorizationInterceptor(),
            ],
          );

  DioClient.locationApi()
      : _dioLocationApi = Dio(
          BaseOptions(
            connectTimeout: const Duration(
              seconds: Endpoints.connectionTimeout,
            ),
            receiveTimeout: const Duration(
              seconds: Endpoints.receiveTimeout,
            ),
            responseType: ResponseType.json,
            validateStatus: (_) => true,
          ),
        )..interceptors.addAll(
            [
              LoggerInterceptor(),
            ],
          );

  DioClient.appleApi()
      : _dioAppleApi = Dio(
          BaseOptions(
            connectTimeout: const Duration(
              seconds: Endpoints.connectionTimeout,
            ),
            receiveTimeout: const Duration(
              seconds: Endpoints.receiveTimeout,
            ),
            responseType: ResponseType.json,
            validateStatus: (_) => true,
          ),
        )..interceptors.addAll(
            [
              LoggerInterceptor(),
            ],
          );

  Future<GoogleReverseGeoCodingResponseEntity?> fetchAddressFromLocation(
    double latitude,
    double longitude,
  ) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return null;
    }
    try {
      // Ref. https://developers.google.com/maps/documentation/geocoding/requests-reverse-geocoding
      final response = await _dioLocationApi.get(
        Endpoints.googleReverseGeoCodingApiBaseUrl,
        queryParameters: {
          'latlng': '$latitude,$longitude',
          'key': AppConfig.googlePlacesKey,
          'result_type': 'point_of_interest',
        },
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<GoogleReverseGeoCodingResponseEntity>(
            data);
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<GooglePlacesResponseEntity?> findPlaces(String placeName) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return null;
    }
    try {
      // Ref. https://developers.google.com/maps/documentation/places/web-service/search-find-place
      final response = await _dioLocationApi.get(
        Endpoints.googleSearchPlacesApiBaseUrl,
        queryParameters: {
          'input': placeName,
          'key': AppConfig.googlePlacesKey,
          'inputtype': 'textquery',
        },
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<GooglePlacesResponseEntity>(data);
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<GooglePlacesDetailsResponseEntity?> findPlacesDetail(
    String placeId,
  ) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return null;
    }
    try {
      // Ref. https://developers.google.com/maps/documentation/places/web-service/details
      final response = await _dioLocationApi.get(
        Endpoints.googleSearchPlacesDetailsApiBaseUrl,
        queryParameters: {
          'fields': 'geometry',
          'place_id': placeId,
          'key': AppConfig.googlePlacesKey,
          'inputtype': 'textquery',
        },
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<GooglePlacesDetailsResponseEntity>(data);
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<Response<dynamic>> retryApiAfterRefreshToken(
    RequestOptions requestOptions,
  ) async {
    // Ref. https://github.com/cfug/dio/issues/482
    // https://stackoverflow.com/a/51106300/5370550
    final options = new Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    if (requestOptions.data is FormData) {
      FormData formData = FormData();
      formData.fields.addAll(requestOptions.data.fields);
      for (MapEntry mapFile in requestOptions.data.files) {
        formData.files.add(
          MapEntry(
            mapFile.key,
            await MultipartFile.fromFile(
              (mapFile.value as MultipartFile).filename ?? '',
              filename: '${(mapFile.value as MultipartFile).filename}',
            ),
          ),
        );
      }
      requestOptions.data = formData;
    }
    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<AuthResponseEntity?> login(String mobileNo, String firebaseUId) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return null;
    }
    try {
      Map<String, dynamic> body = {
        'mobile_number': mobileNo,
        'firebase_user_id': firebaseUId,
      };
      final response = await _dio.post(
        Endpoints.loginEndPoint,
        data: json.encode(body),
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<AuthResponseEntity>(data);
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<RefreshTokenResponseEntity?> refreshToken() async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return null;
    }
    try {
      Map<String, dynamic> body = {
        'refresh_token': StaticFunctions.userInfo?.refreshToken ?? '',
      };
      final response = await _dio.post(
        Endpoints.refreshTokenEndPoint,
        data: json.encode(body),
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<RefreshTokenResponseEntity>(data);
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<UploadBackupInfoResponseEntity?> uploadBackupInfo(
    Map<String, dynamic> requestBody,
  ) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return null;
    }
    try {
      final response = await _dio.post(
        Endpoints.uploadBackupEndPoint,
        data: json.encode(requestBody),
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<UploadBackupInfoResponseEntity>(data);
      } else {
        return UploadBackupInfoResponseEntity()..code = response.statusCode;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<UpdateProfileResponseEntity?> updateProfileInfo({
    String? firstName,
    String? lastName,
    String? email,
    String? gender,
    String? picPath,
    String? associationId,
    bool isProfileDeleted = false,
  }) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return null;
    }
    try {
      Map<String, dynamic> body = {
        'first_name': firstName ?? '',
        'last_name': lastName ?? '',
        'email': email ?? '',
        'gender': gender ?? '',
        'profile_delete': isProfileDeleted,
        'association_id': associationId,
      };

      if (picPath != null && picPath.trim().isNotEmpty) {
        body['profile_pic'] = await MultipartFile.fromFile(
          picPath,
          filename: basename(picPath),
          contentType: MediaType(
            'image',
            Strings.jpgFileExtension,
          ),
        );
      }
      FormData formData = FormData.fromMap(body);

      final response = await _dio.post(
        Endpoints.uploadProfileInfoEndPoint,
        data: formData,
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<UpdateProfileResponseEntity>(data);
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<UpdateLocationResponseEntity?> updateLocationInfo(
    double? latitude,
    double? longitude,
    String? address,
  ) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return null;
    }
    try {
      Map<String, dynamic> body = {
        'latitude': latitude,
        'longitude': longitude,
        'address': address,
      };
      final response = await _dio.post(
        Endpoints.uploadLocationEndPoint,
        data: json.encode(body),
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<UpdateLocationResponseEntity>(data);
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<AddSettingsResponseEntity?> updateSettings(
    Map<String, dynamic> requestBody,
  ) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return null;
    }
    try {
      final response = await _dio.post(
        Endpoints.addSettingsEndPoint,
        data: json.encode(requestBody),
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<AddSettingsResponseEntity>(data);
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<AddWatermarkResponseEntity?> updateWatermark({
    String? watermarkType,
    String? watermarkText,
    String? watermarkLogoPath,
  }) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return null;
    }
    try {
      Map<String, dynamic> body = {
        'watermark_type': watermarkType ?? '',
      };
      if (watermarkType == SaveDefaultData.watermarkTypeTextString) {
        body['watermark_text'] = watermarkText;
      } else if (watermarkType == SaveDefaultData.watermarkTypeImageString &&
          watermarkLogoPath != null &&
          watermarkLogoPath.trim().isNotEmpty) {
        body['watermark_image'] = await MultipartFile.fromFile(
          watermarkLogoPath,
          filename: basename(watermarkLogoPath),
          contentType: MediaType(
            'image',
            extension(watermarkLogoPath),
          ),
        );
      }
      FormData formData = FormData.fromMap(body);
      final response = await _dio.post(
        Endpoints.addWaterMarkEndPoint,
        data: formData,
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<AddWatermarkResponseEntity>(data);
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<AddPropertyResponseEntity?> uploadPropertyInfo(
    Map<String, dynamic> requestBody,
  ) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return null;
    }
    try {
      final response = await _dio.post(
        Endpoints.addPropertyEndPoint,
        data: json.encode(requestBody),
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<AddPropertyResponseEntity>(data);
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<AddBuyerResponseEntity?> uploadInquiryInfo(
    Map<String, dynamic> requestBody,
  ) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return null;
    }
    try {
      final response = await _dio.post(
        Endpoints.addInquiryEndPoint,
        data: json.encode(requestBody),
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<AddBuyerResponseEntity>(data);
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<SubscriptionPlansResponseEntity?> getSubscriptionPlans() async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return null;
    }
    try {
      final response = await _dio.get(Endpoints.subscriptionPlansEndPoint);
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<SubscriptionPlansResponseEntity>(data);
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<PurchaseHistoryResponseEntity?> getPurchaseHistory() async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return null;
    }
    try {
      final response = await _dio.get(Endpoints.purchaseHistoryEndPoint);
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<PurchaseHistoryResponseEntity>(data);
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<CheckPurchaseResponseEntity?> checkPurchase() async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return null;
    }
    try {
      final response = await _dio.get(Endpoints.checkPurchaseEndPoint);
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<CheckPurchaseResponseEntity>(data);
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<AddSubscriptionResponseEntity?> addSubscription({
    required Map<String, dynamic> requestBody,
    required AppLocalizations localization,
  }) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return AddSubscriptionResponseEntity()
        ..success = false
        ..message = localization.noInternetSnackBarMessage;
    }
    try {
      final response = await _dio.post(
        Endpoints.addSubscriptionEndPoint,
        data: json.encode(requestBody),
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<AddSubscriptionResponseEntity>(data);
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<PropertyStatusResponseEntity?> updatePropertyStatus(
    Map<String, dynamic> body,
  ) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return null;
    }
    try {
      final response = await _dio.post(
        Endpoints.syncPropertyStatusEndPoint,
        data: json.encode(body),
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<PropertyStatusResponseEntity>(data);
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<InquiryStatusResponseEntity?> updateInquiryStatus(
    Map<String, dynamic> body,
  ) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return null;
    }
    try {
      final response = await _dio.post(
        Endpoints.syncInquiryStatusEndPoint,
        data: json.encode(body),
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<InquiryStatusResponseEntity>(data);
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<SharedByBrooonPropertyResponseEntity?> getSharedByBrooonsProperty(
    int page,
    int limit,
  ) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return SharedByBrooonPropertyResponseEntity()
        ..success = false
        ..isNoInternet = true;
    }
    try {
      Map<String, dynamic> queryParams = {
        "page": page,
        "limit": limit,
      };

      final response = await _dio.get(
        Endpoints.sharedByBrooonersPropertyEndPoint,
        queryParameters: queryParams,
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<SharedByBrooonPropertyResponseEntity>(
          data,
        );
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<SharedByBrooonInquiryResponseEntity?> getSharedByBrooonsInquiry(
    int page,
    int limit,
  ) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return SharedByBrooonInquiryResponseEntity()
        ..success = false
        ..isNoInternet = true;
    }
    try {
      Map<String, dynamic> queryParams = {
        "page": page,
        "limit": limit,
      };

      final response = await _dio.get(
        Endpoints.sharedByBrooonersInquiryEndPoint,
        queryParameters: queryParams,
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<SharedByBrooonInquiryResponseEntity>(
          data,
        );
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<SharedByBrooonInquiryResponseEntity?> filterSharedByBrooonsInquiry(
    int page,
    int limit,
    Map<String, dynamic> requestBody,
  ) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return SharedByBrooonInquiryResponseEntity()
        ..success = false
        ..isNoInternet = true;
    }
    try {
      final response = await _dio.post(
        Endpoints.sharedByBrooonersFilterInquiryEndPoint +
            "?page=$page&limit=$limit",
        data: json.encode(requestBody),
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<SharedByBrooonInquiryResponseEntity>(
          data,
        );
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<SharedByBrooonPropertyResponseEntity?> filterSharedByBrooonsProperty(
    int page,
    int limit,
    Map<String, dynamic> requestBody,
  ) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return SharedByBrooonPropertyResponseEntity()
        ..success = false
        ..isNoInternet = true;
    }
    try {
      final response = await _dio.post(
        Endpoints.sharedByBrooonersFilterPropertyEndPoint +
            "?page=$page&limit=$limit",
        data: json.encode(requestBody),
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<SharedByBrooonPropertyResponseEntity>(
          data,
        );
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<AppFeedbackResponseEntity?> submitFeedback(String message) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return null;
    }
    try {
      Map<String, dynamic> body = {
        'message': message,
      };
      final response = await _dio.post(
        Endpoints.feedbackEndPoint,
        data: json.encode(body),
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<AppFeedbackResponseEntity>(
          data,
        );
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<IosAppUpdateResponseEntity?> getAppVersionForIos(
    String bundleId,
  ) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return null;
    }
    try {
      final response = await _dioAppleApi.get(
        Endpoints.iOSInAppUpdateEndPoint,
        queryParameters: {
          'bundleId': bundleId,
        },
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<IosAppUpdateResponseEntity>(data);
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<ReportResponseEntity?> reportProperty({
    String? propertyId,
    String? inquiryId,
    String? reason,
  }) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return ReportResponseEntity();
    }
    try {
      Map<String, dynamic> body = {
        'type': 'Report',
      };
      if (propertyId != null) {
        body['property_id'] = propertyId;
      }
      if (inquiryId != null) {
        body['inquiry_id'] = inquiryId;
      }
      if (reason != null) {
        body['reason'] = reason;
      }
      final response = await _dio.post(
        Endpoints.reportEndPoint,
        data: json.encode(body),
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<ReportResponseEntity>(
          data,
        );
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<BlockUnblockBrokerResponseEntity?> blockBroker({
    required int brooonId,
    required String brooonCode,
  }) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return BlockUnblockBrokerResponseEntity();
    }
    try {
      Map<String, dynamic> body = {
        'block_ids': List.of([
          {
            'brooon_id': brooonId,
            'brooon_code': brooonCode,
          }
        ]),
      };

      final response = await _dio.post(
        Endpoints.blockBrooonerEndPoint,
        data: json.encode(body),
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<BlockUnblockBrokerResponseEntity>(
          data,
        );
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<BlockUnblockBrokerResponseEntity?> unblockBroker({
    required int brooonId,
    required String brooonCode,
  }) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return BlockUnblockBrokerResponseEntity();
    }
    try {
      Map<String, dynamic> body = {
        'unblock_ids': List.of([
          {
            'brooon_id': brooonId,
            'brooon_code': brooonCode,
          }
        ]),
      };

      final response = await _dio.post(
        Endpoints.unblockBrooonerEndPoint,
        data: json.encode(body),
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<BlockUnblockBrokerResponseEntity>(
          data,
        );
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<BlockedBrooonersResponseEntity?> getBlockedBroooners(
    int page,
    int limit,
  ) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return BlockedBrooonersResponseEntity();
    }
    try {
      Map<String, dynamic> queryParams = {
        "page": page,
        "limit": limit,
      };

      final response = await _dio.get(
        Endpoints.blockedBrooonerListEndPoint,
        queryParameters: queryParams,
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<BlockedBrooonersResponseEntity>(
          data,
        );
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<BrooonMatchingInquiryResponseEntity?>
      filterSharedByBrooonsMatchingInquiry(
    List<dynamic> requestBody,
  ) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return BrooonMatchingInquiryResponseEntity()
        ..success = false
        ..isNoInternet = true;
    }
    try {
      final response = await _dio.post(
        Endpoints.sharedByBrooonersMatchingInquiriesEndPoint,
        data: json.encode(requestBody),
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<BrooonMatchingInquiryResponseEntity>(
          data,
        );
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<SharedByBrooonMatchingResponseEntity?>
      filterSharedByBrooonsMatchingProperty(
    List<dynamic> requestBody,
  ) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return SharedByBrooonMatchingResponseEntity()
        ..success = false
        ..isNoInternet = true;
    }
    try {
      final response = await _dio.post(
        Endpoints.sharedByBrooonersMatchingPropertiesEndPoint,
        data: json.encode(requestBody),
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<SharedByBrooonMatchingResponseEntity>(
          data,
        );
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<CheckUserVerifyResponseEntity?> checkUserIsVerified() async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return null;
    }
    try {
      final response = await _dio.get(Endpoints.checkUserVerifyEndPoint);
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<CheckUserVerifyResponseEntity>(data);
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<LogoutResponseEntity?> logout() async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      return null;
    }
    try {
      Map<String, dynamic> body = {};
      final response = await _dio.post(
        Endpoints.logoutEndPoint,
        data: json.encode(body),
      );
      if (response.statusCode == _code200) {
        var data = response.data;
        return JsonConvert.fromJsonAsT<LogoutResponseEntity>(data);
      } else {
        return null;
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      if (kDebugMode) print(errorMessage);
      return null;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }
}
