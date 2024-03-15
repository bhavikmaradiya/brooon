import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/dimen_const.dart';
import '../../../localdb/settings/db_settings.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';
import '../../../widgets/switch.dart';

class SettingsItemWidget extends StatelessWidget {
  final DbSetting currentSetting;
  final Function(int, bool)? onValueChange;

  const SettingsItemWidget({required this.currentSetting, this.onValueChange});

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
            onTap: onValueChange != null
                ? () => onValueChange!(
                      currentSetting.settingId!,
                      !currentSetting.isChecked,
                    )
                : null,
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
                  CustomSwitch(
                    width: Dimensions.settingListItemSwitchWidth.w,
                    height: Dimensions.settingListItemSwitchHeight.h,
                    borderRadius: Dimensions.settingListItemSwitchRadius.r,
                    inactiveColor: StaticFunctions.getColor(
                      context,
                      ColorEnum.grayColor,
                    ),
                    activeColor: StaticFunctions.getColor(
                      context,
                      ColorEnum.blueColor,
                    ),
                    toggleSize: Dimensions.settingListItemSwitchThumbRadius.r,
                    value: currentSetting.isChecked,
                    onToggle: (value) {
                      if (onValueChange != null)
                        onValueChange!(
                          currentSetting.settingId!,
                          value,
                        );
                    },
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
