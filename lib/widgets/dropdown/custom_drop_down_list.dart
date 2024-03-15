import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';

class CustomDropDownList extends StatelessWidget {
  final List<int> ids;
  final List<String> values;
  final int selectedId;
  final bool showSelectedArrow;
  final double widthOfDropdown;
  final Function(int selectedId, String selectedValue)?
      onDropDownSelectionChanged;

  const CustomDropDownList({
    Key? key,
    required this.selectedId,
    required this.ids,
    required this.values,
    required this.widthOfDropdown,
    this.showSelectedArrow = true,
    this.onDropDownSelectionChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ids.isEmpty) {
      return const SizedBox();
    } else {
      return ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton2(
          items: List.generate(
            ids.length,
            (index) => DropdownMenuItem(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      values[index],
                      style: TextStyle(
                        fontWeight: selectedId == ids[index]
                            ? FontWeight.w600
                            : FontWeight.w400,
                        fontSize: Dimensions.dropDownItemTextSize.sp,
                        color: StaticFunctions.getColor(
                          context,
                          selectedId == ids[index]
                              ? ColorEnum.themeColor
                              : ColorEnum.blackColor,
                        ),
                      ),
                    ),
                    if (showSelectedArrow && selectedId == ids[index])
                      SvgPicture.asset(
                        Strings.iconSelected,
                        width: Dimensions.dropDownSelectedIconSize.h,
                        height: Dimensions.dropDownSelectedIconSize.h,
                      ),
                  ],
                ),
              ),
              value: ids[index],
            ),
          ),
          dropdownStyleData: DropdownStyleData(
            width: widthOfDropdown,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Dimensions.dropDownRadius.r,
              ),
              color: StaticFunctions.getColor(
                context,
                ColorEnum.dropDownBgColor,
              ),
            ),
          ),
          onChanged: (elementId) {
            if (onDropDownSelectionChanged != null && elementId != null) {
              final index = ids.indexWhere((element) => element == elementId);
              final data = values[index];
              onDropDownSelectionChanged!(
                elementId,
                data,
              );
            }
          },
          isExpanded: true,
          iconStyleData: IconStyleData(
            iconSize: 0,
          ),
          underline: const SizedBox(),
        ),
      );
    }
  }
}
