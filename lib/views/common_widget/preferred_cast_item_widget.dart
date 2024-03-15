import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/dimen_const.dart';
import '../../localdb/properties/db_property_preferred_cast.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../widgets/checkbox_widget.dart';

class PreferredCastItem extends StatelessWidget {
  final DbPropertyPreferredCast caste;
  final Function(DbPropertyPreferredCast) onSelect;

  PreferredCastItem({
    required this.caste,
    required this.onSelect,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelect(caste),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IgnorePointer(
            child: Padding(
              padding: EdgeInsets.only(
                top: Dimensions.gridCheckBoxTopPadding.h,
              ),
              child: CustomCheckbox(
                checkBoxSize: Dimensions.preferredCastBoxCheckboxSize.h,
                value: caste.isSelected,
                onChanged: (bool value) {},
                borderRadius: Dimensions.preferredCastBoxCheckboxBorderRadius.r,
                innerPadding: Dimensions.preferredCastBoxCheckboxInnerPadding.h,
                checkedFillColor: StaticFunctions.getColor(
                  context,
                  ColorEnum.themeColor,
                ),
                borderWidth: Dimensions.preferredCastBoxCheckboxBorderWidth.w,
                borderColor: StaticFunctions.getColor(
                  context,
                  ColorEnum.borderColorE0,
                ),
              ),
            ),
          ),
          SizedBox(
            width: Dimensions.preferredCastBoxTextAndCheckboxBetweenSpacing.w,
          ),
          Expanded(
            child: Text(
              caste.name,
              maxLines: 2,
              style: TextStyle(
                color: StaticFunctions.getColor(
                  context,
                  ColorEnum.blackColor,
                ),
                fontWeight: FontWeight.w400,
                fontSize: Dimensions.amenitiesTextSize.sp,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}
