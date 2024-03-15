import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../const/dimen_const.dart';
import '../const/string_const.dart';
import '../utils/enums.dart';
import '../utils/static_functions.dart';
import '../views/view_all_property/model/property_visual_type.dart';

class AnimatedToggleSwitchWidget extends StatefulWidget {
  final Function(PropertyVisualType)? onSwitchChanged;

  const AnimatedToggleSwitchWidget({
    Key? key,
    required this.onSwitchChanged,
  }) : super(key: key);

  @override
  State<AnimatedToggleSwitchWidget> createState() =>
      _AnimatedToggleSwitchWidgetState();
}

class _AnimatedToggleSwitchWidgetState
    extends State<AnimatedToggleSwitchWidget> {
  List<bool> _selections = List.generate(
    2,
    (index) => index == 0 ? true : false,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: StaticFunctions.getColor(
        context,
        ColorEnum.themeColorOpacity3Percentage,
      ),
      margin: EdgeInsets.only(
        right: Dimensions.screenHorizontalMargin.w,
      ),
      height: Dimensions.searchListSwitchHeight.h,
      child: ToggleButtons(
        children: [
          SvgPicture.asset(
            Strings.iconSearchList,
            color: _selections[0]
                ? StaticFunctions.getColor(
                    context,
                    ColorEnum.whiteColor,
                  )
                : StaticFunctions.getColor(
                    context,
                    ColorEnum.themeColor,
                  ),
          ),
          SvgPicture.asset(
            Strings.iconSearchMap,
            color: _selections[1]
                ? StaticFunctions.getColor(
                    context,
                    ColorEnum.whiteColor,
                  )
                : StaticFunctions.getColor(
                    context,
                    ColorEnum.themeColor,
                  ),
          ),
        ],
        isSelected: _selections,
        borderRadius: BorderRadius.circular(
          Dimensions.searchListSwitchBorderRadius.r,
        ),
        borderWidth: Dimensions.searchListSwitchBorderHeight.w,
        borderColor: StaticFunctions.getColor(
          context,
          ColorEnum.grayColor,
        ),
        selectedBorderColor: StaticFunctions.getColor(
          context,
          ColorEnum.blueColor,
        ),
        fillColor: StaticFunctions.getColor(
          context,
          ColorEnum.blueColor,
        ),
        onPressed: (index) {
          if (widget.onSwitchChanged != null) {
            widget.onSwitchChanged!(
              index == 1 ? PropertyVisualType.map : PropertyVisualType.list,
            );
          }
          setState(() {
            for (var i = 0; i < _selections.length; i++) {
              _selections[i] = false;
            }
            _selections[index] = true;
          });
        },
      ),
    );
  }
}
