import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import './public_property_confirmation_option.dart';
import './public_property_option.dart';
import './public_property_options_provider.dart';
import '../../../const/dimen_const.dart';
import '../../../const/string_const.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/light_divider.dart';

class PublicPropertyConfirmation {
  static Future<bool> showConfirmationPicker(
    BuildContext buildContext,
    AppLocalizations localizationsContext,
  ) async {
    bool isMarkAsPublicClicked = false;
    return showModalBottomSheet(
      context: buildContext,
      isScrollControlled: true,
      builder: (dialogContext) {
        return SafeArea(
          child: ChangeNotifierProvider(
            create: (_) => PublicPropertyOptionsProvider(),
            builder: (builderContext, _) {
              final provider = Provider.of<PublicPropertyOptionsProvider>(
                builderContext,
                listen: false,
              );
              WidgetsBinding.instance.addPostFrameCallback(
                (timeStamp) {
                  provider.init(builderContext);
                },
              );
              return Padding(
                padding: MediaQuery.of(buildContext).viewInsets,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ColoredBox(
                      color: StaticFunctions.getColor(
                        buildContext,
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
                              localizationsContext
                                  .sharePublicPropertyDialogTitle,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    Dimensions.bottomSheetTitleTextSize.sp,
                                color: StaticFunctions.getColor(
                                  buildContext,
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
                                    Navigator.pop(buildContext);
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
                              localizationsContext
                                  .sharePublicPropertyDialogSubTitle,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    Dimensions.optionBottomSheetSubtitleTextSize.sp,
                                color: StaticFunctions.getColor(
                                  buildContext,
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
                            child: Selector<PublicPropertyOptionsProvider,
                                List<PublicPropertyOption>>(
                              selector: (_, state) => state.sharingOptions,
                              shouldRebuild: (prev, next) => true,
                              builder: (context, list, child) {
                                return ListView.builder(
                                  itemCount: list.length,
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final currentOption = list[index];
                                    return PublicPropertyConfirmationOption(
                                      option: currentOption,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height:
                                Dimensions.optionBottomSheetBottomButtonMarginTop.h,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: Dimensions.screenHorizontalMargin.w,
                            ),
                            child: ButtonWidget(
                              text: localizationsContext.markAsPublic,
                              onClick: () {
                                isMarkAsPublicClicked = true;
                                Navigator.pop(builderContext, false);
                              },
                              borderColor: StaticFunctions.getColor(
                                builderContext,
                                ColorEnum.themeColor,
                              ),
                              borderWidth:
                                  Dimensions.optionBottomSheetButtonBorderSize.w,
                              textColor: StaticFunctions.getColor(
                                builderContext,
                                ColorEnum.whiteColor,
                              ),
                              bgColor: StaticFunctions.getColor(
                                builderContext,
                                ColorEnum.themeColor,
                              ),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
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
    ).then(
      (value) {
        return isMarkAsPublicClicked;
      },
    );
  }
}
