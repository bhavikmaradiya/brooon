import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import './restore_backup_provider.dart';
import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/toolbar.dart';

class RestoreBackup extends StatelessWidget {
  const RestoreBackup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RestoreBackupProvider(),
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
  RestoreBackupProvider? _restoreBackupProvider;
  AppLocalizations? _localizationsContext;

  @override
  void didChangeDependencies() {
    _localizationsContext ??= AppLocalizations.of(context)!;
    if (_restoreBackupProvider == null) {
      _restoreBackupProvider =
          Provider.of<RestoreBackupProvider>(context, listen: false);
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _restoreBackupProvider!.init();
      });
    }
    super.didChangeDependencies();
  }

  Widget _currentBackupSizeWidget(String? value) {
    return Text(
      _localizationsContext!.restoreBackupSize(value ?? ''),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: StaticFunctions.getColor(
          context,
          ColorEnum.blueColor,
        ),
        fontSize: Dimensions.restoreBackupSizeTextSize.sp,
      ),
    );
  }

  Widget _downloadingProgressWidget() {
    return Selector<RestoreBackupProvider, Tuple2<bool, double>>(
      shouldRebuild: (prev, next) => true,
      selector: (_, state) => Tuple2(
        state.isDownloading,
        state.processValue,
      ),
      builder: (_, tuple, __) {
        return AnimatedSwitcher(
          duration: const Duration(
            milliseconds: 500,
          ),
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          child: tuple.item1
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Dimensions
                          .restoreBackupDescriptionAndProcessBetweenSpacing.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: tuple.item2.isNaN ? 0 : tuple.item2,
                            backgroundColor: StaticFunctions.getColor(
                              context,
                              ColorEnum.themeColorOpacity8Percentage,
                            ),
                            valueColor: AlwaysStoppedAnimation(
                              StaticFunctions.getColor(
                                context,
                                ColorEnum.themeColor,
                              ),
                            ),
                            minHeight: Dimensions
                                .restoreBackupUploadingProcessBarHeight.h,
                          ),
                        ),
                        SizedBox(
                          width: Dimensions
                              .backupProcessCancelIconAndProcessBetweenSpacing
                              .w,
                        ),
                        Container(
                          height: Dimensions.backupProcessCancelIconSize.h,
                          width: Dimensions.backupProcessCancelIconSize.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Dimensions.borderRadius.r,
                            ),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(
                                Dimensions.borderRadius.r,
                              ),
                              onTap: () =>
                                  _restoreBackupProvider?.cancelDownloading(),
                              child: Padding(
                                padding: EdgeInsets.all(
                                  Dimensions.backupProcessCancelIconPadding.h,
                                ),
                                child: SvgPicture.asset(
                                  Strings.iconClose,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Dimensions
                          .restoreBackupProcessAndStatusBetweenSpacing.h,
                    ),
                    Selector<RestoreBackupProvider, Tuple2<String, String>>(
                      selector: (_, state) => Tuple2(
                        state.downloadedBackupSizeToDownload,
                        state.totalBackupSizeToDownload,
                      ),
                      builder: (context, tuple, child) {
                        return Text(
                          _localizationsContext!.backupDownloadingStatus(
                            tuple.item1,
                            tuple.item2,
                          ),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: StaticFunctions.getColor(
                              context,
                              ColorEnum.blueColor,
                            ),
                            fontSize: Dimensions
                                .restoreBackupUploadingStatusTextSize.sp,
                          ),
                        );
                      },
                    ),
                  ],
                )
              : const SizedBox(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeConfig.appBar(context),
      body: WillPopScope(
        onWillPop: () => Future.value(false),
        child: SafeArea(
          child: Column(
            children: [
              ToolBar(
                title: _localizationsContext!.titleRestoreBackup,
                enableBack: false,
                centerTitle: true,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.screenHorizontalMargin.w,
                    vertical: Dimensions.screenVerticalMarginBottom.h,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(
                                Dimensions.restoreBackupIconInnerPadding.h,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Dimensions.restoreBackupIconBorderRadius.r,
                                ),
                                border: Border.all(
                                  color: StaticFunctions.getColor(
                                    context,
                                    ColorEnum.borderColorE0,
                                  ),
                                  width:
                                      Dimensions.restoreBackupIconBorderWidth.w,
                                ),
                                color: StaticFunctions.getColor(
                                  context,
                                  ColorEnum.blueColorOpacity2Percentage,
                                ),
                              ),
                              child: SizedBox(
                                height: Dimensions.restoreBackupIconSize.h,
                                width: Dimensions.restoreBackupIconSize.h,
                                child: SvgPicture.asset(
                                  Strings.iconDownloadBackup,
                                  color: StaticFunctions.getColor(
                                    context,
                                    ColorEnum.blueColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Dimensions
                                  .restoreBackupIconAndSubtitleBetweenSpacing.h,
                            ),
                            Text(
                              _localizationsContext!.titleBackupFound,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: StaticFunctions.getColor(
                                  context,
                                  ColorEnum.blackColor,
                                ),
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    Dimensions.restoreBackupSubtitleTextSize.sp,
                              ),
                            ),
                            SizedBox(
                              height: Dimensions
                                  .restoreBackupSubtitleAndContentBetweenSpacing
                                  .h,
                            ),
                            Text(
                              _localizationsContext!.restoreBackupFound(
                                _restoreBackupProvider
                                        ?.getRestoreBackupEmailId() ??
                                    _localizationsContext!.googleDrive,
                              ),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: StaticFunctions.getColor(
                                  context,
                                  ColorEnum.blackColor,
                                ),
                                fontSize:
                                    Dimensions.restoreBackupContentTextSize.sp,
                              ),
                            ),
                            SizedBox(
                              height: Dimensions
                                  .restoreBackupSubtitleAndContentBetweenSpacing
                                  .h,
                            ),
                            FutureBuilder<String?>(
                              future: _restoreBackupProvider
                                  ?.getCurrentBackupSize(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return _currentBackupSizeWidget(
                                    snapshot.data,
                                  );
                                } else {
                                  return _currentBackupSizeWidget(null);
                                }
                              },
                            ),
                            SizedBox(
                              height: Dimensions
                                  .restoreBackupSubtitleAndContentBetweenSpacing
                                  .h,
                            ),
                            _downloadingProgressWidget(),
                          ],
                        ),
                      ),
                      Selector<RestoreBackupProvider, bool>(
                        shouldRebuild: (prev, next) => prev != next,
                        selector: (_, state) => state.isDownloading,
                        builder: (context, isDownloading, child) {
                          return !isDownloading
                              ? Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          right: Dimensions
                                              .restoreBackupBottomButtonSpacingBetween
                                              .w,
                                        ),
                                        child: ButtonWidget(
                                          text: _localizationsContext!
                                              .btnRestoreBackup,
                                          onClick: () async {
                                            await _restoreBackupProvider
                                                ?.startDownloadingBackup(
                                                    context);
                                          },
                                          borderWidth: Dimensions
                                              .restoreBackupBottomButtonBorderWidth
                                              .w,
                                          textColor: StaticFunctions.getColor(
                                            context,
                                            ColorEnum.whiteColor,
                                          ),
                                          borderColor: StaticFunctions.getColor(
                                            context,
                                            ColorEnum.themeColor,
                                          ),
                                          bgColor: StaticFunctions.getColor(
                                            context,
                                            ColorEnum.themeColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          left: Dimensions
                                              .restoreBackupBottomButtonSpacingBetween
                                              .w,
                                        ),
                                        child: ButtonWidget(
                                          text: _localizationsContext!
                                              .btnSkipBackup,
                                          onClick: () => _restoreBackupProvider
                                              ?.openScreen(context),
                                          borderWidth: Dimensions
                                              .restoreBackupBottomButtonBorderWidth
                                              .w,
                                          textColor: StaticFunctions.getColor(
                                            context,
                                            ColorEnum.themeColor,
                                          ),
                                          borderColor: StaticFunctions.getColor(
                                            context,
                                            ColorEnum.borderColorE0,
                                          ),
                                          bgColor: StaticFunctions.getColor(
                                            context,
                                            ColorEnum
                                                .themeColorOpacity3Percentage,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox();
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
