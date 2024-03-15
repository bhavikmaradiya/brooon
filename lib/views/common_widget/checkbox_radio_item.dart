import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/dimen_const.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../widgets/checkbox_widget.dart';
import '../../widgets/radio_button.dart';

class CheckboxRadioItem extends StatelessWidget {
  final int id;
  final String name;
  final bool isSelected;
  final Function(int) onSelect;
  final bool isSingleSelection;
  final int selectedId;
  final bool makeWrapContent;
  final bool showRadioOrCheckboxForceFully;

  CheckboxRadioItem({
    required this.id,
    required this.name,
    required this.isSelected,
    required this.onSelect,
    this.isSingleSelection = false,
    this.showRadioOrCheckboxForceFully = false,
    this.makeWrapContent = false,
    this.selectedId = -1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          makeWrapContent ? Dimensions.addPropertyFieldsDefaultHeight.h : null,
      decoration: BoxDecoration(
        color: StaticFunctions.getColor(
          context,
          ColorEnum.themeColorOpacity3Percentage,
        ),
        borderRadius: BorderRadius.circular(
          Dimensions.checkBoxRadioBoxRadius.r,
        ),
        border: Border.all(
          width: Dimensions.checkBoxRadioBoxBorderWidth.w,
          color: StaticFunctions.getColor(
            context,
            isSelected ? ColorEnum.themeColor : ColorEnum.borderColorE0,
          ),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(
            Dimensions.checkBoxRadioBoxRadius.r,
          ),
          onTap: () => onSelect(id),
          child: Container(
            padding: EdgeInsets.only(
              left: Dimensions.checkBoxRadioBoxInnerHorizontalSpacing.w,
              right: makeWrapContent
                  ? Dimensions.checkBoxRadioBoxInnerHorizontalSpacing.w
                  : 0,
              // top: Dimensions.checkBoxRadioBoxInnerVerticalSpacing.h,
              // bottom: Dimensions.checkBoxRadioBoxInnerVerticalSpacing.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if ((showRadioOrCheckboxForceFully ||
                        AppConfig.showRadioOrCheckbox) &&
                    !isSingleSelection)
                  IgnorePointer(
                    child: CustomCheckbox(
                      checkBoxSize: Dimensions.checkBoxRadioBoxCheckboxSize.h,
                      value: isSelected,
                      onChanged: (bool value) {},
                      borderRadius:
                          Dimensions.checkBoxRadioBoxCheckboxBorderRadius.r,
                      innerPadding:
                          Dimensions.checkBoxRadioBoxCheckboxInnerPadding.h,
                      checkedFillColor: StaticFunctions.getColor(
                        context,
                        ColorEnum.themeColor,
                      ),
                      borderWidth:
                          Dimensions.checkBoxRadioBoxCheckboxBorderWidth.w,
                      borderColor: StaticFunctions.getColor(
                        context,
                        ColorEnum.borderColorE0,
                      ),
                    ),
                  ),
                if ((showRadioOrCheckboxForceFully ||
                        AppConfig.showRadioOrCheckbox) &&
                    isSingleSelection)
                  IgnorePointer(
                    child: CustomRadio(
                      value: id,
                      groupValue: selectedId,
                      selectedColor: StaticFunctions.getColor(
                        context,
                        ColorEnum.themeColor,
                      ),
                      borderColor: StaticFunctions.getColor(
                        context,
                        isSelected
                            ? ColorEnum.themeColor
                            : ColorEnum.borderColorE0,
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                if (showRadioOrCheckboxForceFully ||
                    AppConfig.showRadioOrCheckbox)
                  SizedBox(
                    width: Dimensions
                        .checkBoxRadioBoxTextAndCheckboxBetweenSpacing.w,
                  ),
                if (makeWrapContent)
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: Dimensions.checkBoxRadioBoxTextSize.sp,
                      overflow: TextOverflow.ellipsis,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.blackColor,
                      ),
                    ),
                  ),
                if (!makeWrapContent)
                  Expanded(
                    child: Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: Dimensions.checkBoxRadioBoxTextSize.sp,
                        overflow: TextOverflow.ellipsis,
                        color: StaticFunctions.getColor(
                          context,
                          ColorEnum.blackColor,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
