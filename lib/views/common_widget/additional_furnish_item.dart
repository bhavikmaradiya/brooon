import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/dimen_const.dart';
import '../../localdb/properties/db_additional_furnish.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../widgets/checkbox_widget.dart';

class AdditionalFurnishItem extends StatelessWidget {
  final DbAdditionalFurnish furnishModel;
  final Function(DbAdditionalFurnish) onSelect;

  AdditionalFurnishItem({
    required this.furnishModel,
    required this.onSelect,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelect(furnishModel),
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
                checkBoxSize: Dimensions.additionalFurnishBoxCheckboxSize.h,
                value: furnishModel.isSelected,
                onChanged: (bool value) {},
                borderRadius:
                    Dimensions.additionalFurnishBoxCheckboxBorderRadius.r,
                innerPadding:
                    Dimensions.additionalFurnishBoxCheckboxInnerPadding.h,
                checkedFillColor: StaticFunctions.getColor(
                  context,
                  ColorEnum.themeColor,
                ),
                borderWidth:
                    Dimensions.additionalFurnishBoxCheckboxBorderWidth.w,
                borderColor: StaticFunctions.getColor(
                  context,
                  ColorEnum.borderColorE0,
                ),
              ),
            ),
          ),
          SizedBox(
            width:
                Dimensions.additionalFurnishBoxTextAndCheckboxBetweenSpacing.w,
          ),
          Expanded(
            child: Text(
              furnishModel.name,
              maxLines: 2,
              style: TextStyle(
                color: StaticFunctions.getColor(
                  context,
                  ColorEnum.blackColor,
                ),
                fontWeight: FontWeight.w400,
                fontSize: Dimensions.additionalFurnishTextSize.sp,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}
