import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../const/dimen_const.dart';
import '../../../const/string_const.dart';
import '../../../localdb/settings/db_settings.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';

class SettingsMenuItemWidget extends StatelessWidget {
  final DbSetting currentSetting;
  final Function()? onTap;

  const SettingsMenuItemWidget({
    required this.currentSetting,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(
              Dimensions.settingListItemBorderRadius.r,
            ),
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: Dimensions.settingListItemVerticalPadding.h,
                horizontal: Dimensions.settingListItemHorizontalPadding.w,
              ),
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: StaticFunctions.getColor(
                  context,
                  ColorEnum.blueColorOpacity2Percentage,
                ),
                borderRadius: BorderRadius.circular(
                  Dimensions.settingListItemBorderRadius.r,
                ),
                border: Border.all(
                  width: Dimensions.settingListItemBorderWidth.w,
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.borderColorE0,
                  ),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    currentSetting.settingTitle,
                    style: TextStyle(
                      fontSize: Dimensions.settingListItemFontSize.sp,
                      fontWeight: FontWeight.w500,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.blackColor,
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    Strings.iconRightArrow,
                    height: Dimensions.settingListItemArrowSize.h,
                    width: Dimensions.settingListItemArrowSize.w,
                    color: StaticFunctions.getColor(
                      context,
                      ColorEnum.gray90Color,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
