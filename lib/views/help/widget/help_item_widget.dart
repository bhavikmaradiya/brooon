import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/dimen_const.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';

class HelpItemWidget extends StatelessWidget {
  final String currentOption;
  final Function(String) onClick;

  HelpItemWidget({
    required this.currentOption,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.helpOptionsBetweenSpacing.h,
      ),
      decoration: BoxDecoration(
        color: StaticFunctions.getColor(
          context,
          ColorEnum.blueColorOpacity2Percentage,
        ),
        borderRadius: BorderRadius.circular(
          Dimensions.helpOptionsBorderRadius.r,
        ),
        border: Border.all(
          color: StaticFunctions.getColor(
            context,
            ColorEnum.borderColorE0,
          ),
          width: Dimensions.helpOptionsBorderWidth.w,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onClick(currentOption),
          borderRadius: BorderRadius.circular(
            Dimensions.helpOptionsBorderRadius.r,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: Dimensions.helpOptionsVerticalPadding.h,
              horizontal: Dimensions.helpOptionsHorizontalPadding.w,
            ),
            margin: EdgeInsets.zero,
            child: Text(
              currentOption,
              style: TextStyle(
                fontSize: Dimensions.helpOptionsFontSize.sp,
                fontWeight: FontWeight.w400,
                color: StaticFunctions.getColor(
                  context,
                  ColorEnum.blackColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
