import 'dart:collection';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import './model/share_type_model.dart';
import './sharing_option.dart';
import './sharing_option_item.dart';
import './sharing_options_dialog_provider.dart';
import '../../common_property_data_provider.dart';
import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/properties/db_property.dart';
import '../../localdb/properties/db_property_photos_meta.dart';
import '../../localdb/properties/db_saved_filter.dart';
import '../../localdb/save_default_data.dart';
import '../../utils/app_config.dart';
import '../../utils/compress_image_helper.dart';
import '../../utils/enums.dart';
import '../../utils/file_utils.dart';
import '../../utils/full_screen_progress.dart';
import '../../utils/static_functions.dart';
import '../../utils/watermark_utils.dart';
import '../../widgets/bottom_sheet_grid_item.dart';
import '../../widgets/light_divider.dart';
import '../../widgets/snack_bar_view.dart';
import '../settings/settings_provider.dart';

class ShareUtils {
  static final _sectionTitleKey = '_sectionTitle';
  static final double pdfTitleSize = 12;
  static final double pdfSharedByTextSize = 8;
  static final double pdfIconWidth = 95;
  static final double pdfIconHeight = 15;
  static final double pdfTextIconSize = 16;
  static final double sectionTitleSize = 10;
  static final double sectionKeyValuesSize = 10;
  static final _multiWidgetInSingleRowSectionKey = '_multiWidgetSectionKey';
  static final _singleWidgetInSingleRowSectionKey = '_singleWidgetSectionKey';
  static final _isarService = IsarService();
  static String betweenSectionBreak = '\n\n';
  static String betweenLineBreak = '\n';
  static const int _shareOptionTextId = 0;
  static const int _shareOptionImageId = 1;
  static const int _shareOptionPdfId = 2;

  static const String _shareOptionParamInquiry = 'selectedInquiry';
  static const String _shareOptionParamProperty = 'selectedProperty';
  static const String _shareOptionParamIsBasicDetails = 'basicDetails';
  static const String _shareOptionParamIsOtherDetails = 'otherDetails';
  static const String _shareOptionParamIsPhotosEnabled = 'photoEnabled';
  static const String _shareOptionParamIsWatermarkEnabled = 'watermarkEnabled';
  static const String _shareOptionParamIsLogoEnabled = 'logoEnabled';

