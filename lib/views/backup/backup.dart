import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import './backup_provider.dart';
import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/light_divider.dart';
import '../../widgets/toolbar.dart';

class Backup extends StatelessWidget {
  const Backup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BackupProvider(),
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
  BackupProvider? _backupProvider;
  AppLocalizations? _localizationsContext;

  @override
  void didChangeDependencies() {
    _localizationsContext ??= AppLocalizations.of(context)!;
    if (_backupProvider == null) {
      _backupProvider = Provider.of<BackupProvider>(context, listen: false);
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) {
          _backupProvider!.init();
        },
      );
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _backupProvider?.onDispose();
    super.dispose();
  }

  /*_showAccountDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(
            horizontal: Dimensions.screenHorizontalMargin.w,
          ),
          backgroundColor: StaticFunctions.getColor(
            context,
            ColorEnum.whiteColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Dimensions.dialogRadius.r,
            ),
          ),
          child: Container(
            child: Wrap(
              children: [
                ColoredBox(
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.themeColorOpacity3Percentage,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: Dimensions.screenHorizontalMargin.w,
                      right: (Dimensions.screenHorizontalMargin / 2).w,
                      top: Dimensions.screenHorizontalMargin.h,
                      bottom: Dimensions.screenHorizontalMargin.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _localizationsContext!.titleAccountForBackup,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize:
                                Dimensions.dialogUploadImageTitleTextSize.sp,
                            color: StaticFunctions.getColor(
                              context,
                              ColorEnum.blackColor,
                            ),
                          ),
                        ),
                        Container(
                          width: Dimensions.closeIconSize.w,
                          height: Dimensions.closeIconSize.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Dimensions.closeIconRippleRadius.r,
                            ),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              borderRadius: BorderRadius.circular(
                                Dimensions.closeIconRippleRadius.r,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(
                                  Dimensions.closeIconPadding.w,
                                ),
                                child: SvgPicture.asset(
                                  Strings.iconClose,
                                  width: Dimensions.closeIconSize.w,
                                  height: Dimensions.closeIconSize.w,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.screenHorizontalMargin.w,
                              vertical: (Dimensions
                                      .restoreBackupAccountListItemVerticalSpacing
                                      .h /
                                  2),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'agent007.brooon@mail.com',
                                    maxLines: 1,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: Dimensions
                                          .restoreBackupAccountListItemTextSize
                                          .sp,
                                      color: StaticFunctions.getColor(
                                        context,
                                        ColorEnum.blackColor,
                                      ),
                                    ),
                                  ),
                                ),
                                CustomRadio(
                                  value: 1,
                                  groupValue: 1,
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        LightDivider(),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }*/

  Widget _lastBackupSizeWidget(String? value) {
    return Text(
      _localizationsContext!.backupSize(value ?? ''),
      textAlign: TextAlign.start,
      style: TextStyle(
        color: StaticFunctions.getColor(
          context,
          ColorEnum.blueColor,
        ),
        fontSize: Dimensions.restoreBackupSizeAndDateTextSize.sp,
      ),
    );
  }

  Widget _lastBackupInfoWidget() {
    return Selector<BackupProvider, bool>(
      shouldRebuild: (_, __) => true,
      selector: (_, state) => state.isBackupAvailable,
      builder: (context, isBackupDataAvailable, child) {
        return isBackupDataAvailable
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Dimensions
                        .restoreBackupDescriptionAndSizeBetweenSpacing.h,
                  ),
                  Text(
                    _localizationsContext!.lastBackupDate(
                        _backupProvider?.getLastBackupAt() ?? ''),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.blueColor,
                      ),
                      fontSize: Dimensions.restoreBackupSizeAndDateTextSize.sp,
                    ),
                  ),
                  FutureBuilder<String?>(
                    future: _backupProvider?.getLastBackupSize(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return _lastBackupSizeWidget(snapshot.data);
                      } else {
                        return _lastBackupSizeWidget(null);
                      }
                    },
                  ),
                  Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Text(
                          _localizationsContext!.titleBackupAccount,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: StaticFunctions.getColor(
                              context,
                              ColorEnum.blueColor,
                            ),
                            fontSize:
                                Dimensions.restoreBackupSizeAndDateTextSize.sp,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            _backupProvider?.getLastBackupEmail() ?? '',
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style: TextStyle(
                              color: StaticFunctions.getColor(
                                context,
                                ColorEnum.blackColor,
                              ),
                              fontSize: Dimensions
                                  .restoreBackupSizeAndDateTextSize.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : const SizedBox();
      },
    );
  }

  Widget _changeBackupAccountWidget() {
    return Selector<BackupProvider, Tuple2<bool, String?>>(
      selector: (_, state) => Tuple2(
        state.isUploading,
        state.activeAccount,
      ),
      shouldRebuild: (prev, next) => true,
      builder: (context, tuple, child) {
        if (tuple.item1) {
          return const SizedBox();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                _backupProvider?.changeBackupAccount();
              },
              child: Text(
                _localizationsContext!.chooseBackupAccount,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.themeColor,
                  ),
                  fontWeight: FontWeight.w600,
                  fontSize:
                      Dimensions.restoreBackupBackupSettingTitleTextSize.sp,
                ),
              ),
            ),
            if (tuple.item2 != null && tuple.item2!.trim().isNotEmpty)
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _localizationsContext!.selectedChosenAccount,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: StaticFunctions.getColor(
                          context,
                          ColorEnum.blueColor,
                        ),
                        fontSize:
                            Dimensions.restoreBackupSizeAndDateTextSize.sp,
                      ),
                    ),
                    Text(
                      tuple.item2 ?? '',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: StaticFunctions.getColor(
                          context,
                          ColorEnum.blackColor,
                        ),
                        fontSize:
                            Dimensions.restoreBackupSizeAndDateTextSize.sp,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _driveBackupSettingsWidget() {
    return Selector<BackupProvider, bool>(
      shouldRebuild: (_, __) => true,
      selector: (_, state) => state.isBackupAvailable,
      builder: (context, isBackupDataAvailable, child) {
        return isBackupDataAvailable
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Dimensions.restoreBackupDividerVerticalSpacing.h,
                  ),
                  LightDivider(),
                  SizedBox(
                    height: Dimensions.restoreBackupDividerVerticalSpacing.h,
                  ),
                  /*Text(
                    _localizationsContext!.titleBackupSettings,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.blackColor,
                      ),
                      fontWeight: FontWeight.w600,
                      fontSize:
                          Dimensions.restoreBackupBackupSettingTitleTextSize.sp,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions
                        .restoreBackupBackupSettingAndAccountBetweenSpacing.h,
                  ),*/
                  _changeBackupAccountWidget(),
                ],
              )
            : const SizedBox();
      },
    );
  }

  Future<bool> _onBackClick() {
    return Future.value(!(_backupProvider?.isUploading ?? false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeConfig.appBar(context),
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () => _onBackClick(),
          child: Column(
            children: [
              ToolBar(
                title: _localizationsContext!.titleBackup,
                onBackPressed: () {
                  if (!(_backupProvider?.isUploading ?? false)) {
                    Navigator.pop(context);
                  }
                },
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.screenHorizontalMargin.w,
                    vertical: Dimensions.screenVerticalMarginBottom.h,
                  ),
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(
                          Dimensions.backupIconInnerPadding.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Dimensions.backupIconBorderRadius.r,
                          ),
                          border: Border.all(
                            color: StaticFunctions.getColor(
                              context,
                              ColorEnum.borderColorE0,
                            ),
                            width: Dimensions.backupIconBorderWidth.w,
                          ),
                          color: StaticFunctions.getColor(
                            context,
                            ColorEnum.blueColorOpacity2Percentage,
                          ),
                        ),
                        child: SizedBox(
                          height: Dimensions.backupIconSize.h,
                          width: Dimensions.backupIconSize.h,
                          child: SvgPicture.asset(
                            Strings.iconUploadBackup,
                            color: StaticFunctions.getColor(
                              context,
                              ColorEnum.blueColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions
                            .restoreBackupIconAndDescriptionBetweenSpacing.h,
                      ),
                      Text(
                        _localizationsContext!.descriptionBackupFound,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: StaticFunctions.getColor(
                            context,
                            ColorEnum.blackColor,
                          ),
                          fontSize: Dimensions.backupContentTextSize.sp,
                        ),
                      ),
                      Selector<BackupProvider, Tuple2<bool, double>>(
                        shouldRebuild: (prev, next) => true,
                        selector: (_, state) => Tuple2(
                          state.isUploading,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: Dimensions
                                            .restoreBackupDescriptionAndProcessBetweenSpacing
                                            .h,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: LinearProgressIndicator(
                                              value: tuple.item2.isNaN
                                                  ? 0
                                                  : tuple.item2,
                                              backgroundColor:
                                                  StaticFunctions.getColor(
                                                context,
                                                ColorEnum
                                                    .themeColorOpacity8Percentage,
                                              ),
                                              valueColor:
                                                  AlwaysStoppedAnimation(
                                                StaticFunctions.getColor(
                                                  context,
                                                  ColorEnum.themeColor,
                                                ),
                                              ),
                                              minHeight: Dimensions
                                                  .restoreBackupUploadingProcessBarHeight
                                                  .h,
                                            ),
                                          ),
                                          SizedBox(
                                            width: Dimensions
                                                .backupProcessCancelIconAndProcessBetweenSpacing
                                                .w,
                                          ),
                                          Container(
                                            height: Dimensions
                                                .backupProcessCancelIconSize.h,
                                            width: Dimensions
                                                .backupProcessCancelIconSize.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                Dimensions.borderRadius.r,
                                              ),
                                            ),
                                            child: Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  Dimensions.borderRadius.r,
                                                ),
                                                onTap: () => _backupProvider
                                                    ?.cancelUploading(),
                                                child: Padding(
                                                  padding: EdgeInsets.all(
                                                    Dimensions
                                                        .backupProcessCancelIconPadding
                                                        .h,
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
                                            .restoreBackupProcessAndStatusBetweenSpacing
                                            .h,
                                      ),
                                      Selector<BackupProvider,
                                          Tuple2<String, String>>(
                                        selector: (_, state) => Tuple2(
                                          state.uploadedBackupSizeToUpload,
                                          state.totalBackupSizeToUpload,
                                        ),
                                        builder: (context, tuple, child) {
                                          return Text(
                                            (tuple.item1 ==
                                                        Strings
                                                            .defaultFileSize &&
                                                    tuple.item2 ==
                                                        Strings.defaultFileSize)
                                                ? _localizationsContext!
                                                    .preparingBackup
                                                : _localizationsContext!
                                                    .backupUploadingStatus(
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
                                                  .restoreBackupUploadingStatusTextSize
                                                  .sp,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _lastBackupInfoWidget(),
                                      SizedBox(
                                        height: Dimensions
                                            .restoreBackupContentAndButtonBetweenSpacing
                                            .h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ButtonWidget(
                                            text: _localizationsContext!
                                                .btnBackup,
                                            onClick: () => _backupProvider
                                                ?.startBackupProcess(
                                              context,
                                            ),
                                            horizontalPadding: Dimensions
                                                .restoreBackupButtonHorizontalPadding
                                                .w,
                                            textColor: StaticFunctions.getColor(
                                              context,
                                              ColorEnum.whiteColor,
                                            ),
                                            bgColor: StaticFunctions.getColor(
                                              context,
                                              ColorEnum.themeColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                          );
                        },
                      ),
                      _driveBackupSettingsWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
