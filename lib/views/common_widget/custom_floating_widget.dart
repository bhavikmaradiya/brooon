import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';

class CustomFloatingWidget extends StatelessWidget {
  final Function onClick;

  const CustomFloatingWidget({
    Key? key,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(
            Dimensions.fabIconRadius.r,
          ),
          onTap: () {
            onClick();
          },
          child: Container(
            height: Dimensions.fabIconSize.h,
            width: Dimensions.fabIconSize.h,
            padding: EdgeInsets.all(
              Dimensions.fabIconInnerPadding.h,
            ),
            child: SvgPicture.asset(
              Strings.iconHomeFab,
              color: StaticFunctions.getColor(
                context,
                ColorEnum.whiteColor,
              ),
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: StaticFunctions.getColor(
          context,
          ColorEnum.themeColor,
        ),
        borderRadius: BorderRadius.circular(
          Dimensions.fabIconRadius.r,
        ),
      ),
    );
  }
}
