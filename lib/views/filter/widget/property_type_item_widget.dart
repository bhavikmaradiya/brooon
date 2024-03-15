import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../const/dimen_const.dart';
import '../../../localdb/properties/db_property_type.dart';
import '../../../utils/app_config.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';
import '../../../widgets/checkbox_widget.dart';
import '../../../widgets/radio_button.dart';

class PropertyTypeItem extends StatelessWidget {
  final DbPropertyType propertyType;
  final Color? touchSplashColor;
  final Function(DbPropertyType) onSelect;
  final bool isSingleSelection;
  final int selectedId;

  PropertyTypeItem({
    required this.propertyType,
    required this.onSelect,
    this.touchSplashColor = null,
    this.isSingleSelection = false,
    this.selectedId = -1,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        double totalWidthOfBox = constraint.constrainWidth();
        double totalHeightOfBox = constraint.constrainHeight();
        double iconSize = (totalHeightOfBox * 0.32).h;
        double spacingInBetweenTextIcon = (totalHeightOfBox * 0.1).h;
        double textHorizontalSpacing = (totalWidthOfBox * 0.03).w;
        double fontSize = (totalHeightOfBox * 0.15).sp;
        double boxRadius = Dimensions.borderRadius.r;
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.themeColorOpacity3Percentage,
                  ),
                  borderRadius: BorderRadius.circular(boxRadius),
                  border: Border.all(
                    width: Dimensions.propertyTypeBoxBorderWidth.w,
                    color: StaticFunctions.getColor(
                      context,
                      propertyType.isSelected
                          ? ColorEnum.themeColor
                          : ColorEnum.borderColorE0,
                    ),
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: touchSplashColor ??
                        StaticFunctions.getColor(
                          context,
                          ColorEnum.touchSplashColor,
                        ),
                    borderRadius: BorderRadius.circular(boxRadius),
                    onTap: () => onSelect(propertyType),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            propertyType.assetPath,
                            color: StaticFunctions.getColor(
                              context,
                              propertyType.isSelected
                                  ? ColorEnum.themeColor
                                  : ColorEnum.blackColor,
                            ),
                            width: iconSize,
                            height: iconSize,
                          ),
                          SizedBox(
                            height: spacingInBetweenTextIcon,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: textHorizontalSpacing,
                            ),
                            child: Text(
                              propertyType.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: fontSize,
                                color: StaticFunctions.getColor(
                                  context,
                                  propertyType.isSelected
                                      ? ColorEnum.themeColor
                                      : ColorEnum.blackColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (AppConfig.showRadioOrCheckbox && !isSingleSelection)
              Positioned(
                top: Dimensions.propertyTypeBoxCheckboxAroundMargin.h,
                left: Dimensions.propertyTypeBoxCheckboxAroundMargin.h,
                child: IgnorePointer(
                  child: CustomCheckbox(
                    checkBoxSize: Dimensions.propertyTypeBoxCheckboxSize.h,
                    value: propertyType.isSelected,
                    onChanged: (bool value) {},
                    borderRadius:
                        Dimensions.propertyTypeBoxCheckboxBorderRadius.r,
                    innerPadding:
                        Dimensions.propertyTypeBoxCheckboxInnerPadding.h,
                    checkedFillColor: StaticFunctions.getColor(
                      context,
                      ColorEnum.themeColor,
                    ),
                    borderWidth:
                        Dimensions.propertyTypeBoxCheckboxBorderWidth.w,
                    borderColor: StaticFunctions.getColor(
                      context,
                      ColorEnum.borderColorE0,
                    ),
                  ),
                ),
              ),
            if (AppConfig.showRadioOrCheckbox && isSingleSelection)
              Positioned(
                top: Dimensions.propertyTypeBoxCheckboxAroundMargin.h,
                left: Dimensions.propertyTypeBoxCheckboxAroundMargin.h,
                child: IgnorePointer(
                  child: CustomRadio(
                    value: propertyType.id,
                    groupValue: selectedId,
                    selectedColor: StaticFunctions.getColor(
                      context,
                      ColorEnum.themeColor,
                    ),
                    borderColor: StaticFunctions.getColor(
                      context,
                      propertyType.isSelected
                          ? ColorEnum.themeColor
                          : ColorEnum.borderColorE0,
                    ),
                    onChanged: (value) {},
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
