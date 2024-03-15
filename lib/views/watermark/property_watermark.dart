import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';

import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../views/watermark/property_watermark_provider.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/measure_size_widget.dart';
import '../../widgets/text_field_widget.dart';
import '../../widgets/toolbar.dart';

class PropertyWatermark extends StatelessWidget {
  const PropertyWatermark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UploadWatermarkProvider(),
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
  UploadWatermarkProvider? provider;
  AppLocalizations? localizationsContext;

  @override
  void didChangeDependencies() {
    localizationsContext = AppLocalizations.of(context)!;
    if (provider == null) {
      provider = Provider.of<UploadWatermarkProvider>(context, listen: false);
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        provider!.init(localizationsContext!);
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeConfig.appBar(context),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(
              Dimensions.uploadWatermarkBottomBarBorderRadius.r,
            ),
            topLeft: Radius.circular(
              Dimensions.uploadWatermarkBottomBarBorderRadius.r,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: StaticFunctions.getColor(
                context,
                ColorEnum.shadowColor,
              ),
              blurRadius: Dimensions.uploadWatermarkBottomBarShadowRadius.r,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(
                Dimensions.uploadWatermarkBottomBarBorderRadius.r,
              ),
              topLeft: Radius.circular(
                Dimensions.uploadWatermarkBottomBarBorderRadius.r,
              ),
            ),
            color: StaticFunctions.getColor(
              context,
              ColorEnum.whiteColor,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.screenHorizontalMargin.w,
                  vertical: Dimensions.screenVerticalMarginBottom.h,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          right: Dimensions
                              .uploadWatermarkBottomButtonSpacingBetween.w,
                        ),
                        child: ButtonWidget(
                          text: localizationsContext!.btnCancelWatermark,
                          onClick: () => Navigator.pop(context),
                          borderWidth: Dimensions
                              .uploadWatermarkBottomButtonBorderWidth.w,
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
                            ColorEnum.themeColorOpacity3Percentage,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          left: Dimensions
                              .uploadWatermarkBottomButtonSpacingBetween.w,
                        ),
                        child: Selector<UploadWatermarkProvider, bool>(
                          shouldRebuild: (prev, next) => prev != next,
                          selector: (_, state) => state.isValid,
                          builder: (context, isValid, child) => ButtonWidget(
                            text: localizationsContext!.btnSaveWatermark,
                            onClick: () => provider?.updateWatermark(context),
                            borderWidth: Dimensions
                                .uploadWatermarkBottomButtonBorderWidth.w,
                            textColor: StaticFunctions.getColor(
                              context,
                              isValid
                                  ? ColorEnum.whiteColor
                                  : ColorEnum.gray90Color,
                            ),
                            borderColor: StaticFunctions.getColor(
                              context,
                              isValid
                                  ? ColorEnum.themeColor
                                  : ColorEnum.borderColorE0,
                            ),
                            bgColor: StaticFunctions.getColor(
                              context,
                              isValid
                                  ? ColorEnum.themeColor
                                  : ColorEnum.themeColorOpacity3Percentage,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ToolBar(
              title: localizationsContext!.titleUploadWatermark,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.screenHorizontalMargin.w,
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Dimensions.screenVerticalMarginBottom.h,
                      ),
                      Container(
                        child: Selector<UploadWatermarkProvider, bool>(
                          shouldRebuild: (prev, next) => prev != next,
                          selector: (_, state) => state.isTypeImageSelected,
                          builder: (context, isTypeImageSelected, child) {
                            return Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      right: Dimensions
                                          .uploadWatermarkTypesSpacingBetween.w,
                                    ),
                                    child: ButtonWidget(
                                      text: localizationsContext!
                                          .watermarkTypeImage,
                                      onClick: () =>
                                          provider?.switchWatermarkType(true),
                                      borderWidth: Dimensions
                                          .uploadWatermarkBottomButtonBorderWidth
                                          .w,
                                      textColor: StaticFunctions.getColor(
                                        context,
                                        isTypeImageSelected
                                            ? ColorEnum.whiteColor
                                            : ColorEnum.blackColor,
                                      ),
                                      borderColor: StaticFunctions.getColor(
                                        context,
                                        isTypeImageSelected
                                            ? ColorEnum.themeColor
                                            : ColorEnum.borderColorE0,
                                      ),
                                      fontWeight: FontWeight.w600,
                                      bgColor: StaticFunctions.getColor(
                                        context,
                                        isTypeImageSelected
                                            ? ColorEnum.themeColor
                                            : ColorEnum
                                                .themeColorOpacity3Percentage,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: Dimensions
                                          .uploadWatermarkTypesSpacingBetween.w,
                                    ),
                                    child: ButtonWidget(
                                      text: localizationsContext!
                                          .watermarkTypeText,
                                      onClick: () =>
                                          provider?.switchWatermarkType(false),
                                      borderWidth: Dimensions
                                          .uploadWatermarkBottomButtonBorderWidth
                                          .w,
                                      textColor: StaticFunctions.getColor(
                                        context,
                                        !isTypeImageSelected
                                            ? ColorEnum.whiteColor
                                            : ColorEnum.blackColor,
                                      ),
                                      borderColor: StaticFunctions.getColor(
                                        context,
                                        !isTypeImageSelected
                                            ? ColorEnum.themeColor
                                            : ColorEnum.borderColorE0,
                                      ),
                                      fontWeight: FontWeight.w600,
                                      bgColor: StaticFunctions.getColor(
                                        context,
                                        !isTypeImageSelected
                                            ? ColorEnum.themeColor
                                            : ColorEnum
                                                .themeColorOpacity3Percentage,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height:
                            Dimensions.uploadWatermarkContentSpacingBetween.h,
                      ),
                      Container(
                        child: Selector<UploadWatermarkProvider, bool>(
                          shouldRebuild: (prev, next) => prev != next,
                          selector: (_, state) => state.isTypeImageSelected,
                          builder: (context, isTypeImageSelected, child) {
                            return AnimatedSwitcher(
                              duration: const Duration(
                                milliseconds: 250,
                              ),
                              switchInCurve: Curves.easeIn,
                              switchOutCurve: Curves.easeOut,
                              child: isTypeImageSelected
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Selector<UploadWatermarkProvider,
                                            File?>(
                                          shouldRebuild: (prev, next) => true,
                                          selector: (_, state) =>
                                              state.selectedImage,
                                          builder: (_, file, __) {
                                            String fileName = file != null
                                                ? path.basename(file.path)
                                                : '${localizationsContext!.appName}${Strings.pngFileExtension}';
                                            return InkWell(
                                              onTap: () => provider
                                                  ?.openImagePicker(context),
                                              splashColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  IgnorePointer(
                                                    ignoring: true,
                                                    child: TextFieldWidget(
                                                      label: localizationsContext!
                                                          .watermarkTitleFileUpload,
                                                      maxLength: AppConfig
                                                          .watermarkTextMaxLength,
                                                      keepLabelAlwaysOnTop:
                                                          true,
                                                      onValueChanged: (int?
                                                                  currentIndex,
                                                              String value) =>
                                                          {},
                                                    ),
                                                  ),
                                                  IntrinsicHeight(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                        horizontal: Dimensions
                                                            .uploadWatermarkFileBoxInnerHorizontalSpacing
                                                            .w,
                                                        vertical: Dimensions
                                                            .uploadWatermarkFileBoxInnerVerticalSpacing
                                                            .h,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            height: Dimensions
                                                                .uploadWatermarkFileBoxImageBoxSize
                                                                .h,
                                                            width: Dimensions
                                                                .uploadWatermarkFileBoxImageBoxSize
                                                                .h,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                Dimensions
                                                                    .uploadWatermarkFileBoxImageBoxRadius
                                                                    .r,
                                                              ),
                                                              border:
                                                                  Border.all(
                                                                color:
                                                                    StaticFunctions
                                                                        .getColor(
                                                                  context,
                                                                  ColorEnum
                                                                      .borderColorE0,
                                                                ),
                                                                width: Dimensions
                                                                    .uploadWatermarkFileBoxImageBoxBorderWidth
                                                                    .w,
                                                              ),
                                                            ),
                                                            padding:
                                                                EdgeInsets.all(
                                                              Dimensions
                                                                  .uploadWatermarkFileBoxImageBoxInnerSpacing
                                                                  .h,
                                                            ),
                                                            child: Center(
                                                              child: file ==
                                                                      null
                                                                  ? Image.asset(
                                                                      Strings
                                                                          .iconAppLogo,
                                                                      color: StaticFunctions
                                                                          .getColor(
                                                                        context,
                                                                        ColorEnum
                                                                            .themeColor,
                                                                      ),
                                                                    )
                                                                  : Image(
                                                                      image:
                                                                          FileImage(
                                                                        file,
                                                                      ),
                                                                      color: path.extension(file.path) ==
                                                                              Strings.pngFileExtension
                                                                          ? StaticFunctions.getColor(
                                                                              context,
                                                                              ColorEnum.blackColor,
                                                                            )
                                                                          : null,
                                                                    ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: Dimensions
                                                                .uploadWatermarkFileNameAndImageSpacingBetween
                                                                .w,
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              fileName,
                                                              maxLines: 1,
                                                              style: TextStyle(
                                                                fontSize: Dimensions
                                                                    .uploadWatermarkFileNameTextSize
                                                                    .sp,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                color:
                                                                    StaticFunctions
                                                                        .getColor(
                                                                  context,
                                                                  ColorEnum
                                                                      .blackColor,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.all(
                                                              Dimensions
                                                                  .uploadWatermarkFileBoxFolderIconSpacing
                                                                  .w,
                                                            ),
                                                            child: SvgPicture
                                                                .asset(
                                                              Strings
                                                                  .iconFolder,
                                                              color:
                                                                  StaticFunctions
                                                                      .getColor(
                                                                context,
                                                                ColorEnum
                                                                    .themeColor,
                                                              ),
                                                              height: Dimensions
                                                                  .uploadWatermarkFileBoxFolderIconSize
                                                                  .h,
                                                              width: Dimensions
                                                                  .uploadWatermarkFileBoxFolderIconSize
                                                                  .h,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          height: Dimensions
                                              .uploadWatermarkWarningMarginTop
                                              .h,
                                        ),
                                        Text(
                                          localizationsContext!
                                              .watermarkImageWarning,
                                          style: TextStyle(
                                            fontSize: Dimensions
                                                .uploadWatermarkFileWarningTextSize
                                                .sp,
                                            color: StaticFunctions.getColor(
                                              context,
                                              ColorEnum.themeColor,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Selector<UploadWatermarkProvider,
                                            TextEditingController>(
                                          shouldRebuild: (prev, next) => true,
                                          selector: (_, state) =>
                                              state.watermarkTextController,
                                          builder:
                                              (context, controller, child) {
                                            return TextFieldWidget(
                                              onValueChanged:
                                                  (int? currentIndex,
                                                          String value) =>
                                                      provider?.validate(),
                                              controller: controller,
                                              keepLabelAlwaysOnTop: true,
                                              label: localizationsContext!
                                                  .watermarkTitleEnterText,
                                              keyBoardType:
                                                  TextInputType.visiblePassword,
                                              inputAction: TextInputAction.done,
                                              maxLength: AppConfig
                                                  .watermarkTextMaxLength,
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          height: Dimensions
                                              .uploadWatermarkWarningMarginTop
                                              .h,
                                        ),
                                        Text(
                                          localizationsContext!
                                              .watermarkTextWarning,
                                          style: TextStyle(
                                            fontSize: Dimensions
                                                .uploadWatermarkFileWarningTextSize
                                                .sp,
                                            color: StaticFunctions.getColor(
                                              context,
                                              ColorEnum.themeColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height:
                            Dimensions.uploadWatermarkContentSpacingBetween.h,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              localizationsContext!
                                  .watermarkTitleWatermarkPreview,
                              style: TextStyle(
                                color: StaticFunctions.getColor(
                                  context,
                                  ColorEnum.blackColor,
                                ),
                                fontSize: Dimensions
                                    .uploadWatermarkSubtitleTextSize.sp,
                              ),
                            ),
                            SizedBox(
                              height: Dimensions
                                  .uploadWatermarkSubtitleAndContentSpacingBetween
                                  .h,
                            ),
                            MeasureSize(
                              onChange: (size) {
                                provider?.setWatermarkPreviewSize(size);
                              },
                              child: Selector<UploadWatermarkProvider, Size>(
                                shouldRebuild: (prev, next) => true,
                                selector: (_, state) =>
                                    state.watermarkPreviewSize,
                                builder: (_, watermarkPreviewSizing, __) {
                                  final watermarkPreviewSize =
                                      watermarkPreviewSizing.width;
                                  final watermarkIconSize =
                                      watermarkPreviewSize * 0.13;
                                  final watermarkTextSize =
                                      (watermarkPreviewSize * 0.1).sp;
                                  final watermarkIconAroundPadding =
                                      watermarkIconSize * 0.25;
                                  return Container(
                                    height: watermarkPreviewSize,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Positioned.fill(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: StaticFunctions.getColor(
                                                  context,
                                                  ColorEnum.borderColorE0,
                                                ),
                                                width: Dimensions
                                                    .uploadWatermarkPreviewIconBorderWidth
                                                    .w,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                Dimensions
                                                    .uploadWatermarkPreviewIconBorderRadius
                                                    .r,
                                              ),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                colorFilter:
                                                    new ColorFilter.mode(
                                                  StaticFunctions.getColor(
                                                    context,
                                                    ColorEnum.grayColor,
                                                  ),
                                                  BlendMode.multiply,
                                                ),
                                                image: AssetImage(
                                                  Strings.iconDummyBuilding,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Selector<UploadWatermarkProvider, Size>(
                                          shouldRebuild: (prev, next) => true,
                                          selector: (_, state) =>
                                              state.watermarkIconSize,
                                          builder:
                                              (context, watermarkSize, child) {
                                            return VerticalDivider(
                                              thickness: Dimensions
                                                  .uploadWatermarkPreviewWatermarkDividerThickness
                                                  .w,
                                              width: Dimensions
                                                  .uploadWatermarkPreviewWatermarkDividerThickness
                                                  .w,
                                              endIndent: (watermarkPreviewSize /
                                                      2) +
                                                  (watermarkSize.height / 2) +
                                                  watermarkIconAroundPadding,
                                              color: StaticFunctions.getColor(
                                                context,
                                                ColorEnum.whiteColor,
                                              ).withOpacity(
                                                AppConfig.watermarkOpacity,
                                              ),
                                            );
                                          },
                                        ),
                                        Selector<UploadWatermarkProvider, Size>(
                                          shouldRebuild: (prev, next) => true,
                                          selector: (_, state) =>
                                              state.watermarkIconSize,
                                          builder:
                                              (context, watermarkSize, child) {
                                            return VerticalDivider(
                                              thickness: Dimensions
                                                  .uploadWatermarkPreviewWatermarkDividerThickness
                                                  .w,
                                              width: Dimensions
                                                  .uploadWatermarkPreviewWatermarkDividerThickness
                                                  .w,
                                              indent: (watermarkPreviewSize /
                                                      2) +
                                                  (watermarkSize.height / 2) +
                                                  watermarkIconAroundPadding,
                                              color: StaticFunctions.getColor(
                                                context,
                                                ColorEnum.whiteColor,
                                              ).withOpacity(
                                                AppConfig.watermarkOpacity,
                                              ),
                                            );
                                          },
                                        ),
                                        Selector<UploadWatermarkProvider, Size>(
                                          shouldRebuild: (prev, next) => true,
                                          selector: (_, state) =>
                                              state.watermarkIconSize,
                                          builder:
                                              (context, watermarkSize, child) {
                                            return Divider(
                                              thickness: Dimensions
                                                  .uploadWatermarkPreviewWatermarkDividerThickness
                                                  .w,
                                              height: Dimensions
                                                  .uploadWatermarkPreviewWatermarkDividerThickness
                                                  .w,
                                              indent: (watermarkPreviewSize /
                                                      2) +
                                                  (watermarkSize.width / 2) +
                                                  watermarkIconAroundPadding,
                                              color: StaticFunctions.getColor(
                                                context,
                                                ColorEnum.whiteColor,
                                              ).withOpacity(
                                                AppConfig.watermarkOpacity,
                                              ),
                                            );
                                          },
                                        ),
                                        Selector<UploadWatermarkProvider, Size>(
                                          shouldRebuild: (prev, next) => true,
                                          selector: (_, state) =>
                                              state.watermarkIconSize,
                                          builder:
                                              (context, watermarkSize, child) {
                                            return Divider(
                                              thickness: Dimensions
                                                  .uploadWatermarkPreviewWatermarkDividerThickness
                                                  .w,
                                              height: Dimensions
                                                  .uploadWatermarkPreviewWatermarkDividerThickness
                                                  .w,
                                              endIndent: (watermarkPreviewSize /
                                                      2) +
                                                  (watermarkSize.width / 2) +
                                                  watermarkIconAroundPadding,
                                              color: StaticFunctions.getColor(
                                                context,
                                                ColorEnum.whiteColor,
                                              ).withOpacity(
                                                AppConfig.watermarkOpacity,
                                              ),
                                            );
                                          },
                                        ),
                                        Center(
                                          child: MeasureSize(
                                            onChange: (Size size) => provider
                                                ?.setWatermarkSize(size),
                                            child: Container(
                                              color: Colors.transparent,
                                              child: Selector<
                                                  UploadWatermarkProvider,
                                                  bool>(
                                                shouldRebuild: (prev, next) =>
                                                    prev != next,
                                                selector: (_, state) =>
                                                    state.isTypeImageSelected,
                                                builder: (context,
                                                    isTypeImageSelected,
                                                    child) {
                                                  return isTypeImageSelected
                                                      ? Selector<
                                                          UploadWatermarkProvider,
                                                          File?>(
                                                          shouldRebuild:
                                                              (prev, next) =>
                                                                  true,
                                                          selector: (_,
                                                                  state) =>
                                                              state
                                                                  .selectedImage,
                                                          builder: (context,
                                                              image, child) {
                                                            return Container(
                                                              height:
                                                                  watermarkIconSize,
                                                              width:
                                                                  watermarkIconSize,
                                                              child: image ==
                                                                      null
                                                                  ? Image.asset(
                                                                      Strings
                                                                          .iconAppLogo,
                                                                      color: StaticFunctions
                                                                          .getColor(
                                                                        context,
                                                                        ColorEnum
                                                                            .whiteColor,
                                                                      ),
                                                                    )
                                                                  : Image(
                                                                      image:
                                                                          FileImage(
                                                                        image,
                                                                      ),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      color: path.extension(image.path) ==
                                                                              Strings.pngFileExtension
                                                                          ? StaticFunctions.getColor(
                                                                              context,
                                                                              ColorEnum.whiteColor,
                                                                            )
                                                                          : null,
                                                                    ),
                                                            );
                                                          },
                                                        )
                                                      : Selector<
                                                          UploadWatermarkProvider,
                                                          TextEditingController>(
                                                          shouldRebuild:
                                                              (prev, next) =>
                                                                  true,
                                                          selector: (_,
                                                                  state) =>
                                                              state
                                                                  .watermarkTextController,
                                                          builder: (context,
                                                              controller,
                                                              child) {
                                                            return Text(
                                                              controller.text,
                                                              style: TextStyle(
                                                                fontSize:
                                                                    watermarkTextSize,
                                                                color: StaticFunctions
                                                                    .getColor(
                                                                  context,
                                                                  ColorEnum
                                                                      .whiteColor,
                                                                ).withOpacity(
                                                                    AppConfig
                                                                        .watermarkOpacity),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.screenVerticalMarginBottom.h,
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
