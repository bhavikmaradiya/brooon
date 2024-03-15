import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/dimen_const.dart';
import '../utils/enums.dart';
import '../utils/static_functions.dart';

class IndicatorWidget extends StatelessWidget {
  final int length;
  final int selectedIndex;
  double? dotSize;
  double? betweenSpace;
  final ColorEnum activeColor;
  final ColorEnum dotColor;

  IndicatorWidget({
    Key? key,
    required this.length,
    required this.selectedIndex,
    this.dotSize,
    this.activeColor = ColorEnum.themeColor,
    this.dotColor = ColorEnum.grayColor,
  }) : super(key: key) {
    this.dotSize ??= Dimensions.indicatorDotSize.h;
    this.betweenSpace ??= Dimensions.indicatorDotBetweenSpace.w;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => Container(
          height: dotSize,
          width: dotSize,
          margin: EdgeInsets.symmetric(
            horizontal: (betweenSpace! / 2),
          ),
          decoration: BoxDecoration(
            color: StaticFunctions.getColor(
              context,
              index == selectedIndex ? activeColor : dotColor,
            ),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
