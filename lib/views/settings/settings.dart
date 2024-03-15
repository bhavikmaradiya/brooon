import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import './settings_provider.dart';
import './widget/setting_menu_item_widget.dart';
import '../../const/dimen_const.dart';
import '../../const/routes.dart';
import '../../const/string_const.dart';
import '../../localdb/save_default_data.dart';
import '../../localdb/settings/db_settings.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../widgets/toolbar.dart';

class Settings extends StatelessWidget {
  Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appVersionTextStyle = TextStyle(
      color: StaticFunctions.getColor(
        context,
        ColorEnum.blackColor,
      ),
      fontSize: Dimensions.settingBrooonVersionTextSize.sp,
    );
    AppLocalizations localizationsContext = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: ThemeConfig.appBar(context),
      body: SafeArea(
        child: Column(
          children: [
            ToolBar(
              enableBackground: true,
              title: localizationsContext.settings,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.screenHorizontalMargin.w,
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Selector<SettingsProvider, List<DbSetting>>(
                    shouldRebuild: (prev, next) => true,
                    selector: (_, state) => state.settingsList,
                    builder: (context, settingsList, child) {
                      return settingsList.isNotEmpty
                          ? Column(
                              children: [
                                SettingsMenuItemWidget(
                                  currentSetting: settingsList.firstWhere(
                                    (element) =>
                                        element.settingId ==
                                        SaveDefaultData.settingNotificationId,
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.settingOptions,
                                      arguments:
                                          SaveDefaultData.settingNotificationId,
                                    );
                                  },
                                ),
                                if (AppConfig.enableWhatsAppShareFromSettings)
                                  SizedBox(
                                    height: Dimensions
                                        .settingListItemBetweenSpace.h,
                                  ),
                                if (AppConfig.enableWhatsAppShareFromSettings)
                                  SettingsMenuItemWidget(
                                    currentSetting: settingsList.firstWhere(
                                      (element) =>
                                          element.settingId ==
                                          SaveDefaultData.settingShareId,
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        Routes.settingOptions,
                                        arguments:
                                            SaveDefaultData.settingShareId,
                                      );
                                    },
                                  ),
                                SizedBox(
                                  height:
                                      Dimensions.settingListItemBetweenSpace.h,
                                ),
                                SettingsMenuItemWidget(
                                  currentSetting: settingsList.firstWhere(
                                    (element) =>
                                        element.settingId ==
                                        SaveDefaultData.settingCastManagementId,
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.castManagement,
                                    );
                                  },
                                ),
                                SizedBox(
                                  height:
                                      Dimensions.settingListItemBetweenSpace.h,
                                ),
                                SettingsMenuItemWidget(
                                  currentSetting: settingsList.firstWhere(
                                    (element) =>
                                        element.settingId ==
                                        SaveDefaultData
                                            .settingAmenitiesManagementId,
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.amenitiesManagement,
                                    );
                                  },
                                ),
                                SizedBox(
                                  height:
                                      Dimensions.settingListItemBetweenSpace.h,
                                ),
                                SettingsMenuItemWidget(
                                  currentSetting: settingsList.firstWhere(
                                    (element) =>
                                        element.settingId ==
                                        SaveDefaultData.settingRadiusId,
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.radius,
                                    );
                                  },
                                ),
                                SizedBox(
                                  height:
                                      Dimensions.settingListItemBetweenSpace.h,
                                ),
                                SettingsMenuItemWidget(
                                  currentSetting: settingsList.firstWhere(
                                    (element) =>
                                        element.settingId ==
                                        SaveDefaultData
                                            .settingUploadWatermarkId,
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.propertyWatermark,
                                    );
                                  },
                                ),
                                SizedBox(
                                  height:
                                      Dimensions.settingListItemBetweenSpace.h,
                                ),
                                SettingsMenuItemWidget(
                                  currentSetting: settingsList.firstWhere(
                                    (element) =>
                                        element.settingId ==
                                        SaveDefaultData.settingConfigOptionId,
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.configOptions,
                                    );
                                  },
                                ),
                                SizedBox(
                                  height:
                                      Dimensions.settingListItemBetweenSpace.h,
                                ),
                                SettingsMenuItemWidget(
                                  currentSetting: settingsList.firstWhere(
                                    (element) =>
                                        element.settingId ==
                                        SaveDefaultData
                                            .settingBlockedBrooonerId,
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.blockedBroooners,
                                    );
                                  },
                                ),
                                SizedBox(
                                  height:
                                      Dimensions.settingListItemBetweenSpace.h,
                                ),
                              ],
                            )
                          : Container();
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.screenVerticalMarginBottom.h,
            ),
            SvgPicture.asset(
              Strings.iconSmallBrooonLogo,
              width: Dimensions.settingBrooonLogoSize.w,
              height: Dimensions.settingBrooonLogoSize.w,
            ),
            Selector<SettingsProvider, String>(
              shouldRebuild: (prev, next) => true,
              selector: (_, state) => state.appVersion,
              builder: (context, value, child) {
                return Text(
                  value.isNotEmpty
                      ? localizationsContext.versioning(value)
                      : '',
                  style: appVersionTextStyle,
                );
              },
            ),
            SizedBox(
              height: Dimensions.screenVerticalMarginBottom.h,
            ),
          ],
        ),
      ),
    );
  }
}
