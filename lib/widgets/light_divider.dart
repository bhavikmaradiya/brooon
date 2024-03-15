import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/dimen_const.dart';
import '../utils/enums.dart';
import '../utils/static_functions.dart';

class LightDivider extends StatelessWidget {
  double? thickness;
  final ColorEnum color;

  LightDivider({
    Key? key,
    this.thickness,
    this.color = ColorEnum.dividerColor,
  }) : super(key: key) {
    thickness ??= Dimensions.dividerHeight.h;
  }

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: thickness,
      thickness: thickness,
      color: StaticFunctions.getColor(
        context,
        color,
      ),
    );
  }
}
