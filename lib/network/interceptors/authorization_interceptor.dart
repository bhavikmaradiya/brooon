import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/logger.dart';

import '../../const/routes.dart';
import '../../const/string_const.dart';
import '../../localdb/isar_service.dart';
import '../../main.dart';
import '../../utils/static_functions.dart';
import '../../widgets/dialog_widget.dart';
import '../dio_client.dart';
import '../endpoints.dart';

//* Request methods PUT, POST, PATCH, DELETE needs access token,
//* which needs to be passed with "Authorization" header as Bearer token.
class AuthorizationInterceptor extends QueuedInterceptor {
  static bool _isSessionTokenShowing = false;
  static const _headerKeyAuthorization = 'Authorization';
  static const _headerKeyAuthorizationBearerPrefix = 'Bearer ';
  static const _headerKeyContentType = 'Content-Type';
  static const _headerKeyDeviceType = 'device_type';
  static const _headerKeyDeviceName = 'device_name';
  static const _headerKeyDeviceVersion = 'device_version';
  static const _headerKeyAppVersion = 'app_version';
  static const _headerKeyFcmToken = 'fcm_token';

  Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 75,
      colors: true,
      printEmojis: true,
      printTime: false,
    ),
  );

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.path != Endpoints.loginEndPoint ||
        options.path != Endpoints.refreshTokenEndPoint) {
      final service = IsarService();
      final userInfo = StaticFunctions.userInfo != null
          ? StaticFunctions.userInfo!
          : await service.getUserInfo();
      options.headers[_headerKeyAuthorization] =
          '$_headerKeyAuthorizationBearerPrefix${userInfo?.accessToken}';
    }
    if (options.path == Endpoints.uploadProfileInfoEndPoint) {
      options.headers[_headerKeyContentType] = 'multipart/form-data';
    }
    options.headers[_headerKeyDeviceType] = kIsWeb
        ? 'Web'
        : Platform.isAndroid
            ? 'Android'
            : Platform.isIOS
                ? 'iOS'
                : '';
    options.headers[_headerKeyDeviceName] =
        (StaticFunctions.deviceName ?? '').isNotEmpty
            ? StaticFunctions.deviceName
            : await StaticFunctions.getDeviceName();
    options.headers[_headerKeyDeviceVersion] =
        await StaticFunctions.getDeviceOs();
    options.headers[_headerKeyAppVersion] =
        await StaticFunctions.getAppVersion();
    if (options.path != Endpoints.logoutEndPoint) {
      options.headers[_headerKeyFcmToken] = (StaticFunctions.fcmToken != null &&
              StaticFunctions.fcmToken!.trim().isNotEmpty)
          ? StaticFunctions.fcmToken
          : await StaticFunctions.getFirebaseDeviceToken();
    } else {
      options.headers[_headerKeyFcmToken] = null;
    }
    logger.i('Headers => ${options.headers}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    bool isResponseNeedToReturn = true;
    if (_needToCallRefreshToken(response.statusCode, response.requestOptions)) {
      // Ref. https://stackoverflow.com/questions/56740793/using-interceptor-in-dio-for-flutter-to-refresh-token
      final refreshResponse = await _refreshToken();
      if (refreshResponse) {
        isResponseNeedToReturn = false;
        final requestOpt = response.requestOptions;
        if (requestOpt.headers.containsKey(_headerKeyAuthorization)) {
          requestOpt.headers[_headerKeyAuthorization] =
              '$_headerKeyAuthorizationBearerPrefix${StaticFunctions.userInfo?.accessToken}';
        }
        handler.resolve(
          await DioClient().retryApiAfterRefreshToken(
            response.requestOptions,
          ),
        );
      }
    }
    if (isResponseNeedToReturn) {
      return super.onResponse(response, handler);
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    return super.onError(err, handler);
  }

  _needToCallRefreshToken(int? statusCode, RequestOptions requestOptions) {
    if (DioClient.isUserUnAuthorized(statusCode)) {
      if (requestOptions.path == Endpoints.loginEndPoint ||
          requestOptions.path == Endpoints.logoutEndPoint) {
        // No need to call refresh token if login & logout APIs.
        return false;
      } else if (requestOptions.path == Endpoints.refreshTokenEndPoint) {
        _notifyToShowReLoginDialogAsTokenExpired();
        return false;
      }
      return true;
    }
    return false;
  }

  Future<bool> _refreshToken() async {
    final data = await DioClient().refreshToken();
    if (data?.data?.accessToken != null) {
      // save tokens to local db
      final isarService = IsarService();
      final userInfo = await isarService.getUserInfo();
      if (userInfo != null) {
        userInfo.accessToken = data?.data?.accessToken ?? '';
        await isarService.saveOrUpdateUserInfo(userInfo);
      }
      return true;
    } else {
      _notifyToShowReLoginDialogAsTokenExpired();
    }
    return false;
  }

  _notifyToShowReLoginDialogAsTokenExpired() async {
    // show dialog and ask user to re login
    StaticFunctions.cancelFlagsOnLogoutOrSessionTimeOut(IsarService());
    BuildContext? context = navigatorKey.currentContext;
    if (context != null && !_isSessionTokenShowing) {
      _isSessionTokenShowing = true;
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          AppLocalizations localizationsContext = AppLocalizations.of(context)!;
          return DialogWidget(
            title: localizationsContext.tokenExpired,
            icon: Strings.iconSessionTimeout,
            positiveButton: localizationsContext.tokenExpiredReLogin,
            isDialogCancellable: false,
            onPositiveButtonClick: () async {
              _isSessionTokenShowing = false;
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.authenticationRoute,
                (route) => false,
              );
            },
          );
        },
      );
    }
  }
}
