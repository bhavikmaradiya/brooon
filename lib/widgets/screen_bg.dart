import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../const/dimen_const.dart';
import '../const/string_const.dart';
import '../utils/enums.dart';
import '../utils/static_functions.dart';

class ScreenBg extends StatelessWidget {
  final ColorEnum? bgOpacityColorEnum;
  final double? bottomMargin;

  const ScreenBg({super.key, this.bgOpacityColorEnum, this.bottomMargin});

  @override
  Widget build(BuildContext context) {
    var bgOpacityColor = bgOpacityColorEnum != null
        ? StaticFunctions.getColor(context, bgOpacityColorEnum!)
        : StaticFunctions.getColor(context, ColorEnum.darkBgOpacityColor);
    return IgnorePointer(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: Dimensions.screenLeftCloudMarginTop.h),
            child: SvgPicture.asset(
              Strings.screenBgLeftCloud,
              width: Dimensions.screenLeftCloudWidth.w,
              height: Dimensions.screenLeftCloudHeight.h,
              color: bgOpacityColor,
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            margin:
                EdgeInsets.only(top: Dimensions.screenRightCloudMarginTop.h),
            child: SvgPicture.asset(
              Strings.screenBgRightCloud,
              width: Dimensions.screenRightCloudWidth.w,
              height: Dimensions.screenRightCloudHeight.h,
              color: bgOpacityColor,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                bottom:
                    bottomMargin ?? Dimensions.screenBgBuildingMarginBottom.h,
              ),
              width: MediaQuery.of(context).size.width,
              height: Dimensions.screenBgBuildingHeight.h,
              child: Image(
                image: AssetImage(Strings.screenBgBuilding),
                color: bgOpacityColor,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
