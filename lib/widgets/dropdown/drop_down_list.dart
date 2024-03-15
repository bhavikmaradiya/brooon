import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';

class DropDownList extends StatelessWidget {
  final List<int> ids;
  final List<String> values;
  final int selectedId;
  final bool showSelectedArrow;
  final Function(int selectedId, String selectedValue)?
      onDropDownSelectionChanged;

  const DropDownList({
    Key? key,
    required this.selectedId,
    required this.ids,
    required this.values,
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
        child: DropdownButton(
          onTap: () {
            FocusScope.of(context).requestFocus(
              FocusNode(),
            );
          },
          items: List.generate(
            ids.length,
            (index) => DropdownMenuItem(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
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
          borderRadius: BorderRadius.circular(
            Dimensions.dropDownRadius.r,
          ),
          dropdownColor: StaticFunctions.getColor(
            context,
            ColorEnum.dropDownBgColor,
          ),
          iconSize: 0,
          underline: const SizedBox(),
        ),
      );
    }
  }
}
