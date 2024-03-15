import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import './api_request/settings_api_request.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/save_default_data.dart';
import '../../localdb/settings/db_settings.dart';
import '../../network/dio_client.dart';
import '../../utils/file_utils.dart';
import '../../utils/notification_helper.dart';
import '../../utils/static_functions.dart';

class SettingsProvider extends ChangeNotifier {
  List<DbSetting> settingsList = [];
  final _isarService = IsarService();
  String appVersion = '';

  Future initializeSettings(context, localization) async {
    settingsList = await _isarService.getSettings();
    _getAppVersion();
    notifyListeners();
  }

  Future<void> onCheckChangedListener(int which, bool isChecked) async {
    bool isAllShareEnabledDisabled = false;
    bool isNotificationEnabledDisabled = false;
    DbSetting model =
        settingsList.firstWhere((element) => element.settingId == which);
    model.isChecked = isChecked;
    if (which == SaveDefaultData.settingNotificationId) {
      isNotificationEnabledDisabled = true;
      List<DbSetting> settings = [];
      settings.add(model);
      settings.add(
        settingsList.firstWhere((element) =>
            element.settingId == SaveDefaultData.settingAppReminderId)
          ..isChecked = isChecked,
      );
      settings.add(
        settingsList.firstWhere((element) =>
            element.settingId == SaveDefaultData.settingPublicPropertyId)
          ..isChecked = isChecked,
      );
      await _isarService.saveSettings(settings);
    } else if (which == SaveDefaultData.settingShareId) {
      isAllShareEnabledDisabled = true;
      List<DbSetting> settings = [];
      settings.add(model);
      settings.add(
        settingsList.firstWhere((element) =>
            element.settingId == SaveDefaultData.settingShareBasicDetailsId)
          ..isChecked = isChecked,
      );
      settings.add(
        settingsList.firstWhere((element) =>
            element.settingId == SaveDefaultData.settingShareOtherDetailsId)
          ..isChecked = isChecked,
      );
      settings.add(
        settingsList.firstWhere((element) =>
            element.settingId == SaveDefaultData.settingShareImagesId)
          ..isChecked = isChecked,
      );
      settings.add(
        settingsList.firstWhere((element) =>
            element.settingId == SaveDefaultData.settingShareWatermarkId)
          ..isChecked = isChecked,
      );
      settings.add(
        settingsList.firstWhere((element) =>
            element.settingId == SaveDefaultData.settingShareLogoId)
          ..isChecked = isChecked,
      );
      await _isarService.saveSettings(settings);
    } else {
      if (_isNotificationSubMenus(model)) {
        isNotificationEnabledDisabled =
            await _checkForNotificationAreEnabledDisabled();
      } else if (_isShareSubMenus(model)) {
        isAllShareEnabledDisabled = await _checkForAllShareAreEnabledDisabled();
      }
      await _isarService.updateSetting(model);
    }
    _updateAppFeature(
      which,
      isAllShareEnabledDisabled,
      isNotificationEnabledDisabled,
    );
    updateSettingsToServer(
      which,
      isAllShareEnabledDisabled,
      isNotificationEnabledDisabled,
    );
  }

  bool _isNotificationSubMenus(DbSetting element) {
    return element.settingId == SaveDefaultData.settingPublicPropertyId ||
        element.settingId == SaveDefaultData.settingAppReminderId;
  }

  bool _isShareSubMenus(DbSetting element) {
    return element.settingId == SaveDefaultData.settingShareBasicDetailsId ||
        element.settingId == SaveDefaultData.settingShareOtherDetailsId ||
        element.settingId == SaveDefaultData.settingShareImagesId ||
        element.settingId == SaveDefaultData.settingShareLogoId ||
        element.settingId == SaveDefaultData.settingShareWatermarkId;
  }

  Future<bool> _checkForAllShareAreEnabledDisabled() async {
    final totalSharedFeatureCount = 5;
    int totalSharedFeatureEnabled = 0;
    int totalSharedFeatureDisabled = 0;
    settingsList.forEach(
      (element) {
        if (_isShareSubMenus(element)) {
          if (element.isChecked) {
            totalSharedFeatureEnabled += 1;
          } else {
            totalSharedFeatureDisabled += 1;
          }
        }
      },
    );
    if (totalSharedFeatureCount == totalSharedFeatureEnabled) {
      DbSetting model = settingsList.firstWhere(
        (element) => element.settingId == SaveDefaultData.settingShareId,
      );
      model.isChecked = true;
      await _isarService.updateSetting(model);
      return true;
    } else if (totalSharedFeatureCount == totalSharedFeatureDisabled) {
      DbSetting model = settingsList.firstWhere(
        (element) => element.settingId == SaveDefaultData.settingShareId,
      );
      model.isChecked = false;
      await _isarService.updateSetting(model);
      return true;
    }
    return false;
  }

