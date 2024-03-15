import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import './config_options_provider.dart';
import '../../const/dimen_const.dart';
import '../../utils/enums.dart';
import '../../utils/theme_config.dart';
import '../../widgets/toolbar.dart';
import '../common_widget/incremental_item.dart';

class ConfigOptions extends StatelessWidget {
  const ConfigOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ConfigOptionsProvider(),
      builder: (_, __) => _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  AppLocalizations? localizationsContext;
  ConfigOptionsProvider? provider;

  @override
  void didChangeDependencies() {
    if (localizationsContext == null) {
      localizationsContext = AppLocalizations.of(context)!;
    }
    if (provider == null) {
      provider = Provider.of<ConfigOptionsProvider>(
        context,
        listen: false,
      );
      provider!.init();
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    provider?.debounce?.cancel();
    if (provider?.isNeedToUpdateDataToServer ?? false) {
      provider?.callApiToUpdateSettings();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeConfig.appBar(
        context,
        statusBarColor: ColorEnum.whiteColor,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ToolBar(
              title: localizationsContext!.settingTitleConfigOptions,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.screenHorizontalMargin.w,
                    vertical: Dimensions.screenVerticalMarginBottom.h,
                  ),
                  child: Column(
                    children: [
                      Selector<ConfigOptionsProvider, TextEditingController>(
                        shouldRebuild: (prev, next) => true,
                        selector: (_, state) =>
                            state.nearByDistanceFieldController,
                        builder: (context, controller, child) {
                          return IncrementalItem(
                            label: localizationsContext!
                                .settingTitleNearByDistance,
                            hint: localizationsContext!.settingDistanceHint,
                            controller: controller,
                            ignoring: false,
                            onValueChangedByTyping: (value) {
                              int updatedValue = 0;
                              if (value.trim().isNotEmpty) {
                                updatedValue =
                                    int.tryParse(value) ?? updatedValue;
                              }
                              provider?.updateNearByDistance(
                                updatedValue,
                                false,
                              );
                            },
                            onValueChanged: (value) {
                              provider?.updateNearByDistance(
                                value,
                                true,
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: Dimensions.settingConfigOptionItemSpacing.h,
                      ),
                      Selector<ConfigOptionsProvider, TextEditingController>(
                        shouldRebuild: (prev, next) => true,
                        selector: (_, state) =>
                            state.mySearchDistanceFieldController,
                        builder: (context, controller, child) {
                          return IncrementalItem(
                            label: localizationsContext!
                                .settingTitleMySearchDistance,
                            hint: localizationsContext!.settingDistanceHint,
                            controller: controller,
                            ignoring: false,
                            onValueChangedByTyping: (value) {
                              int updatedValue = 0;
                              if (value.trim().isNotEmpty) {
                                updatedValue =
                                    int.tryParse(value) ?? updatedValue;
                              }
                              provider?.updateMySearchDistance(
                                updatedValue,
                                false,
                              );
                            },
                            onValueChanged: (value) {
                              provider?.updateMySearchDistance(
                                value,
                                true,
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: Dimensions.settingConfigOptionItemSpacing.h,
                      ),
                      Selector<ConfigOptionsProvider, TextEditingController>(
                        shouldRebuild: (prev, next) => true,
                        selector: (_, state) =>
                            state.brooonDistanceFieldController,
                        builder: (context, controller, child) {
                          return IncrementalItem(
                            label: localizationsContext!
                                .settingTitleBrooonSearchDistance,
                            hint: localizationsContext!.settingDistanceHint,
                            controller: controller,
                            ignoring: false,
                            onValueChangedByTyping: (value) {
                              int updatedValue = 0;
                              if (value.trim().isNotEmpty) {
                                updatedValue =
                                    int.tryParse(value) ?? updatedValue;
                              }
                              provider?.updateBrooonSearchDistance(
                                updatedValue,
                                false,
                              );
                            },
                            onValueChanged: (value) {
                              provider?.updateBrooonSearchDistance(
                                value,
                                true,
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
