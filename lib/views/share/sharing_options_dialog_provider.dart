import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import './model/share_type_enum.dart';
import './model/share_type_model.dart';
import './sharing_option.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/properties/db_property.dart';
import '../../localdb/properties/db_saved_filter.dart';
import '../../localdb/save_default_data.dart';
import '../../localdb/settings/db_settings.dart';

class SharingOptionsDialogProvider extends ChangeNotifier {
  final _isarService = IsarService();
  late AppLocalizations localizationsContext;
  final List<SharingOption> sharingOptions = [];
  ShareTypeModel? shareType;
  DbProperty? property;
  DbSavedFilter? inquiry;
  late ShareTypeEnum shareTypeEnum;

  initProperty(BuildContext context, DbProperty? selectedProperty) {
    localizationsContext = AppLocalizations.of(context)!;
    property = selectedProperty;
    shareTypeEnum = ShareTypeEnum.property;
    fetchSharingInfo();
  }

  initInquiry(BuildContext context, DbSavedFilter? selectedInquiry) {
    localizationsContext = AppLocalizations.of(context)!;
    inquiry = selectedInquiry;
    shareTypeEnum = ShareTypeEnum.inquiry;
    fetchSharingInfo();
  }

  fetchSharingInfo() async {
    await _generateSharingOptions();
    _sharingHelper();
  }

  _generateSharingOptions() async {
    final sharingSettings = await _isarService.getSharingSettings();
    sharingOptions.clear();
    await Future.forEach(
      sharingSettings,
      (element) {
        String subtitle = '';
        if (element.settingId == SaveDefaultData.settingShareBasicDetailsId) {
          subtitle = shareTypeEnum == ShareTypeEnum.property
              ? localizationsContext.sharingOptionBasicDetailsSubtitle
              : shareTypeEnum == ShareTypeEnum.inquiry
                  ? localizationsContext
                      .sharingOptionInquiryBasicDetailsSubtitle
                  : '';
        } else if (element.settingId == SaveDefaultData.settingShareImagesId) {
          subtitle = localizationsContext.sharingOptionImagesSubtitle;
        } else if (element.settingId ==
            SaveDefaultData.settingShareOtherDetailsId) {
          subtitle = localizationsContext.sharingOptionOtherDetailsSubtitle;
        } else if (element.settingId ==
            SaveDefaultData.settingShareWatermarkId) {
          subtitle = localizationsContext.sharingOptionWatermarkSubtitle;
        }
        if (shareTypeEnum == ShareTypeEnum.inquiry) {
          if (element.settingId != SaveDefaultData.settingShareImagesId &&
              element.settingId != SaveDefaultData.settingShareWatermarkId) {
            sharingOptions.add(
              SharingOption(
                settingId: element.settingId ?? -1,
                title: element.settingTitle,
                subtitle: subtitle,
                isEnabled: element.isChecked,
              ),
            );
          }
        } else {
          if (property!.sharedByBrooon == false ||
              (element.settingId != SaveDefaultData.settingShareImagesId &&
                  element.settingId !=
                      SaveDefaultData.settingShareWatermarkId)) {
            sharingOptions.add(
              SharingOption(
                settingId: element.settingId ?? -1,
                title: element.settingTitle,
                subtitle: subtitle,
                isEnabled: element.isChecked,
              ),
            );
          }
        }
      },
    );
    notifyListeners();
  }

  _sharingHelper() async {
    bool shareTextEnabled = false;
    bool shareImageEnabled = false;
    bool sharePdfEnabled = false;
    List<DbSetting> settings = await _isarService.getSettings();
    bool isBasicDetailsEnabled = false;
    bool isOtherDetailsEnabled = false;
    bool isPhotosEnabled = false;
    bool isWatermarkEnabled = false;
    bool isShareLogoEnabled = false;
    if (property != null || inquiry != null) {
      isWatermarkEnabled = settings
              .firstWhereOrNull((element) =>
                  element.settingId == SaveDefaultData.settingShareWatermarkId)
              ?.isChecked ??
          false;
      isShareLogoEnabled = settings
              .firstWhereOrNull((element) =>
                  element.settingId == SaveDefaultData.settingShareLogoId)
              ?.isChecked ??
          false;
      isBasicDetailsEnabled = settings
              .firstWhereOrNull((element) =>
                  element.settingId ==
                  SaveDefaultData.settingShareBasicDetailsId)
              ?.isChecked ??
          false;
      isOtherDetailsEnabled = settings
              .firstWhereOrNull((element) =>
                  element.settingId ==
                  SaveDefaultData.settingShareOtherDetailsId)
              ?.isChecked ??
          false;
      isPhotosEnabled = shareTypeEnum != ShareTypeEnum.inquiry
          ? ((settings
                      .firstWhereOrNull((element) =>
                          element.settingId ==
                          SaveDefaultData.settingShareImagesId)
                      ?.isChecked ??
                  false) &&
              property?.photos != null &&
              property!.photos!.isNotEmpty)
          : false;

      if (isBasicDetailsEnabled || isOtherDetailsEnabled) {
        shareTextEnabled = true;
        sharePdfEnabled = true;
      }
      if (isPhotosEnabled) {
        shareImageEnabled = true;
        sharePdfEnabled = true;
      }
    }
    shareType = ShareTypeModel(
      shareTextEnabled: shareTextEnabled,
      shareImageEnabled: shareImageEnabled,
      sharePdfEnabled: sharePdfEnabled,
      isBasicDetailsEnabled: isBasicDetailsEnabled,
      isOtherDetailsEnabled: isOtherDetailsEnabled,
      isPhotosEnabled: isPhotosEnabled,
      isWatermarkEnabled: isWatermarkEnabled,
      isShareLogoEnabled: isShareLogoEnabled,
    );
    notifyListeners();
  }
}
