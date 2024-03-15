import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/dimen_const.dart';
import '../../../localdb/settings/db_settings.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';
import '../../../widgets/switch.dart';

class SettingsInnerOptionWidget extends StatelessWidget {
  final DbSetting currentSetting;
  final bool isItLast;
  final Function(int, bool)? onValueChange;

  const SettingsInnerOptionWidget({
    required this.currentSetting,
    required this.isItLast,
    this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: onValueChange != null
                ? () => onValueChange!(
                      currentSetting.settingId!,
                      !currentSetting.isChecked,
                    )
                : null,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: Dimensions.settingListItemOptionVerticalPadding.h,
              ),
              margin: EdgeInsets.zero,
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
                        onValueChange!(currentSetting.settingId!, value);
                    },
                  ),
                ],
              ),
            ),
          ),
          if (!isItLast)
            Divider(
              color: StaticFunctions.getColor(
                context,
                ColorEnum.transparentBlackColor,
              ),
              height: Dimensions.settingListItemDividerHeight.h,
            ),
        ],
      ),
    );
  }
}