  static showPropertySharePicker(
    BuildContext buildContext,
    AppLocalizations localizationsContext,
    DbProperty? selectedProperty,
  ) async {
    showModalBottomSheet(
      context: buildContext,
      isScrollControlled: true,
      builder: (dialogContext) {
        return SafeArea(
          child: ChangeNotifierProvider(
            create: (_) => SharingOptionsDialogProvider(),
            builder: (builderContext, _) {
              final shareOptionProvider =
                  Provider.of<SharingOptionsDialogProvider>(
                builderContext,
                listen: false,
              );
              WidgetsBinding.instance.addPostFrameCallback(
                (timeStamp) {
                  shareOptionProvider.initProperty(
                    builderContext,
                    selectedProperty,
                  );
                },
              );
              return Selector<SharingOptionsDialogProvider, ShareTypeModel?>(
                selector: (_, state) => state.shareType,
                shouldRebuild: (_, __) => true,
                builder: (_, model, child) {
                  if (model == null) {
                    return const SizedBox();
                  }
                  Map<String, dynamic> onItemSelectParams = Map();
                  onItemSelectParams[_shareOptionParamProperty] =
                      selectedProperty;
                  onItemSelectParams[_shareOptionParamIsPhotosEnabled] =
                      model.isPhotosEnabled;
                  onItemSelectParams[_shareOptionParamIsBasicDetails] =
                      model.isBasicDetailsEnabled;
                  onItemSelectParams[_shareOptionParamIsOtherDetails] =
                      model.isOtherDetailsEnabled;
                  onItemSelectParams[_shareOptionParamIsWatermarkEnabled] =
                      model.isWatermarkEnabled;
                  onItemSelectParams[_shareOptionParamIsLogoEnabled] =
                      model.isShareLogoEnabled;
                  return Padding(
                    padding: MediaQuery.of(builderContext).viewInsets,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ColoredBox(
                          color: StaticFunctions.getColor(
                            builderContext,
                            ColorEnum.themeColorOpacity6Percentage,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: Dimensions.screenHorizontalMargin.w,
                              right: (Dimensions.screenHorizontalMargin / 2).w,
                              top: Dimensions.bottomSheetTitleVerticalPadding.h,
                              bottom:
                                  Dimensions.bottomSheetTitleVerticalPadding.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  localizationsContext.sharingOptionDialogTitle,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize:
                                        Dimensions.bottomSheetTitleTextSize.sp,
                                    color: StaticFunctions.getColor(
                                      builderContext,
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
                                        Navigator.pop(dialogContext);
                                      },
                                      borderRadius: BorderRadius.circular(
                                        Dimensions.closeIconRippleRadius.r,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          Dimensions.closeIconPadding.w,
                                        ),
                                        child: SvgPicture.asset(
                                          Strings.iconBottomSheetClose,
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
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.screenVerticalMarginBottom.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      Dimensions.screenHorizontalMargin.w,
                                ),
                                child: Text(
                                  localizationsContext
                                      .sharingOptionDialogSubtitle,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: Dimensions
                                        .optionBottomSheetSubtitleTextSize.sp,
                                    color: StaticFunctions.getColor(
                                      builderContext,
                                      ColorEnum.blackColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Dimensions
                                    .optionBottomSheetSharingOptionVerticalMargin
                                    .h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      Dimensions.screenHorizontalMargin.w,
                                ),
                                child: LightDivider(),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: (Dimensions
                                          .optionBottomSheetSharingOptionVerticalMargin
                                          .h /
                                      2),
                                ),
                                child: Selector<SharingOptionsDialogProvider,
                                    List<SharingOption>>(
                                  selector: (_, state) => state.sharingOptions,
                                  shouldRebuild: (prev, next) => true,
                                  builder: (context, list, child) {
                                    return ListView.builder(
                                      itemCount: list.length,
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        final currentOption = list[index];
                                        return SharingOptionItem(
                                          option: currentOption,
                                          onClicked: () async {
                                            await Provider.of<SettingsProvider>(
                                              context,
                                              listen: false,
                                            ).onCheckChangedListener(
                                              list[index].settingId,
                                              !list[index].isEnabled,
                                            );
                                            shareOptionProvider
                                                .fetchSharingInfo();
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: Dimensions
                                    .optionBottomSheetBottomButtonMarginTop.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      Dimensions.screenHorizontalMargin.w,
                                ),
                                child: GridView(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: Dimensions
                                        .bottomSheetGridBoxItemHorizontalSpacing
                                        .h,
                                    mainAxisSpacing: Dimensions
                                        .bottomSheetGridBoxItemVerticalSpacing
                                        .h,
                                    childAspectRatio: (Dimensions
                                            .bottomSheetGridBoxItemAspectRatioWidth /
                                        Dimensions
                                            .bottomSheetGridBoxItemAspectRatioHeight),
                                  ),
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  children: [
                                    BottomSheetGridItem(
                                      title: localizationsContext
                                          .shareOptionOnlyText,
                                      icon: Strings.iconShareText,
                                      isDisabled: !(model.shareTextEnabled),
                                      onTap: () async {
                                        Navigator.pop(dialogContext);
                                        FullScreenProgress
                                            .showFullScreenProgress(
                                          buildContext,
                                          true,
                                        );
                                        await _onPropertyShareOptionSelected(
                                          buildContext,
                                          selected: _shareOptionTextId,
                                          localizationsContext:
                                              localizationsContext,
                                          params: onItemSelectParams,
                                        );
                                        FullScreenProgress
                                            .showFullScreenProgress(
                                          buildContext,
                                          false,
                                        );
                                      },
                                    ),
                                    /*BottomSheetGridItem(
                                      title: localizationsContext
                                          .shareOptionOnlyImage,
                                      icon: Strings.iconShareImage,
                                      isDisabled: !(model.shareImageEnabled),
                                      onTap: () {
                                        Navigator.pop(buildContext);
                                        _onPropertyShareOptionSelected(
                                          buildContext,
                                          selected: _shareOptionImageId,
                                          localizationsContext:
                                              localizationsContext,
                                          params: onItemSelectParams,
                                        );
                                      },
                                    ),*/
                                    BottomSheetGridItem(
                                      title: localizationsContext
                                          .shareOptionOnlyTextPDF,
                                      icon: Strings.iconSharePdf,
                                      isDisabled: !(model.sharePdfEnabled),
                                      onTap: () async {
                                        Navigator.pop(dialogContext);
                                        FullScreenProgress
                                            .showFullScreenProgress(
                                          buildContext,
                                          true,
                                        );
                                        await _onPropertyShareOptionSelected(
                                          buildContext,
                                          selected: _shareOptionPdfId,
                                          localizationsContext:
                                              localizationsContext,
                                          params: onItemSelectParams,
                                        );
                                        FullScreenProgress
                                            .showFullScreenProgress(
                                          buildContext,
                                          false,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        );
      },
      isDismissible: true,
      backgroundColor: StaticFunctions.getColor(
        buildContext,
        ColorEnum.whiteColor,
      ),
      barrierColor: StaticFunctions.getColor(
        buildContext,
        ColorEnum.bottomSheetBarrierColor,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
    );
  }

  static showInquirySharePicker(
    BuildContext buildContext,
    AppLocalizations localizationsContext,
    DbSavedFilter? selectedInquiry,
  ) async {
    showModalBottomSheet(
      context: buildContext,
      isScrollControlled: true,
      builder: (dialogContext) {
        return SafeArea(
          child: ChangeNotifierProvider(
            create: (_) => SharingOptionsDialogProvider(),
            builder: (builderContext, _) {
              final shareOptionProvider =
                  Provider.of<SharingOptionsDialogProvider>(
                builderContext,
                listen: false,
              );
              WidgetsBinding.instance.addPostFrameCallback(
                (timeStamp) {
                  shareOptionProvider.initInquiry(
                    builderContext,
                    selectedInquiry,
                  );
                },
              );
              return Selector<SharingOptionsDialogProvider, ShareTypeModel?>(
                selector: (_, state) => state.shareType,
                shouldRebuild: (_, __) => true,
                builder: (_, model, child) {
                  if (model == null) {
                    return const SizedBox();
                  }
                  Map<String, dynamic> onItemSelectParams = Map();
                  onItemSelectParams[_shareOptionParamInquiry] =
                      selectedInquiry;
                  onItemSelectParams[_shareOptionParamIsPhotosEnabled] =
                      model.isPhotosEnabled;
                  onItemSelectParams[_shareOptionParamIsWatermarkEnabled] =
                      model.isWatermarkEnabled;
                  onItemSelectParams[_shareOptionParamIsBasicDetails] =
                      model.isBasicDetailsEnabled;
                  onItemSelectParams[_shareOptionParamIsOtherDetails] =
                      model.isOtherDetailsEnabled;
                  onItemSelectParams[_shareOptionParamIsLogoEnabled] =
                      model.isShareLogoEnabled;
                  return Padding(
                    padding: MediaQuery.of(builderContext).viewInsets,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ColoredBox(
                          color: StaticFunctions.getColor(
                            builderContext,
                            ColorEnum.themeColorOpacity6Percentage,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: Dimensions.screenHorizontalMargin.w,
                              right: (Dimensions.screenHorizontalMargin / 2).w,
                              top: Dimensions.bottomSheetTitleVerticalPadding.h,
                              bottom:
                                  Dimensions.bottomSheetTitleVerticalPadding.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  localizationsContext.sharingOptionDialogTitle,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize:
                                        Dimensions.bottomSheetTitleTextSize.sp,
                                    color: StaticFunctions.getColor(
                                      builderContext,
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
                                        Navigator.pop(builderContext);
                                      },
                                      borderRadius: BorderRadius.circular(
                                        Dimensions.closeIconRippleRadius.r,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          Dimensions.closeIconPadding.w,
                                        ),
                                        child: SvgPicture.asset(
                                          Strings.iconBottomSheetClose,
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
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.screenVerticalMarginBottom.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      Dimensions.screenHorizontalMargin.w,
                                ),
                                child: Text(
                                  localizationsContext
                                      .sharingOptionDialogSubtitle,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: Dimensions
                                        .optionBottomSheetSubtitleTextSize.sp,
                                    color: StaticFunctions.getColor(
                                      builderContext,
                                      ColorEnum.blackColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Dimensions
                                    .optionBottomSheetSharingOptionVerticalMargin
                                    .h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      Dimensions.screenHorizontalMargin.w,
                                ),
                                child: LightDivider(),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: (Dimensions
                                          .optionBottomSheetSharingOptionVerticalMargin
                                          .h /
                                      2),
                                ),
                                child: Selector<SharingOptionsDialogProvider,
                                    List<SharingOption>>(
                                  selector: (_, state) => state.sharingOptions,
                                  shouldRebuild: (prev, next) => true,
                                  builder: (context, list, child) {
                                    return ListView.builder(
                                      itemCount: list.length,
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        final currentOption = list[index];
                                        return SharingOptionItem(
                                          option: currentOption,
                                          onClicked: () async {
                                            await Provider.of<SettingsProvider>(
                                              context,
                                              listen: false,
                                            ).onCheckChangedListener(
                                              list[index].settingId,
                                              !list[index].isEnabled,
                                            );
                                            shareOptionProvider
                                                .fetchSharingInfo();
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: Dimensions
                                    .optionBottomSheetBottomButtonMarginTop.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      Dimensions.screenHorizontalMargin.w,
                                ),
                                child: GridView(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: Dimensions
                                        .bottomSheetGridBoxItemHorizontalSpacing
                                        .h,
                                    mainAxisSpacing: Dimensions
                                        .bottomSheetGridBoxItemVerticalSpacing
                                        .h,
                                    childAspectRatio: (Dimensions
                                            .bottomSheetGridBoxItemAspectRatioWidth /
                                        Dimensions
                                            .bottomSheetGridBoxItemAspectRatioHeight),
                                  ),
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  children: [
                                    BottomSheetGridItem(
                                      title: localizationsContext
                                          .shareOptionOnlyText,
                                      icon: Strings.iconShareText,
                                      isDisabled: !(model.shareTextEnabled),
                                      onTap: () {
                                        Navigator.pop(buildContext);
                                        _onInquiryShareOptionSelected(
                                          buildContext,
                                          selected: _shareOptionTextId,
                                          localizationsContext:
                                              localizationsContext,
                                          params: onItemSelectParams,
                                        );
                                      },
                                    ),
                                    /*BottomSheetGridItem(
                                      title: localizationsContext
                                          .shareOptionOnlyImage,
                                      icon: Strings.iconShareImage,
                                      isDisabled: !(model.shareImageEnabled),
                                    ),*/
                                    BottomSheetGridItem(
                                      title: localizationsContext
                                          .shareOptionOnlyTextPDF,
                                      icon: Strings.iconSharePdf,
                                      isDisabled: !(model.sharePdfEnabled),
                                      onTap: () {
                                        Navigator.pop(buildContext);
                                        _onInquiryShareOptionSelected(
                                          buildContext,
                                          selected: _shareOptionPdfId,
                                          localizationsContext:
                                              localizationsContext,
                                          params: onItemSelectParams,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        );
      },
      isDismissible: true,
      backgroundColor: StaticFunctions.getColor(
        buildContext,
        ColorEnum.whiteColor,
      ),
      barrierColor: StaticFunctions.getColor(
        buildContext,
        ColorEnum.bottomSheetBarrierColor,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
    );
  }

  static _buildSectionWith(
    BuildContext context, {
    required pw.Font titleFont,
    required pw.Font keyValueFont,
    required LinkedHashMap<String, dynamic> map,
  }) {
    final section = LinkedHashMap<String, dynamic>.from(map);
    final sectionTitle = section.remove(_sectionTitleKey) as String?;
    final sectionTypeList = section.keys.toList();
    final sectionInfoList =
        section.values.map((e) => e as LinkedHashMap<String, String>).toList();
    if (sectionTypeList.isEmpty ||
        sectionInfoList.isEmpty ||
        sectionTypeList.length != sectionInfoList.length) {
      return pw.SizedBox();
    }
    int lastSectionIndex = -1;
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.SizedBox(height: 10),
        pw.Text(
          sectionTitle ?? 'unknown',
          style: pw.TextStyle(
            fontSize: sectionTitleSize,
            font: titleFont,
            color: PdfColor.fromInt(
              StaticFunctions.getColor(
                context,
                ColorEnum.blackColor,
              ).value,
            ),
          ),
        ),
        pw.SizedBox(height: 8),
        pw.Column(
          children: List.generate(
            sectionTypeList.length,
            (index) {
              final currentSectionType = sectionTypeList[index];
              final currentSectionMap = sectionInfoList[index];
              final currentSectionKeys = currentSectionMap.keys.toList();
              final currentSectionValues = currentSectionMap.values.toList();
              if (currentSectionType == _singleWidgetInSingleRowSectionKey) {
                return pw.Container(
                  child: pw.Column(
                    children: List.generate(
                      currentSectionMap.length,
                      (index) {
                        if (lastSectionIndex == -1) {
                          lastSectionIndex = index;
                        } else {
                          lastSectionIndex += 1;
                        }
                        return _getRowWithSingleWidget(
                          context,
                          title: currentSectionKeys[index],
                          value: currentSectionValues[index],
                          color: PdfColor.fromInt(
                            StaticFunctions.getColor(
                              context,
                              (lastSectionIndex % 2 == 0)
                                  ? ColorEnum.pdfRowDarkColor
                                  : ColorEnum.whiteColor,
                            ).value,
                          ),
                          font: keyValueFont,
                        );
                      },
                    ),
                  ),
                );
              } else if (currentSectionType ==
                  _multiWidgetInSingleRowSectionKey) {
                return pw.Container(
                  child: pw.Column(
                    children: List.generate(
                      (currentSectionMap.length / 2).ceil(),
                      (index) {
                        if (lastSectionIndex == -1) {
                          lastSectionIndex = index;
                        } else {
                          lastSectionIndex += 1;
                        }
                        final firstIndex = index * 2;
                        final secondIndex = (index * 2) + 1;
                        final shouldShowFirstRow =
                            firstIndex < currentSectionMap.length;
                        final shouldShowSecondRow =
                            secondIndex < currentSectionMap.length;
                        return pw.Container(
                          color: PdfColor.fromInt(
                            StaticFunctions.getColor(
                              context,
                              (lastSectionIndex % 2 == 0)
                                  ? ColorEnum.pdfRowDarkColor
                                  : ColorEnum.whiteColor,
                            ).value,
                          ),
                          padding: pw.EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: pw.Row(
                            mainAxisSize: pw.MainAxisSize.max,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              if (shouldShowFirstRow)
                                pw.Expanded(
                                  child: pw.Text(
                                    currentSectionKeys[firstIndex],
                                    style: pw.TextStyle(
                                      fontSize: sectionKeyValuesSize,
                                      font: keyValueFont,
                                      lineSpacing: 1,
                                      color: PdfColor.fromInt(
                                        StaticFunctions.getColor(
                                          context,
                                          ColorEnum.pdfRowTitleTextColor,
                                        ).value,
                                      ),
                                    ),
                                  ),
                                ),
                              if (shouldShowFirstRow)
                                pw.Expanded(
                                  flex: !shouldShowSecondRow ? 3 : 1,
                                  child: pw.Text(
                                    currentSectionValues[firstIndex],
                                    style: pw.TextStyle(
                                      fontSize: sectionKeyValuesSize,
                                      font: keyValueFont,
                                      lineSpacing: 1,
                                      color: PdfColor.fromInt(
                                        StaticFunctions.getColor(
                                          context,
                                          ColorEnum.blackColor,
                                        ).value,
                                      ),
                                    ),
                                  ),
                                ),
                              if (shouldShowSecondRow)
                                pw.Expanded(
                                  child: pw.Text(
                                    currentSectionKeys[secondIndex],
                                    style: pw.TextStyle(
                                      fontSize: sectionKeyValuesSize,
                                      font: keyValueFont,
                                      lineSpacing: 1,
                                      color: PdfColor.fromInt(
                                        StaticFunctions.getColor(
                                          context,
                                          ColorEnum.pdfRowTitleTextColor,
                                        ).value,
                                      ),
                                    ),
                                  ),
                                ),
                              if (shouldShowSecondRow)
                                pw.Expanded(
                                  flex: !shouldShowFirstRow ? 3 : 1,
                                  child: pw.Text(
                                    currentSectionValues[secondIndex],
                                    style: pw.TextStyle(
                                      fontSize: sectionKeyValuesSize,
                                      font: keyValueFont,
                                      lineSpacing: 1,
                                      color: PdfColor.fromInt(
                                        StaticFunctions.getColor(
                                          context,
                                          ColorEnum.blackColor,
                                        ).value,
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
                );
              }
              return pw.SizedBox();
            },
          ),
        )
      ],
    );
  }

  static _getRowWithSingleWidget(
    BuildContext context, {
    required String title,
    required String value,
    required PdfColor color,
    required pw.Font font,
  }) {
    return pw.Container(
      color: color,
      padding: pw.EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      child: pw.Row(
        mainAxisSize: pw.MainAxisSize.max,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Expanded(
            flex: 1,
            child: pw.Text(
              title,
              style: pw.TextStyle(
                fontSize: sectionKeyValuesSize,
                font: font,
                lineSpacing: 1,
                color: PdfColor.fromInt(
                  StaticFunctions.getColor(
                    context,
                    ColorEnum.pdfRowTitleTextColor,
                  ).value,
                ),
              ),
            ),
          ),
          pw.Expanded(
            flex: 3,
            child: pw.Text(
              value,
              style: pw.TextStyle(
                fontSize: sectionKeyValuesSize,
                font: font,
                lineSpacing: 1,
                color: PdfColor.fromInt(
                  StaticFunctions.getColor(
                    context,
                    ColorEnum.blackColor,
                  ).value,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Future<LinkedHashMap<String, dynamic>?> _buildOtherDetailsMapForPdf({
    required AppLocalizations localizationsContext,
    DbProperty? selectedProperty,
    DbSavedFilter? selectedInquiry,
  }) async {
    LinkedHashMap<String, dynamic> map = LinkedHashMap();

    LinkedHashMap<String, String>? multiWidgetInSingleRowMap =
        await _buildMapForMultiWidgetInSingleRow(
      localizationsContext: localizationsContext,
      selectedProperty: selectedProperty,
      selectedInquiry: selectedInquiry,
    );
    if (multiWidgetInSingleRowMap != null &&
        multiWidgetInSingleRowMap.isNotEmpty) {
      map[_multiWidgetInSingleRowSectionKey] = multiWidgetInSingleRowMap;
    }

    LinkedHashMap<String, String>? singleWidgetInSingleRowMap =
        await _buildMapForSingleWidgetInSingleRow(
      localizationsContext: localizationsContext,
      selectedProperty: selectedProperty,
      selectedInquiry: selectedInquiry,
    );
    if (singleWidgetInSingleRowMap != null &&
        singleWidgetInSingleRowMap.isNotEmpty) {
      map[_singleWidgetInSingleRowSectionKey] = singleWidgetInSingleRowMap;
    }

    if (map.isNotEmpty) {
      LinkedHashMap<String, dynamic> innerMap = LinkedHashMap();
      innerMap[_sectionTitleKey] = localizationsContext.otherDetails;
      innerMap.addAll(map);
      return innerMap;
    }
    return null;
  }

  static Future<LinkedHashMap<String, String>?>
      _buildMapForSingleWidgetInSingleRow({
    required AppLocalizations localizationsContext,
    DbProperty? selectedProperty,
    DbSavedFilter? selectedInquiry,
  }) async {
    LinkedHashMap<String, String> singlePairInSingleRowMap = LinkedHashMap();
    final propertyTypeId = selectedProperty?.propertyTypeId ??
        selectedInquiry?.propertyType!.first;

    if (AppConfig.shouldShowAdditionalFurnishingInShare) {
      final additionalFurnishedValues =
          selectedProperty?.additionalFurnishing ??
              selectedInquiry?.additionalFurnish;
      if (additionalFurnishedValues != null &&
          additionalFurnishedValues.isNotEmpty) {
        String additionalFurnishedString = '';
        additionalFurnishedValues.forEachIndexed(
          (i, element) {
            additionalFurnishedString += element;
            if (i != additionalFurnishedValues.length - 1) {
              additionalFurnishedString += ', ';
            }
          },
        );
        if (additionalFurnishedString.trim().isNotEmpty) {
          singlePairInSingleRowMap[localizationsContext.additionalFurnishing] =
              additionalFurnishedString;
        } else {
          singlePairInSingleRowMap[localizationsContext.additionalFurnishing] =
              '-';
        }
      } else if (CommonPropertyDataProvider.isNotPlotOrLandMark(
          [propertyTypeId])) {
        singlePairInSingleRowMap[localizationsContext.additionalFurnishing] =
            '-';
      }
    }

    final preferredCommunityValues =
        selectedProperty?.preferredCommunityValues ??
            selectedInquiry?.preferredCaste;
    if (preferredCommunityValues != null &&
        preferredCommunityValues.isNotEmpty) {
      String preferredCommunityString = '';
      preferredCommunityValues.forEachIndexed(
        (i, element) {
          preferredCommunityString += element;
          if (i != preferredCommunityValues.length - 1) {
            preferredCommunityString += ', ';
          }
        },
      );
      if (preferredCommunityString.trim().isNotEmpty) {
        singlePairInSingleRowMap[localizationsContext.preferredCast] =
            preferredCommunityString;
      } else {
        singlePairInSingleRowMap[localizationsContext.preferredCast] = '-';
      }
    } else {
      singlePairInSingleRowMap[localizationsContext.preferredCast] = '-';
    }

    final amenitiesValues =
        selectedProperty?.amenitiesValues ?? selectedInquiry?.selectedAmenities;
    if (amenitiesValues != null && amenitiesValues.isNotEmpty) {
      String amenitiesValuesString = '';
      amenitiesValues.forEachIndexed(
        (i, element) {
          amenitiesValuesString += element;
          if (i != amenitiesValues.length - 1) {
            amenitiesValuesString += ', ';
          }
        },
      );
      if (amenitiesValuesString.trim().isNotEmpty) {
        singlePairInSingleRowMap[localizationsContext.amenities] =
            amenitiesValuesString;
      } else {
        singlePairInSingleRowMap[localizationsContext.amenities] = '-';
      }
    } else if (CommonPropertyDataProvider.isNotPlotOrLandMark(
        [propertyTypeId])) {
      singlePairInSingleRowMap[localizationsContext.amenities] = '-';
    }
    if (singlePairInSingleRowMap.isNotEmpty) {
      return singlePairInSingleRowMap;
    }
    return null;
  }

  static Future<LinkedHashMap<String, String>?>
      _buildMapForMultiWidgetInSingleRow({
    required AppLocalizations localizationsContext,
    DbProperty? selectedProperty,
    DbSavedFilter? selectedInquiry,
  }) async {
    LinkedHashMap<String, String> multiPairInSingleRowMap = LinkedHashMap();
    final propertyTypeId = selectedProperty?.propertyTypeId ??
        selectedInquiry?.propertyType!.first;

    final buildingTypeIds = selectedProperty?.buildingTypeId != null
        ? [selectedProperty?.buildingTypeId as int]
        : selectedInquiry?.buildingType;
    if (buildingTypeIds != null && buildingTypeIds.isNotEmpty) {
      final buildingTypeFromDb =
          await _isarService.getBuildingTypeBasedOnIds(buildingTypeIds);
      String buildingTypeString = '';
      buildingTypeFromDb.forEachIndexed(
        (index, element) {
          buildingTypeString += element.name;
          if (index != buildingTypeFromDb.length - 1) {
            buildingTypeString += ', ';
          }
        },
      );
      if (buildingTypeString.trim().isNotEmpty) {
        multiPairInSingleRowMap[localizationsContext.buildingType] =
            buildingTypeString;
      } else {
        multiPairInSingleRowMap[localizationsContext.buildingType] = '-';
      }
    } else if (CommonPropertyDataProvider.checkForBuildingType(
        [propertyTypeId])) {
      multiPairInSingleRowMap[localizationsContext.buildingType] = '-';
    }

    final constructionTypeIds = selectedProperty?.constructionTypeId != null
        ? [selectedProperty?.constructionTypeId as int]
        : selectedInquiry?.constructionType;
    if (constructionTypeIds != null && constructionTypeIds.isNotEmpty) {
      final constructionTypeFromDb =
          await _isarService.getConstructionTypeByIds(constructionTypeIds);
      String constructionTypeString = '';
      constructionTypeFromDb.forEachIndexed(
        (index, element) {
          constructionTypeString += element.name;
          if (index != constructionTypeFromDb.length - 1) {
            constructionTypeString += ', ';
          }
        },
      );
      if (constructionTypeString.trim().isNotEmpty) {
        multiPairInSingleRowMap[localizationsContext.construction] =
            constructionTypeString;
      } else {
        multiPairInSingleRowMap[localizationsContext.construction] = '-';
      }
    } else if (CommonPropertyDataProvider.checkForConstruction(
        [propertyTypeId])) {
      multiPairInSingleRowMap[localizationsContext.construction] = '-';
    }

    final schemeTypeIds = selectedProperty?.schemeTypeId != null
        ? [selectedProperty?.schemeTypeId as int]
        : selectedInquiry?.schemeType;
    if (schemeTypeIds != null && schemeTypeIds.isNotEmpty) {
      final schemeTypeFromDb =
          await _isarService.getSchemeTypeByIds(schemeTypeIds);
      String schemeTypeString = '';
      schemeTypeFromDb.forEachIndexed(
        (index, element) {
          schemeTypeString += element.name;
          if (index != schemeTypeFromDb.length - 1) {
            schemeTypeString += ', ';
          }
        },
      );
      if (schemeTypeString.trim().isNotEmpty) {
        multiPairInSingleRowMap[localizationsContext.scheme] = schemeTypeString;
      } else {
        multiPairInSingleRowMap[localizationsContext.scheme] = '-';
      }
    } else if (CommonPropertyDataProvider.checkForScheme([propertyTypeId])) {
      multiPairInSingleRowMap[localizationsContext.scheme] = '-';
    }

    final furnishedTypeIds = selectedProperty?.propertyFurnishedStatusId != null
        ? [selectedProperty?.propertyFurnishedStatusId as int]
        : selectedInquiry?.furnishedType;
    if (furnishedTypeIds != null && furnishedTypeIds.isNotEmpty) {
      final furnishedStatusFromDb =
          await _isarService.getFurnishedStatusByIds(furnishedTypeIds);
      String furnishedStatusString = '';
      furnishedStatusFromDb.forEachIndexed(
        (index, element) {
          furnishedStatusString += element.name;
          if (index != furnishedStatusFromDb.length - 1) {
            furnishedStatusString += ', ';
          }
        },
      );
      if (furnishedStatusString.trim().isNotEmpty) {
        multiPairInSingleRowMap[localizationsContext.furnishedStatus] =
            furnishedStatusString;
      } else {
        multiPairInSingleRowMap[localizationsContext.furnishedStatus] = '-';
      }
    } else if (CommonPropertyDataProvider.isNotPlotOrLandMark(
        [propertyTypeId])) {
      multiPairInSingleRowMap[localizationsContext.furnishedStatus] = '-';
    }

    final bhkIds = selectedProperty?.bhkId != null
        ? [selectedProperty!.bhkId as int]
        : selectedInquiry?.bhkIds;
    final bathrooms =
        selectedProperty?.bathRoomCount ?? selectedInquiry?.bathroomCount;
    final rooms = selectedProperty?.roomCount ?? selectedInquiry?.roomCount;
    if ((bhkIds != null && bhkIds.isNotEmpty) ||
        (bathrooms != null && bathrooms > 0) ||
        (rooms != null && rooms > 0)) {
      String bhkStringValue = '';
      if (bhkIds != null && bhkIds.isNotEmpty) {
        final bhkFromDb = await _isarService.getBhkTypesByIds(bhkIds);
        bhkFromDb.forEachIndexed(
          (index, element) {
            bhkStringValue += element.name;
            if (index != bhkFromDb.length - 1) {
              bhkStringValue += ', ';
            }
          },
        );
      }
      if (bathrooms != null && bathrooms > 0) {
        if (bhkStringValue.trim().isNotEmpty) {
          bhkStringValue += ' / ';
        }
        bhkStringValue += '${bathrooms.toString()} Bath';
      }

      if (rooms != null && rooms > 0) {
        if (bhkStringValue.trim().isNotEmpty) {
          bhkStringValue += ' / ';
        }
        bhkStringValue += '${rooms.toString()} ${localizationsContext.rooms}';
      }
      if (bhkStringValue.trim().isNotEmpty) {
        multiPairInSingleRowMap[localizationsContext.selectBhk] =
            bhkStringValue;
      } else {
        multiPairInSingleRowMap[localizationsContext.selectBhk] = '-';
      }
    } else if (CommonPropertyDataProvider.checkForBhk([propertyTypeId]) ||
        CommonPropertyDataProvider.checkForBathRoom([propertyTypeId]) ||
        CommonPropertyDataProvider.checkForRoom([propertyTypeId])) {
      multiPairInSingleRowMap[localizationsContext.selectBhk] = '-';
    }

    final frontSize = selectedProperty?.frontSize ?? selectedInquiry?.frontSize;
    final depthSize = selectedProperty?.depthSize ?? selectedInquiry?.depthSize;
    if ((frontSize != null && frontSize > 0) ||
        (depthSize != null && depthSize > 0)) {
      String frontDepthSize = '';
      if (frontSize != null && frontSize > 0) {
        frontDepthSize =
            '${StaticFunctions.removeTrailingZeros(frontSize.toString())} ${localizationsContext.ft}';
      } else {
        frontDepthSize = '-';
      }

      if (frontDepthSize.trim().isNotEmpty) {
        frontDepthSize += ' / ';
      }

      if (depthSize != null && depthSize > 0) {
        frontDepthSize +=
            '${StaticFunctions.removeTrailingZeros(depthSize.toString())} ${localizationsContext.ft}';
      } else {
        frontDepthSize += '-';
      }

      if (frontDepthSize.trim().isNotEmpty) {
        multiPairInSingleRowMap[localizationsContext.frontDepth] =
            frontDepthSize;
      } else {
        multiPairInSingleRowMap[localizationsContext.frontDepth] = '-';
      }
    } else if (CommonPropertyDataProvider.checkForFrontDepthSize(
        [propertyTypeId])) {
      multiPairInSingleRowMap[localizationsContext.frontDepth] = '-';
    }

    final connectedRoads =
        selectedProperty?.connectedRoads ?? selectedInquiry?.connectedRoads;
    if (connectedRoads != null && connectedRoads.isNotEmpty) {
      String connectedRoadsString = '';
      connectedRoadsString =
          '${StaticFunctions.removeTrailingZeros(connectedRoads.first.toString())} ${localizationsContext.ft}';

      if (connectedRoadsString.trim().isNotEmpty && connectedRoads.length > 1) {
        connectedRoadsString += ' / ';
      }

      if (connectedRoads.length > 1) {
        connectedRoadsString +=
            '${StaticFunctions.removeTrailingZeros(connectedRoads.last.toString())} ${localizationsContext.ft}';
      }

      if (connectedRoadsString.trim().isNotEmpty) {
        multiPairInSingleRowMap[localizationsContext.connectedRoad] =
            connectedRoadsString;
      } else {
        multiPairInSingleRowMap[localizationsContext.connectedRoad] = '-';
      }
    } else if (CommonPropertyDataProvider.checkForConnectedRoad(
        [propertyTypeId])) {
      multiPairInSingleRowMap[localizationsContext.connectedRoad] = '-';
    }

    final balcony =
        selectedProperty?.balcony ?? selectedInquiry?.isBalconyAvailable;
    if (balcony != null) {
      multiPairInSingleRowMap[localizationsContext.balcony] =
          balcony ? localizationsContext.yes : localizationsContext.no;
    } else if (CommonPropertyDataProvider.isNotPlotOrLandMark(
        [propertyTypeId])) {
      multiPairInSingleRowMap[localizationsContext.balcony] = '-';
    }

    final isWashRoomAvailable = selectedProperty?.isWashRoomAvailable ??
        selectedInquiry?.isWashroomAvailable;
    if (isWashRoomAvailable != null) {
      multiPairInSingleRowMap[localizationsContext.washroom] =
          isWashRoomAvailable
              ? localizationsContext.yes
              : localizationsContext.no;
    } else if (CommonPropertyDataProvider.checkForWashRoomAvailable(
        [propertyTypeId])) {
      multiPairInSingleRowMap[localizationsContext.washroom] = '-';
    }

    final lightConnection = selectedProperty?.lightConnection ??
        selectedInquiry?.isLightConnectionAvailable;
    if (lightConnection != null) {
      multiPairInSingleRowMap[localizationsContext.lightConnection] =
          lightConnection ? localizationsContext.yes : localizationsContext.no;
    } else if (CommonPropertyDataProvider.checkForLightConnection(
        [propertyTypeId])) {
      multiPairInSingleRowMap[localizationsContext.lightConnection] = '-';
    }

    final isWellAvailable =
        selectedProperty?.isWellAvailable ?? selectedInquiry?.isWellAvailable;
    if (isWellAvailable != null) {
      multiPairInSingleRowMap[localizationsContext.wellAvailable] =
          isWellAvailable ? localizationsContext.yes : localizationsContext.no;
    } else if (CommonPropertyDataProvider.checkForWellAvailable(
        [propertyTypeId])) {
      multiPairInSingleRowMap[localizationsContext.wellAvailable] = '-';
    }

    final isCornerPiece =
        selectedProperty?.isCornerPiece ?? selectedInquiry?.isCornerPiece;
    if (isCornerPiece != null) {
      multiPairInSingleRowMap[localizationsContext.cornerPiece] =
          isCornerPiece ? localizationsContext.yes : localizationsContext.no;
    } else if (CommonPropertyDataProvider.checkForCornerPiece(
        [propertyTypeId])) {
      multiPairInSingleRowMap[localizationsContext.cornerPiece] = '-';
    }

    final isParkingAvailable = selectedProperty?.isParkingAvailable ??
        selectedInquiry?.isParkingAvailable;
    if (isParkingAvailable != null) {
      multiPairInSingleRowMap[localizationsContext.parkingAvailable] =
          isParkingAvailable
              ? localizationsContext.yes
              : localizationsContext.no;
    } else if (CommonPropertyDataProvider.checkForParkingAvailable(
        [propertyTypeId])) {
      multiPairInSingleRowMap[localizationsContext.parkingAvailable] = '-';
    }

    final isAllottedParking = selectedProperty?.isAllottedParking ??
        selectedInquiry?.isAllottedParkingAvailable;
    if (isAllottedParking != null) {
      multiPairInSingleRowMap[localizationsContext.allottedParking] =
          isAllottedParking
              ? localizationsContext.yes
              : localizationsContext.no;
    } else if (CommonPropertyDataProvider.checkForAllottedParkingAvailable(
        [propertyTypeId])) {
      multiPairInSingleRowMap[localizationsContext.allottedParking] = '-';
    }

    final isLiftAvailable =
        selectedProperty?.isLiftAvailable ?? selectedInquiry?.isLiftAvailable;
    if (isLiftAvailable != null) {
      multiPairInSingleRowMap[localizationsContext.liftAvailable] =
          isLiftAvailable ? localizationsContext.yes : localizationsContext.no;
    } else if (CommonPropertyDataProvider.checkForLiftAvailable(
        [propertyTypeId])) {
      multiPairInSingleRowMap[localizationsContext.liftAvailable] = '-';
    }

    final floorCount =
        selectedProperty?.floorCount ?? selectedInquiry?.floorCount;
    if (floorCount != null) {
      multiPairInSingleRowMap[localizationsContext.floors] =
          floorCount.toString();
    } else if (CommonPropertyDataProvider.checkForFloor([propertyTypeId])) {
      multiPairInSingleRowMap[localizationsContext.floors] = '-';
    }

    final totalFloorCount =
        selectedProperty?.totalFloorCount ?? selectedInquiry?.totalFloorCount;
    if (totalFloorCount != null) {
      multiPairInSingleRowMap[localizationsContext.totalFloors] =
          totalFloorCount.toString();
    } else if (CommonPropertyDataProvider.checkForTotalFloor(
        [propertyTypeId])) {
      multiPairInSingleRowMap[localizationsContext.totalFloors] = '-';
    }

    final facingIds = selectedProperty?.facingId != null
        ? [selectedProperty?.facingId as int]
        : selectedInquiry?.facingType;
    if (facingIds != null && facingIds.isNotEmpty) {
      final facingTypeFromDb =
          await _isarService.getFacingTypesByIds(facingIds);
      String facingTypeString = '';
      facingTypeFromDb.forEachIndexed(
        (index, element) {
          facingTypeString += element.name;
          if (index != facingTypeFromDb.length - 1) {
            facingTypeString += ', ';
          }
        },
      );
      if (facingTypeString.trim().isNotEmpty) {
        multiPairInSingleRowMap[localizationsContext.facingType] =
            facingTypeString;
      } else {
        multiPairInSingleRowMap[localizationsContext.facingType] = '-';
      }
    } else if (CommonPropertyDataProvider.checkForFacingType(
        [propertyTypeId])) {
      multiPairInSingleRowMap[localizationsContext.facingType] = '-';
    }
    if (multiPairInSingleRowMap.isNotEmpty) {
      return multiPairInSingleRowMap;
    }
    return null;
  }

  static Future<LinkedHashMap<String, dynamic>?> _buildBasicDetailsMapForPdf({
    required AppLocalizations localizationsContext,
    DbProperty? selectedProperty,
    DbSavedFilter? selectedInquiry,
  }) async {
    LinkedHashMap<String, String> basicDetails = LinkedHashMap();
    if (((selectedProperty != null &&
                selectedProperty.propertyAreaSize != null &&
                selectedProperty.propertyAreaUnitValue != null &&
                selectedProperty.propertyAreaUnitValue!.trim().isNotEmpty) ||
            (selectedInquiry != null &&
                selectedInquiry.measureUnitValue != null &&
                ((selectedInquiry.minMeasure != null &&
                        selectedInquiry.minMeasure! > 0) ||
                    (selectedInquiry.maxMeasure != null &&
                        selectedInquiry.maxMeasure! > 0)))) ||
        (selectedProperty != null && selectedProperty.bhkId != null) ||
        (selectedInquiry != null &&
            selectedInquiry.bhkIds != null &&
            selectedInquiry.bhkIds!.isNotEmpty)) {
      String sizeValueString = '';
      if (selectedProperty != null &&
          selectedProperty.propertyAreaSize != null &&
          selectedProperty.propertyAreaUnitValue != null &&
          selectedProperty.propertyAreaUnitValue!.trim().isNotEmpty) {
        sizeValueString =
            '${StaticFunctions.removeTrailingZeros(selectedProperty.propertyAreaSize.toString())} ${selectedProperty.propertyAreaUnitValue!}';
      }

      if (selectedInquiry != null &&
          selectedInquiry.measureUnitValue != null &&
          ((selectedInquiry.minMeasure != null &&
                  selectedInquiry.minMeasure! > 0) ||
              (selectedInquiry.maxMeasure != null &&
                  selectedInquiry.maxMeasure! > 0))) {
        if (selectedInquiry.minMeasure != null &&
            selectedInquiry.minMeasure! > 0.0) {
          if (selectedInquiry.maxMeasure == null ||
              selectedInquiry.maxMeasure! <= 0.0) {
            sizeValueString = '${localizationsContext.minFilterAreaUnit} ';
          }
          sizeValueString +=
              '${StaticFunctions.removeTrailingZeros(selectedInquiry.minMeasure.toString())}';
        }
        if (selectedInquiry.maxMeasure != null &&
            selectedInquiry.maxMeasure! > 0.0) {
          if (sizeValueString.trim().isEmpty) {
            sizeValueString = '${localizationsContext.maxFilterAreaUnit} ';
          } else if (selectedInquiry.minMeasure != null &&
              selectedInquiry.minMeasure! > 0.0) {
            sizeValueString += ' - ';
          }
          sizeValueString +=
              '${StaticFunctions.removeTrailingZeros(selectedInquiry.maxMeasure.toString())} ${selectedInquiry.measureUnitValue ?? ''}';
        } else if (selectedInquiry.minMeasure != null &&
            selectedInquiry.minMeasure! > 0.0) {
          sizeValueString += ' ${selectedInquiry.measureUnitValue ?? ''}';
        }
      }

      final bhkIds = selectedProperty?.bhkId != null
          ? [selectedProperty!.bhkId!]
          : selectedInquiry?.bhkIds != null
              ? selectedInquiry?.bhkIds
              : null;

      if (bhkIds != null && bhkIds.isNotEmpty) {
        final bhkFromDb = await _isarService.getBhkTypesByIds(bhkIds);
        if (bhkFromDb.isNotEmpty) {
          if (sizeValueString.trim().isNotEmpty) {
            sizeValueString += ' / ';
          }
          bhkFromDb.forEachIndexed((i, element) {
            sizeValueString += element.name;
            if (i != bhkFromDb.length - 1) {
              sizeValueString += ', ';
            }
          });
        }
      }
      if (sizeValueString.trim().isNotEmpty) {
        basicDetails[localizationsContext.totalSize] = sizeValueString;
      } else {
        basicDetails[localizationsContext.totalSize] = '-';
      }
    } else {
      basicDetails[localizationsContext.totalSize] = '-';
    }

    final inquiryPricingMap = StaticFunctions.getInquiryFormattedPrice(
      localizationsContext: localizationsContext,
      inquiry: selectedInquiry,
      priceUnitToForce: localizationsContext.rupeeText,
      showShortPrice: false,
    );

    if (((selectedProperty?.minSellPrice != null &&
                selectedProperty!.minSellPrice! > 0) ||
            (selectedProperty?.minRentPrice != null &&
                selectedProperty!.minRentPrice! > 0) ||
            (selectedProperty?.minLeasePrice != null &&
                selectedProperty!.minLeasePrice! > 0)) ||
        (inquiryPricingMap.isNotEmpty &&
            inquiryPricingMap.keys.every((element) => element != -1))) {
      String priceUnit = localizationsContext.rupeeText;

      String priceStringValue = '';
      if (selectedProperty != null) {
        if (selectedProperty.minSellPrice != null &&
            selectedProperty.minSellPrice! > 0) {
          priceStringValue +=
              '${localizationsContext.sell} $priceUnit${StaticFunctions.formatPrice(
            StaticFunctions.removeTrailingZeros(
              selectedProperty.minSellPrice.toString(),
            ),
          )}';
        }
        if (selectedProperty.minRentPrice != null &&
            selectedProperty.minRentPrice! > 0) {
          if (priceStringValue.trim().isNotEmpty) {
            priceStringValue += ' / ';
          }
          priceStringValue +=
              '${localizationsContext.rent} $priceUnit${StaticFunctions.formatPrice(
            StaticFunctions.removeTrailingZeros(
              selectedProperty.minRentPrice.toString(),
            ),
          )}';
        }
        if (selectedProperty.minLeasePrice != null &&
            selectedProperty.minLeasePrice! > 0) {
          if (priceStringValue.trim().isNotEmpty) {
            priceStringValue += ' / ';
          }
          priceStringValue +=
              '${localizationsContext.lease} $priceUnit${StaticFunctions.formatPrice(
            StaticFunctions.removeTrailingZeros(
              selectedProperty.minLeasePrice.toString(),
            ),
          )}';
        }
      } else if (selectedInquiry != null && inquiryPricingMap.isNotEmpty) {
        inquiryPricingMap.removeWhere((key, value) => value.trim().isEmpty);
        inquiryPricingMap.entries.forEachIndexed(
          (i, entry) {
            if (entry.value.trim().isNotEmpty) {
              if (entry.key == SaveDefaultData.propertyForSellId) {
                priceStringValue +=
                    '${localizationsContext.buy} ${entry.value}';
              } else if (entry.key == SaveDefaultData.propertyForRentId) {
                priceStringValue +=
                    '${localizationsContext.rent} ${entry.value}';
              } else if (entry.key == SaveDefaultData.propertyForLeaseId) {
                priceStringValue +=
                    '${localizationsContext.lease} ${entry.value}';
              }
            }
            if (priceStringValue.trim().isNotEmpty &&
                i != (inquiryPricingMap.entries.length - 1)) {
              priceStringValue += ' / ';
            }
          },
        );
      }
      if (priceStringValue.trim().isNotEmpty) {
        if (selectedProperty?.negotiationAllowed == true ||
            selectedInquiry?.isNegotiable == true) {
          priceStringValue += '\n*${localizationsContext.allowNegotiation}';
        }
        basicDetails[localizationsContext.totalPrice] = priceStringValue;
      } else {
        basicDetails[localizationsContext.totalPrice] = '-';
      }
    } else {
      basicDetails[localizationsContext.totalPrice] = '-';
    }

    final address =
        selectedProperty?.addressLandMark ?? selectedInquiry?.location ?? '';
    if (address.trim().isNotEmpty) {
      basicDetails[localizationsContext.location] = address;
    } else {
      basicDetails[localizationsContext.location] = '-';
    }

    if (selectedProperty?.exchangeAllowed == true) {
      basicDetails[localizationsContext.other] =
          localizationsContext.allowExchange;
    } else {
      basicDetails[localizationsContext.other] = '-';
    }
    if (basicDetails.isNotEmpty) {
      LinkedHashMap<String, dynamic> map = LinkedHashMap();
      map[_sectionTitleKey] = localizationsContext.basicDetails;
      map[_singleWidgetInSingleRowSectionKey] = basicDetails;
      return map;
    }
    return null;
  }

  static Future<File?> _generatePropertyPdf(
    BuildContext buildContext, {
    List<File>? imageList,
    required DbProperty selectedProperty,
    required bool isWatermarked,
    required Map<String, dynamic> params,
  }) async {
    final watermarkedPdfFile = File(
      await FileUtils.getPropertyPDFPath(
        propertyId: selectedProperty.id,
        isWatermarked: isWatermarked,
      ),
    );
    File? pdfFile;
    final List<File> cacheImageList = [];
    final List<File> imageWithCacheList = [];
    final doesPdfExists = await watermarkedPdfFile.exists();
    if (!doesPdfExists) {
      try {
        final userInfo = await _isarService.getUserInfo();
        final isLogoEnabled = params[_shareOptionParamIsLogoEnabled];
        final isBasicDetailsEnabled = params[_shareOptionParamIsBasicDetails];
        final isOtherDetailsEnabled = params[_shareOptionParamIsOtherDetails];
        AppLocalizations localizationsContext =
            AppLocalizations.of(buildContext)!;
        final appLogo = await rootBundle.loadString(Strings.appLogo);
        final isText =
            userInfo?.watermarkType == SaveDefaultData.watermarkTypeTextId;
        String? textLogo =
            isLogoEnabled && isText ? userInfo?.watermarkText : null;
        pw.Widget? logoWidget;
        if (isLogoEnabled &&
            !isText &&
            userInfo != null &&
            userInfo.watermarkLogoPath != null &&
            File(userInfo.watermarkLogoPath!).existsSync()) {
          logoWidget = pw.Image(
            pw.MemoryImage(
              File(userInfo.watermarkLogoPath!).readAsBytesSync(),
            ),
            height: pdfIconHeight,
            width: pdfIconWidth,
          );
        } else if (textLogo == null || textLogo.trim().isEmpty) {
          logoWidget = pw.SvgImage(
            svg: appLogo,
            width: pdfIconWidth,
            height: pdfIconHeight,
          );
        }

        final pdf = pw.Document();
        imageWithCacheList.clear();
        cacheImageList.clear();
        if (imageList != null && imageList.isNotEmpty) {
          await Future.forEach(
            imageList,
            (element) async {
              final fileName = basename(element.path);
              File fileToAdd = element;
              if (!fileName.startsWith(Strings.propertyWatermarkPrefixName)) {
                final tempFilePath = await FileUtils.getTempFilePath();
                await CompressImageHelper.compressHelper(
                  element.path,
                  tempFilePath,
                );
                fileToAdd = File(tempFilePath);
                cacheImageList.add(fileToAdd);
              }
              imageWithCacheList.add(fileToAdd);
            },
          );
        }
        final basicDetailsSection = isBasicDetailsEnabled
            ? await _buildBasicDetailsMapForPdf(
                localizationsContext: localizationsContext,
                selectedProperty: selectedProperty,
              )
            : null;
        final otherDetailsSection = isOtherDetailsEnabled
            ? await _buildOtherDetailsMapForPdf(
                localizationsContext: localizationsContext,
                selectedProperty: selectedProperty,
              )
            : null;
        final currentUsername = '${userInfo?.firstName} ${userInfo?.lastName}';
        final currentUserPhoneNo = StaticFunctions.userInfo?.mobileNo;
        final currentDate = DateFormat(AppConfig.pdfSharedByDateTimeFormat)
            .format(DateTime.now());
        var w400Font =
            pw.Font.ttf(await rootBundle.load(Strings.poppins400Fonts));
        var italicFont =
            pw.Font.ttf(await rootBundle.load(Strings.poppinsItalicFonts));
        var w600Font =
            pw.Font.ttf(await rootBundle.load(Strings.poppins600Fonts));
        String propertyTitleString =
            'Property | ${selectedProperty.propertyTypeValue} for ';
        selectedProperty.propertyForValues!.forEachIndexed((i, element) {
          propertyTitleString += element;
          if (i != selectedProperty.propertyForValues!.length - 1) {
            propertyTitleString += ', ';
          }
        });
        pdf.addPage(
          pw.MultiPage(
            build: (context) {
              return [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    if (textLogo != null)
                      pw.Text(
                        textLogo,
                        style: pw.TextStyle(
                          fontSize: pdfTextIconSize,
                          font: w600Font,
                          color: PdfColor.fromInt(
                            StaticFunctions.getColor(
                              buildContext,
                              ColorEnum.blueColor,
                            ).value,
                          ),
                        ),
                      ),
                    if (logoWidget != null) logoWidget,
                    pw.SizedBox(height: 10),
                    pw.Text(
                      propertyTitleString,
                      style: pw.TextStyle(
                        fontSize: pdfTitleSize,
                        font: w600Font,
                        color: PdfColor.fromInt(
                          StaticFunctions.getColor(
                            buildContext,
                            ColorEnum.blackColor,
                          ).value,
                        ),
                      ),
                    ),
                    pw.SizedBox(height: 10),
                    pw.Divider(
                      height: Dimensions.dividerHeight,
                      thickness: Dimensions.dividerHeight,
                      color: PdfColor.fromInt(
                        StaticFunctions.getColor(
                          buildContext,
                          ColorEnum.borderColorE0,
                        ).value,
                      ),
                    ),
                    if (basicDetailsSection != null)
                      _buildSectionWith(
                        buildContext,
                        titleFont: w600Font,
                        keyValueFont: w400Font,
                        map: basicDetailsSection,
                      ),
                    if (otherDetailsSection != null)
                      _buildSectionWith(
                        buildContext,
                        titleFont: w600Font,
                        keyValueFont: w400Font,
                        map: otherDetailsSection,
                      ),
                    if (imageWithCacheList.isNotEmpty)
                      pw.Container(
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.SizedBox(height: 10),
                            pw.Text(
                              localizationsContext.sharingOptionImagesSubtitle,
                              style: pw.TextStyle(
                                fontSize: sectionTitleSize,
                                font: w600Font,
                                color: PdfColor.fromInt(
                                  StaticFunctions.getColor(
                                    buildContext,
                                    ColorEnum.blackColor,
                                  ).value,
                                ),
                              ),
                            ),
                            pw.SizedBox(height: 8),
                            pw.GridView(
                              childAspectRatio: 0.5,
                              mainAxisSpacing: 7,
                              crossAxisSpacing: 7,
                              crossAxisCount: 3,
                              children: List.generate(
                                imageWithCacheList.length >=
                                        AppConfig.maxImagesAllowed
                                    ? 9
                                    : imageWithCacheList.length,
                                (index) => pw.Container(
                                  decoration: pw.BoxDecoration(
                                    color: PdfColor.fromInt(
                                      StaticFunctions.getColor(
                                        buildContext,
                                        ColorEnum.whiteColor,
                                      ).value,
                                    ),
                                    borderRadius: pw.BorderRadius.circular(2),
                                    border: pw.Border.all(
                                      color: PdfColor.fromInt(
                                        StaticFunctions.getColor(
                                          buildContext,
                                          ColorEnum.borderColorE0,
                                        ).value,
                                      ),
                                      width: 1,
                                    ),
                                  ),
                                  child: pw.ClipRRect(
                                    horizontalRadius: 2,
                                    verticalRadius: 2,
                                    child: pw.Image(
                                      pw.MemoryImage(
                                        imageWithCacheList[index]
                                            .readAsBytesSync(),
                                      ),
                                      fit: pw.BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    pw.SizedBox(height: 7),
                    pw.Text(
                      localizationsContext.pdfSharedByText(
                        currentUsername,
                        currentDate,
                        currentUserPhoneNo!,
                      ),
                      style: pw.TextStyle(
                        fontSize: pdfSharedByTextSize,
                        font: italicFont,
                        fontStyle: pw.FontStyle.italic,
                        fontItalic: italicFont,
                        color: PdfColor.fromInt(
                          StaticFunctions.getColor(
                            buildContext,
                            ColorEnum.pdfRowTitleTextColor,
                          ).value,
                        ),
                      ),
                    ),
                  ],
                ),
              ];
            },
          ),
        );

        final savedPdf =
            await watermarkedPdfFile.writeAsBytes(await pdf.save());
        if (cacheImageList.isNotEmpty) {
          await Future.forEach(
            cacheImageList,
            (element) async {
              await element.delete();
            },
          );
        }
        if (await savedPdf.exists()) {
          pdfFile = savedPdf;
        }
      } on Exception catch (e) {
        debugPrint("Error while generating pdf:: ${e}");
        pdfFile = null;
      }
    } else if (doesPdfExists) {
      pdfFile = watermarkedPdfFile;
    }
    return pdfFile;
  }

  static Future<File?> _generateInquiryPdf(
    BuildContext buildContext, {
    required DbSavedFilter selectedInquiry,
    required Map<String, dynamic> params,
  }) async {
    final inquiryPdfFile = File(
      await FileUtils.getInquiryPDFPath(
        inquiryId: selectedInquiry.id,
      ),
    );
    File? pdfFile;
    final doesPdfExists = await inquiryPdfFile.exists();
    if (!doesPdfExists) {
      final userInfo = await _isarService.getUserInfo();
      final isLogoEnabled = params[_shareOptionParamIsLogoEnabled];
      final isBasicDetailsEnabled = params[_shareOptionParamIsBasicDetails];
      final isOtherDetailsEnabled = params[_shareOptionParamIsOtherDetails];
      AppLocalizations localizationsContext =
          AppLocalizations.of(buildContext)!;
      final appLogo = await rootBundle.loadString(Strings.appLogo);
      final isText =
          userInfo?.watermarkType == SaveDefaultData.watermarkTypeTextId;
      String? textLogo =
          isLogoEnabled && isText ? userInfo?.watermarkText : null;
      pw.Widget? logoWidget;
      if (isLogoEnabled &&
          !isText &&
          userInfo != null &&
          userInfo.watermarkLogoPath != null &&
          File(userInfo.watermarkLogoPath!).existsSync()) {
        logoWidget = pw.Image(
          pw.MemoryImage(
            File(userInfo.watermarkLogoPath!).readAsBytesSync(),
          ),
          height: pdfIconHeight,
          width: pdfIconWidth,
        );
      } else if (textLogo == null || textLogo.trim().isEmpty) {
        logoWidget = pw.SvgImage(
          svg: appLogo,
          width: pdfIconWidth,
          height: pdfIconHeight,
        );
      }

      final pdf = pw.Document();
      final basicDetailsSection = isBasicDetailsEnabled
          ? await _buildBasicDetailsMapForPdf(
              localizationsContext: localizationsContext,
              selectedInquiry: selectedInquiry,
            )
          : null;
      final otherDetailsSection = isOtherDetailsEnabled
          ? await _buildOtherDetailsMapForPdf(
              localizationsContext: localizationsContext,
              selectedInquiry: selectedInquiry,
            )
          : null;
      final currentUsername =
          '${StaticFunctions.userInfo?.firstName} ${StaticFunctions.userInfo?.lastName}';
      final currentUserPhoneNo = StaticFunctions.userInfo?.mobileNo;
      final currentDate = DateFormat(AppConfig.pdfSharedByDateTimeFormat)
          .format(DateTime.now());
      var w400Font =
          pw.Font.ttf(await rootBundle.load(Strings.poppins400Fonts));
      var italicFont =
          pw.Font.ttf(await rootBundle.load(Strings.poppinsItalicFonts));
      var w600Font =
          pw.Font.ttf(await rootBundle.load(Strings.poppins600Fonts));
      String inquiryTitleString =
          'Inquiry | ${selectedInquiry.propertyTypeValues!.first} for ';
      final propertyForFromDb =
          await _isarService.getPropertyForByIds(selectedInquiry.propertyFor!);
      propertyForFromDb.forEachIndexed(
        (i, element) {
          final propertyForName =
              element.id == SaveDefaultData.propertyForSellId
                  ? localizationsContext.buy
                  : element.name;
          inquiryTitleString += propertyForName;
          if (i != propertyForFromDb.length - 1) {
            inquiryTitleString += ', ';
          }
        },
      );
      pdf.addPage(
        pw.MultiPage(
          build: (context) {
            return [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  if (textLogo != null)
                    pw.Text(
                      textLogo,
                      style: pw.TextStyle(
                        fontSize: pdfTextIconSize,
                        font: w600Font,
                        color: PdfColor.fromInt(
                          StaticFunctions.getColor(
                            buildContext,
                            ColorEnum.blueColor,
                          ).value,
                        ),
                      ),
                    ),
                  if (logoWidget != null) logoWidget,
                  pw.SizedBox(height: 10),
                  pw.Text(
                    inquiryTitleString,
                    style: pw.TextStyle(
                      fontSize: pdfTitleSize,
                      font: w600Font,
                      color: PdfColor.fromInt(
                        StaticFunctions.getColor(
                          buildContext,
                          ColorEnum.blackColor,
                        ).value,
                      ),
                    ),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Divider(
                    height: Dimensions.dividerHeight,
                    thickness: Dimensions.dividerHeight,
                    color: PdfColor.fromInt(
                      StaticFunctions.getColor(
                        buildContext,
                        ColorEnum.borderColorE0,
                      ).value,
                    ),
                  ),
                  if (basicDetailsSection != null)
                    _buildSectionWith(
                      buildContext,
                      titleFont: w600Font,
                      keyValueFont: w400Font,
                      map: basicDetailsSection,
                    ),
                  if (otherDetailsSection != null)
                    _buildSectionWith(
                      buildContext,
                      titleFont: w600Font,
                      keyValueFont: w400Font,
                      map: otherDetailsSection,
                    ),
                  pw.SizedBox(height: 7),
                  pw.Text(
                    localizationsContext.pdfSharedByText(
                      currentUsername,
                      currentDate,
                      currentUserPhoneNo!,
                    ),
                    style: pw.TextStyle(
                      fontSize: pdfSharedByTextSize,
                      font: italicFont,
                      fontStyle: pw.FontStyle.italic,
                      fontItalic: italicFont,
                      color: PdfColor.fromInt(
                        StaticFunctions.getColor(
                          buildContext,
                          ColorEnum.pdfRowTitleTextColor,
                        ).value,
                      ),
                    ),
                  ),
                ],
              ),
            ];
          },
        ),
      );

      final savedPdf = await inquiryPdfFile.writeAsBytes(await pdf.save());
      if (await savedPdf.exists()) {
        pdfFile = savedPdf;
      }
    } else if (doesPdfExists) {
      pdfFile = inquiryPdfFile;
    }
    return pdfFile;
  }

  static _showFailureSnackBar(
    BuildContext context,
    AppLocalizations localizationsContext,
  ) {
    SnackBarView.showSnackBar(
      context,
      localizationsContext.shareFailedMessage,
    );
  }

  static Future<void> _onPropertyShareOptionSelected(
    BuildContext context, {
    required int selected,
    required AppLocalizations localizationsContext,
    required Map<String, dynamic> params,
  }) async {
    final isWatermarkEnabled = params[_shareOptionParamIsWatermarkEnabled];
    final isBasicDetailsEnabled = params[_shareOptionParamIsBasicDetails];
    final isOtherDetailsEnabled = params[_shareOptionParamIsOtherDetails];
    final isPhotosEnabled = params[_shareOptionParamIsPhotosEnabled];
    final selectedProperty = params[_shareOptionParamProperty] as DbProperty;
    List<XFile>? filesToShare;
    String description = '';
    bool onlyImage = selected == _shareOptionImageId;
    bool onlyText = selected == _shareOptionTextId;
    bool shouldGeneratePdf = selected == _shareOptionPdfId;

    if ((!onlyImage && onlyText) || shouldGeneratePdf) {
      description = '';
      final basicDetails = isBasicDetailsEnabled
          ? await _buildBasicDetailsMapForPdf(
              localizationsContext: localizationsContext,
              selectedProperty: selectedProperty,
            )
          : null;
      final otherDetails = isOtherDetailsEnabled
          ? await _buildOtherDetailsMapForPdf(
              localizationsContext: localizationsContext,
              selectedProperty: selectedProperty,
            )
          : null;

      basicDetails?.entries.forEachIndexed(
        (i, element) {
          if (element.key == _sectionTitleKey) {
            description += '${element.value}\n\n';
          } else if (element.key == _singleWidgetInSingleRowSectionKey ||
              element.key == _multiWidgetInSingleRowSectionKey) {
            final sectionInfoList =
                element.value as LinkedHashMap<String, String>;
            sectionInfoList.entries.forEach(
              (element) {
                description += '${element.key}: ${element.value}\n';
              },
            );
          }
          if (i == basicDetails.entries.length - 1) {
            description += '\n';
          }
        },
      );
      otherDetails?.entries.forEachIndexed(
        (i, element) {
          if (element.key == _sectionTitleKey) {
            description += '${element.value}\n\n';
          } else if (element.key == _singleWidgetInSingleRowSectionKey ||
              element.key == _multiWidgetInSingleRowSectionKey) {
            final sectionInfoList =
                element.value as LinkedHashMap<String, String>;
            sectionInfoList.entries.forEach(
              (element) {
                description += '${element.key}: ${element.value}\n';
              },
            );
          }
          if (i == otherDetails.entries.length - 1) {
            description += '\n';
          }
        },
      );
    }

    if ((isPhotosEnabled && (!onlyText && onlyImage)) || shouldGeneratePdf) {
      filesToShare = [];
      final List<File> watermarkedImageList = [];
      final photosList = await _isarService.getPhotosOf(selectedProperty.id);
      if (photosList.isNotEmpty) {
        await Future.forEach(
          photosList,
          (element) async {
            final imageWithWatermark = await WatermarkUtils.applyWatermark(
              context,
              photo: element,
              forceWatermark: true,
            );
            if (imageWithWatermark != null) {
              watermarkedImageList.add(File(imageWithWatermark.path));
            }
          },
        );
      } else if (selectedProperty.photos != null &&
          selectedProperty.photos!.isNotEmpty) {
        await Future.forEach(
          selectedProperty.photos!,
          (element) async {
            final imageFile = File(element);
            if (await imageFile.exists()) {
              final photoMeta = DbPropertyPhotoMeta()
                ..userId = StaticFunctions.userId
                ..propertyId = selectedProperty.id
                ..imagePath = element;
              await _isarService.savePhotoMeta(photoMeta);
              final imageWithWatermark = await WatermarkUtils.applyWatermark(
                context,
                photo: photoMeta,
                forceWatermark: true,
              );
              if (imageWithWatermark != null) {
                watermarkedImageList.add(File(imageWithWatermark.path));
              }
            }
          },
        );
      }
      if (watermarkedImageList.isNotEmpty) {
        if (shouldGeneratePdf) {
          final pdfFile = await _generatePropertyPdf(
            context,
            imageList: watermarkedImageList,
            selectedProperty: selectedProperty,
            isWatermarked: isWatermarkEnabled,
            params: params,
          );
          if (pdfFile != null && await pdfFile.exists()) {
            filesToShare.add(XFile(pdfFile.path));
          } else {
            _showFailureSnackBar(context, localizationsContext);
          }
        } else if (onlyImage) {
          filesToShare.addAll(watermarkedImageList.map((e) => XFile(e.path)));
        }
      } else if (shouldGeneratePdf) {
        final pdfFile = await _generatePropertyPdf(
          context,
          selectedProperty: selectedProperty,
          isWatermarked: isWatermarkEnabled,
          params: params,
        );
        if (pdfFile != null && await pdfFile.exists()) {
          filesToShare.add(XFile(pdfFile.path));
        } else {
          _showFailureSnackBar(context, localizationsContext);
        }
      } else if (onlyImage) {
        _showFailureSnackBar(context, localizationsContext);
      }
    }

    String propertyTitleString =
        'Property | ${selectedProperty.propertyTypeValue} for ';
    selectedProperty.propertyForValues!.forEachIndexed(
      (i, element) {
        propertyTitleString += element;
        if (i != selectedProperty.propertyForValues!.length - 1) {
          propertyTitleString += ', ';
        }
      },
    );

    String textToShare = '';
    if (description.trim().isNotEmpty) {
      textToShare = '${propertyTitleString}\n\n';
      textToShare += description;
    }

    if (filesToShare != null && filesToShare.isNotEmpty) {
      Share.shareXFiles(
        filesToShare,
        text: Platform.isAndroid && onlyImage && filesToShare.length == 1
            ? textToShare
            : null,
        subject: propertyTitleString,
      );
    } else if (onlyText && textToShare.trim().isNotEmpty) {
      Share.share(
        textToShare,
        subject: propertyTitleString,
      );
    }
  }

  static Future<void> _onInquiryShareOptionSelected(
    BuildContext context, {
    required int selected,
    required AppLocalizations localizationsContext,
    required Map<String, dynamic> params,
  }) async {
    FullScreenProgress.showFullScreenProgress(context, true);
    final isWatermarkEnabled = params[_shareOptionParamIsWatermarkEnabled];
    final isBasicDetailsEnabled = params[_shareOptionParamIsBasicDetails];
    final isOtherDetailsEnabled = params[_shareOptionParamIsOtherDetails];
    final isPhotosEnabled = params[_shareOptionParamIsPhotosEnabled];
    final selectedInquiry = params[_shareOptionParamInquiry] as DbSavedFilter;
    List<XFile>? filesToShare;
    String description = '';
    bool onlyImage = selected == _shareOptionImageId;
    bool onlyText = selected == _shareOptionTextId;
    bool shouldGeneratePdf = selected == _shareOptionPdfId;

    if ((!onlyImage && onlyText) || shouldGeneratePdf) {
      description = '';
      final basicDetails = isBasicDetailsEnabled
          ? await _buildBasicDetailsMapForPdf(
              localizationsContext: localizationsContext,
              selectedInquiry: selectedInquiry,
            )
          : null;
      final otherDetails = isOtherDetailsEnabled
          ? await _buildOtherDetailsMapForPdf(
              localizationsContext: localizationsContext,
              selectedInquiry: selectedInquiry,
            )
          : null;

      basicDetails?.entries.forEachIndexed(
        (i, element) {
          if (element.key == _sectionTitleKey) {
            description += '${element.value}\n\n';
          } else if (element.key == _singleWidgetInSingleRowSectionKey ||
              element.key == _multiWidgetInSingleRowSectionKey) {
            final sectionInfoList =
                element.value as LinkedHashMap<String, String>;
            sectionInfoList.entries.forEach(
              (element) {
                description += '${element.key}: ${element.value}\n';
              },
            );
          }
          if (i == basicDetails.entries.length - 1) {
            description += '\n';
          }
        },
      );
      otherDetails?.entries.forEachIndexed(
        (i, element) {
          if (element.key == _sectionTitleKey) {
            description += '${element.value}\n\n';
          } else if (element.key == _singleWidgetInSingleRowSectionKey ||
              element.key == _multiWidgetInSingleRowSectionKey) {
            final sectionInfoList =
                element.value as LinkedHashMap<String, String>;
            sectionInfoList.entries.forEach(
              (element) {
                description += '${element.key}: ${element.value}\n';
              },
            );
          }
          if (i == otherDetails.entries.length - 1) {
            description += '\n';
          }
        },
      );
    }

    if (shouldGeneratePdf) {
      filesToShare = [];
      final pdfFile = await _generateInquiryPdf(
        context,
        selectedInquiry: selectedInquiry,
        params: params,
      );
      if (pdfFile != null && await pdfFile.exists()) {
        filesToShare.add(XFile(pdfFile.path));
      } else {
        _showFailureSnackBar(context, localizationsContext);
      }
    }

    String inquiryTitleString =
        'Inquiry | ${selectedInquiry.propertyTypeValues!.first} for ';
    final propertyForFromDb =
        await _isarService.getPropertyForByIds(selectedInquiry.propertyFor!);
    propertyForFromDb.forEachIndexed(
      (i, element) {
        final propertyForName = element.id == SaveDefaultData.propertyForSellId
            ? localizationsContext.buy
            : element.name;
        inquiryTitleString += propertyForName;
        if (i != propertyForFromDb.length - 1) {
          inquiryTitleString += ', ';
        }
      },
    );

    String textToShare = '';
    if (description.trim().isNotEmpty) {
      textToShare = '${inquiryTitleString}\n\n';
      textToShare += description;
    }

    FullScreenProgress.showFullScreenProgress(context, false);
    if (filesToShare != null && filesToShare.isNotEmpty) {
      await Share.shareXFiles(
        filesToShare,
        text: Platform.isAndroid && onlyImage && filesToShare.length == 1
            ? textToShare
            : null,
        subject: inquiryTitleString,
      );
    } else if (onlyText && textToShare.trim().isNotEmpty) {
      await Share.share(
        textToShare,
        subject: inquiryTitleString,
      );
    }
  }

  static String _handlePrices({
    required AppLocalizations localizationsContext,
    required String priceUnit,
    required double? minimumPrice,
    required double? maximumPrice,
    required bool isFirst,
    required String priceFor,
  }) {
    if (minimumPrice != null || maximumPrice != null) {
      String? minPrice;
      if (minimumPrice != null) {
        minPrice =
            '$priceUnit${(StaticFunctions.formatPrice(StaticFunctions.removeTrailingZeros(minimumPrice.toString())))}';
      }
      String? maxPrice;
      if (maximumPrice != null) {
        maxPrice =
            '$priceUnit${(StaticFunctions.formatPrice(StaticFunctions.removeTrailingZeros(maximumPrice.toString())))}';
      }
      if (minPrice != null || maxPrice != null) {
        String priceString = '';
        if (isFirst) {
          priceString += '${localizationsContext.budget}:\n';
        }
        priceString += '$priceFor: ';
        if (minPrice != null && maxPrice != null) {
          priceString += '$minPrice - $maxPrice';
        } else {
          priceString += minPrice != null ? minPrice : maxPrice!;
        }
        return priceString;
      }
    }
    return '';
  }
}