  Future<bool> _checkForNotificationAreEnabledDisabled() async {
    final totalNotificationFeatureCount = 2;
    int totalNotificationFeatureEnabled = 0;
    int totalNotificationFeatureDisabled = 0;
    settingsList.forEach(
      (element) {
        if (_isNotificationSubMenus(element)) {
          if (element.isChecked) {
            totalNotificationFeatureEnabled += 1;
          } else {
            totalNotificationFeatureDisabled += 1;
          }
        }
      },
    );
    if (totalNotificationFeatureCount == totalNotificationFeatureEnabled) {
      DbSetting model = settingsList.firstWhere((element) =>
          element.settingId == SaveDefaultData.settingNotificationId);
      model.isChecked = true;
      await _isarService.updateSetting(model);
      return true;
    } else if (totalNotificationFeatureCount ==
        totalNotificationFeatureDisabled) {
      DbSetting model = settingsList.firstWhere((element) =>
          element.settingId == SaveDefaultData.settingNotificationId);
      model.isChecked = false;
      await _isarService.updateSetting(model);
      return true;
    }
    return false;
  }

  _updateAppFeature(
    int which,
    bool isAllShareEnabledDisabled,
    bool isNotificationEnabledDisabled,
  ) async {
    if (which == SaveDefaultData.settingAppReminderId ||
        isNotificationEnabledDisabled) {
      await NotificationHelper.cancelReminders();
      final isAppReminderEnabled = (await _isarService
                  .getSettingOf(SaveDefaultData.settingAppReminderId))
              ?.isChecked ??
          false;
      if (isAppReminderEnabled) {
        await NotificationHelper.rescheduleReminders(shouldCancelFirst: false);
      }
    } else if (isAllShareEnabledDisabled) {
      FileUtils.deleteAllWatermarkAndPDFData();
    } else if (which == SaveDefaultData.settingShareBasicDetailsId ||
        which == SaveDefaultData.settingShareLogoId ||
        which == SaveDefaultData.settingShareOtherDetailsId) {
      FileUtils.deleteAllWatermarkAndPDFData(shouldDeleteImage: false);
    } else if (which == SaveDefaultData.settingShareId ||
        which == SaveDefaultData.settingShareImagesId ||
        which == SaveDefaultData.settingShareWatermarkId) {
      FileUtils.deleteAllWatermarkAndPDFData();
    }
    notifyListeners();
  }

  bool _isSettingEnabled(int id) {
    return settingsList
            .firstWhereOrNull((element) => element.settingId == id)
            ?.isChecked ??
        true;
  }

  updateSettingsToServer(
    int id,
    bool isAllShareEnabledDisabled,
    bool isNotificationEnabledDisabled,
  ) {
    final request = SettingsApiRequest();
    if (id == SaveDefaultData.settingNotificationId ||
        isNotificationEnabledDisabled) {
      request.enabledNotification = _isSettingEnabled(
        SaveDefaultData.settingNotificationId,
      );
    }
    if (id == SaveDefaultData.settingShareId || isAllShareEnabledDisabled) {
      request.enabledShare = _isSettingEnabled(
        SaveDefaultData.settingShareId,
      );
    }
    if (id == SaveDefaultData.settingShareBasicDetailsId ||
        isAllShareEnabledDisabled) {
      request.enabledShareBasicDetails = _isSettingEnabled(
        SaveDefaultData.settingShareBasicDetailsId,
      );
    }
    if (id == SaveDefaultData.settingShareOtherDetailsId ||
        isAllShareEnabledDisabled) {
      request.enabledShareOtherDetails = _isSettingEnabled(
        SaveDefaultData.settingShareOtherDetailsId,
      );
    }
    /*if (id == SaveDefaultData.settingShareLogoId ||
        isAllShareEnabledDisabled) {
      request.enabledShareLogo = _isSettingEnabled(
        SaveDefaultData.settingShareLogoId,
      );
    }*/
    if (id == SaveDefaultData.settingShareImagesId ||
        isAllShareEnabledDisabled) {
      request.enabledSharePhotos = _isSettingEnabled(
        SaveDefaultData.settingShareImagesId,
      );
    }
    if (id == SaveDefaultData.settingShareWatermarkId ||
        isAllShareEnabledDisabled) {
      request.enabledShareWatermark = _isSettingEnabled(
        SaveDefaultData.settingShareWatermarkId,
      );
    }
    if (id == SaveDefaultData.settingAppReminderId ||
        isNotificationEnabledDisabled) {
      request.enabledAppReminder = _isSettingEnabled(
        SaveDefaultData.settingAppReminderId,
      );
    }
    if (id == SaveDefaultData.settingPublicPropertyId ||
        isNotificationEnabledDisabled) {
      request.enabledPublicProperties = _isSettingEnabled(
        SaveDefaultData.settingPublicPropertyId,
      );
    }
    DioClient().updateSettings(SettingsApiRequest().toMap(request));
  }

  _getAppVersion() async {
    appVersion = await StaticFunctions.getAppVersion();
  }
}
