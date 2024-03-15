import 'dart:async';

import 'package:flutter/material.dart';

import '../../localdb/isar_service.dart';
import '../../network/dio_client.dart';
import '../../utils/app_config.dart';
import '../../utils/static_functions.dart';
import '../settings/api_request/settings_api_request.dart';

class ConfigOptionsProvider extends ChangeNotifier {
  final isarService = IsarService();
  final TextEditingController nearByDistanceFieldController =
      TextEditingController();
  final TextEditingController mySearchDistanceFieldController =
      TextEditingController();
  final TextEditingController brooonDistanceFieldController =
      TextEditingController();
  Timer? debounce;
  bool isNeedToUpdateDataToServer = false;

  init() {
    if (StaticFunctions.userInfo?.nearByDistance != null) {
      nearByDistanceFieldController.text =
          StaticFunctions.userInfo!.nearByDistance.toInt().toString();
    }
    if (StaticFunctions.userInfo?.privateSearchDistance != null) {
      mySearchDistanceFieldController.text =
          StaticFunctions.userInfo!.privateSearchDistance.toInt().toString();
    }
    if (StaticFunctions.userInfo?.brooonSearchDistance != null) {
      brooonDistanceFieldController.text =
          StaticFunctions.userInfo!.brooonSearchDistance.toInt().toString();
    }
  }

  updateNearByDistance(int value, bool updatingFromButtons) async {
    isNeedToUpdateDataToServer = true;
    if (updatingFromButtons) {
      if (value == 0) {
        nearByDistanceFieldController.text = '';
      } else {
        nearByDistanceFieldController.text = value.toString();
        StaticFunctions.fieldCursorPositionAtLast(
          nearByDistanceFieldController,
        );
      }
    }
    if (StaticFunctions.userInfo != null) {
      final value = nearByDistanceFieldController.text.trim();
      double distance = AppConfig.defaultNearByDistance;
      if (value.isNotEmpty) {
        distance = double.tryParse(value) ?? distance;
      }
      StaticFunctions.userInfo!.nearByDistance = distance;
      await isarService.saveOrUpdateUserInfo(StaticFunctions.userInfo!);
      _updateSettingsToServer();
    }
  }

  updateMySearchDistance(int value, bool updatingFromButtons) async {
    isNeedToUpdateDataToServer = true;
    if (updatingFromButtons) {
      if (value == 0) {
        mySearchDistanceFieldController.text = '';
      } else {
        mySearchDistanceFieldController.text = value.toString();
        StaticFunctions.fieldCursorPositionAtLast(
          mySearchDistanceFieldController,
        );
      }
    }
    if (StaticFunctions.userInfo != null) {
      final value = mySearchDistanceFieldController.text.trim();
      double distance = AppConfig.defaultPrivateSearchDistance;
      if (value.isNotEmpty) {
        distance = double.tryParse(value) ?? distance;
      }
      StaticFunctions.userInfo!.privateSearchDistance = distance;
      await isarService.saveOrUpdateUserInfo(StaticFunctions.userInfo!);
      _updateSettingsToServer();
    }
  }

  updateBrooonSearchDistance(int value, bool updatingFromButtons) async {
    isNeedToUpdateDataToServer = true;
    if (updatingFromButtons) {
      if (value == 0) {
        brooonDistanceFieldController.text = '';
      } else {
        brooonDistanceFieldController.text = value.toString();
        StaticFunctions.fieldCursorPositionAtLast(
          brooonDistanceFieldController,
        );
      }
    }
    if (StaticFunctions.userInfo != null) {
      final value = brooonDistanceFieldController.text.trim();
      double distance = AppConfig.defaultBrooonSearchDistance;
      if (value.isNotEmpty) {
        distance = double.tryParse(value) ?? distance;
      }
      StaticFunctions.userInfo!.brooonSearchDistance = distance;
      await isarService.saveOrUpdateUserInfo(StaticFunctions.userInfo!);
      _updateSettingsToServer();
    }
  }

  _updateSettingsToServer() {
    if (debounce?.isActive ?? false) {
      debounce?.cancel();
    }
    debounce = Timer(
      const Duration(
        milliseconds: 2000,
      ),
      () {
        callApiToUpdateSettings();
      },
    );
  }

  callApiToUpdateSettings() async {
    isNeedToUpdateDataToServer = false;
    final response = await DioClient().updateSettings(
      SettingsApiRequest().toMap(
        SettingsApiRequest()
          ..nearByDistance = StaticFunctions.userInfo!.nearByDistance
          ..mySearchDistance = StaticFunctions.userInfo!.privateSearchDistance
          ..brooonSearchDistance =
              StaticFunctions.userInfo!.brooonSearchDistance,
      ),
    );
    if (response == null) {
      isNeedToUpdateDataToServer = true;
    }
  }
}
