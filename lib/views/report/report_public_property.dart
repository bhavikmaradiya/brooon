import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import './report_option_item.dart';
import './report_options.dart';
import './report_public_property_provider.dart';
import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../localdb/properties/db_property.dart';
import '../../localdb/properties/db_saved_filter.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/light_divider.dart';

class ReportPublicProperty {
  static showReportPicker({
    required BuildContext buildContext,
    required AppLocalizations localizationsContext,
    DbProperty? selectedProperty,
    DbSavedFilter? selectedInquiry,
  }) async {
    showModalBottomSheet(
      context: buildContext,
      isScrollControlled: true,
      builder: (dialogContext) {
        return SafeArea(
          child: ChangeNotifierProvider(
            create: (_) => ReportPublicPropertyProvider(),
            builder: (builderContext, _) {
              final reportProvider = Provider.of<ReportPublicPropertyProvider>(
                builderContext,
                listen: false,
              );
              WidgetsBinding.instance.addPostFrameCallback(
                (timeStamp) {
                  reportProvider.init(
                    localizations: localizationsContext,
                    selectedProperty: selectedProperty,
                    selectedInquiry: selectedInquiry,
                  );
                },
              );
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
                          bottom: Dimensions.bottomSheetTitleVerticalPadding.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              localizationsContext.reportPublicProperty,
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
                              horizontal: Dimensions.screenHorizontalMargin.w,
                            ),
                            child: Text(
                              localizationsContext.reportPublicPropertySubTitle,
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
                                .optionBottomSheetSharingOptionVerticalMargin.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.screenHorizontalMargin.w,
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
                            child: Selector<ReportPublicPropertyProvider,
                                List<ReportOptions>>(
                              selector: (_, state) => state.reportOptions,
                              shouldRebuild: (prev, next) => true,
                              builder: (context, list, child) {
                                return ListView.builder(
                                  itemCount: list.length,
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final currentOption = list[index];
                                    return ReportOptionItem(
                                      option: currentOption,
                                      onClicked: () async {
                                        reportProvider.updatePropertySelection(
                                          list[index].id,
                                        );
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
                          Selector<ReportPublicPropertyProvider,
                              List<ReportOptions>>(
                            selector: (_, state) => state.reportOptions,
                            shouldRebuild: (prev, next) => true,
                            builder: (context, list, child) {
                              final isAnySelected = list.any(
                                (element) => element.isSelected,
                              );
                              return Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal:
                                      Dimensions.screenHorizontalMargin.w,
                                ),
                                child: ButtonWidget(
                                  text:
                                      localizationsContext.reportPublicProperty,
                                  onClick: isAnySelected
                                      ? () async {
                                          await reportProvider
                                              .callApiToReportProperty(
                                            buildContext,
                                          );
                                          Navigator.pop(builderContext, false);
                                        }
                                      : null,
                                  borderColor: StaticFunctions.getColor(
                                    builderContext,
                                    isAnySelected
                                        ? ColorEnum.themeColor
                                        : ColorEnum.borderColorE0,
                                  ),
                                  borderWidth: Dimensions
                                      .optionBottomSheetButtonBorderSize.w,
                                  textColor: StaticFunctions.getColor(
                                    builderContext,
                                    isAnySelected
                                        ? ColorEnum.whiteColor
                                        : ColorEnum.themeColor,
                                  ),
                                  bgColor: StaticFunctions.getColor(
                                    builderContext,
                                    isAnySelected
                                        ? ColorEnum.themeColor
                                        : ColorEnum
                                            .themeColorOpacity3Percentage,
                                  ),
                                  fontWeight: FontWeight.w700,
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
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
}
