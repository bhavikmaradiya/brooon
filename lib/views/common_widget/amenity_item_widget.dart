import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/dimen_const.dart';
import '../../localdb/properties/db_property_amenity.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../widgets/checkbox_widget.dart';

class AmenityItem extends StatelessWidget {
  final DbPropertyAmenity propertyAmenityModel;
  final Function(DbPropertyAmenity) onSelect;

  AmenityItem({
    required this.propertyAmenityModel,
    required this.onSelect,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelect(propertyAmenityModel),
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
                checkBoxSize: Dimensions.amenitiesBoxCheckboxSize.h,
                value: propertyAmenityModel.isSelected,
                onChanged: (bool value) {},
                borderRadius: Dimensions.amenitiesBoxCheckboxBorderRadius.r,
                innerPadding: Dimensions.amenitiesBoxCheckboxInnerPadding.h,
                checkedFillColor: StaticFunctions.getColor(
                  context,
                  ColorEnum.themeColor,
                ),
                borderWidth: Dimensions.amenitiesBoxCheckboxBorderWidth.w,
                borderColor: StaticFunctions.getColor(
                  context,
                  ColorEnum.borderColorE0,
                ),
              ),
            ),
          ),
          SizedBox(
            width: Dimensions.amenitiesBoxTextAndCheckboxBetweenSpacing.w,
          ),
          Expanded(
            child: Text(
              propertyAmenityModel.name,
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
