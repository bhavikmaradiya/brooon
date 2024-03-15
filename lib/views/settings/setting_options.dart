import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import './settings_provider.dart';
import './widget/setting_inner_option_widget.dart';
import '../../const/dimen_const.dart';
import '../../localdb/save_default_data.dart';
import '../../localdb/settings/db_settings.dart';
import '../../utils/theme_config.dart';
import '../../widgets/toolbar.dart';

class SettingOptions extends StatelessWidget {
  const SettingOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int selectedSettingId =
        ModalRoute.of(context)!.settings.arguments as int;
    AppLocalizations localizationsContext = AppLocalizations.of(context)!;
    SettingsProvider provider = Provider.of<SettingsProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: ThemeConfig.appBar(context),
      body: SafeArea(
        child: Selector<SettingsProvider, List<DbSetting>>(
          shouldRebuild: (prev, next) => true,
          selector: (_, state) => state.settingsList,
          builder: (context, settingsList, child) {
            final title = settingsList
                .firstWhereOrNull(
                  (element) => element.settingId == selectedSettingId,
                )
                ?.settingTitle;
            return Column(
              children: [
                ToolBar(
                  enableBackground: true,
                  title: title ?? localizationsContext.settings,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: Dimensions.screenHorizontalMargin.w,
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: settingsList.isNotEmpty
                          ? Column(
                              children: [
                                if (selectedSettingId ==
                                    SaveDefaultData.settingNotificationId)
                                  Column(
                                    children: [
                                      SettingsInnerOptionWidget(
                                        isItLast: false,
                                        currentSetting: settingsList.firstWhere(
                                          (element) =>
                                              element.settingId ==
                                              SaveDefaultData
                                                  .settingPublicPropertyId,
                                        ),
                                        onValueChange: (which, value) {
                                          provider.onCheckChangedListener(
                                            which,
                                            value,
                                          );
                                        },
                                      ),
                                      SettingsInnerOptionWidget(
                                        isItLast: true,
                                        currentSetting: settingsList.firstWhere(
                                          (element) =>
                                              element.settingId ==
                                              SaveDefaultData
                                                  .settingAppReminderId,
                                        ),
                                        onValueChange: (which, value) {
                                          provider.onCheckChangedListener(
                                            which,
                                            value,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                if (selectedSettingId ==
                                    SaveDefaultData.settingShareId)
                                  Column(
                                    children: [
                                      SettingsInnerOptionWidget(
                                        isItLast: false,
                                        currentSetting: settingsList.firstWhere(
                                          (element) =>
                                              element.settingId ==
                                              SaveDefaultData
                                                  .settingShareBasicDetailsId,
                                        ),
                                        onValueChange: (which, value) {
                                          provider.onCheckChangedListener(
                                            which,
                                            value,
                                          );
                                        },
                                      ),
                                      /*SettingsInnerOptionWidget(
                                        isItLast: false,
                                        currentSetting: settingsList.firstWhere(
                                          (element) =>
                                              element.settingId ==
                                              SaveDefaultData
                                                  .settingShareSellerDetailsId,
                                        ),
                                        onValueChange: (which, value) {
                                          provider.onCheckChangedListener(
                                            which,
                                            value,
                                          );
                                        },
                                      ),
                                      SettingsInnerOptionWidget(
                                        isItLast: false,
                                        currentSetting: settingsList.firstWhere(
                                          (element) =>
                                              element.settingId ==
                                              SaveDefaultData
                                                  .settingSharePriceDetailsId,
                                        ),
                                        onValueChange: (which, value) {
                                          provider.onCheckChangedListener(
                                            which,
                                            value,
                                          );
                                        },
                                      ),*/
                                      SettingsInnerOptionWidget(
                                        isItLast: false,
                                        currentSetting: settingsList.firstWhere(
                                          (element) =>
                                              element.settingId ==
                                              SaveDefaultData
                                                  .settingShareImagesId,
                                        ),
                                        onValueChange: (which, value) {
                                          provider.onCheckChangedListener(
                                            which,
                                            value,
                                          );
                                        },
                                      ),
                                      SettingsInnerOptionWidget(
                                        isItLast: true,
                                        currentSetting: settingsList.firstWhere(
                                          (element) =>
                                              element.settingId ==
                                              SaveDefaultData
                                                  .settingShareWatermarkId,
                                        ),
                                        onValueChange: (which, value) {
                                          provider.onCheckChangedListener(
                                            which,
                                            value,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                              ],
                            )
                          : Container(),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
