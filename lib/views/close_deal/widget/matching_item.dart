import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../const/dimen_const.dart';
import '../../../utils/app_config.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';
import '../../../widgets/radio_button.dart';

class MatchingItem extends StatelessWidget {
  final int id;
  final String text;
  final bool isSelected;
  final Function onSelect;
  final int selectedId;
  final Function onDetailTextClicked;
  final AppLocalizations? localizationsContext;

  MatchingItem({
    required this.localizationsContext,
    required this.id,
    required this.text,
    required this.isSelected,
    required this.onSelect,
    required this.onDetailTextClicked,
    this.selectedId = -1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.addPropertyFieldsDefaultHeight.h,
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
          onTap: () => onSelect(),
          child: Container(
            padding: EdgeInsets.only(
              right: Dimensions.checkBoxRadioBoxInnerHorizontalSpacing.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (AppConfig.showRadioOrCheckbox)
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
                SizedBox(
                  width: Dimensions
                      .checkBoxRadioBoxTextAndCheckboxBetweenSpacing.w,
                ),
                Expanded(
                  child: Text(
                    text,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
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
                GestureDetector(
                  onTap: () {
                    onDetailTextClicked();
                  },
                  child: Text(
                    localizationsContext!.details,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: Dimensions.checkBoxRadioBoxTextSize.sp,
                      overflow: TextOverflow.ellipsis,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.blueColor,
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
