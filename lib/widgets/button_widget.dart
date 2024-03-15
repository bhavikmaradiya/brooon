import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../const/dimen_const.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final bool textAllCaps;
  final Function()? onClick;
  final Color textColor;
  final FontWeight fontWeight;
  Color bgColor;
  Color? borderColor;
  Color? rippleColor;
  double? borderRadius;
  double? borderWidth;
  double? textSize;
  double? buttonHeight;
  String? icon;
  double? iconWidth;
  double? iconHeight;
  Color? iconColor;
  double? horizontalPadding;
  double? verticalPadding;

  ButtonWidget({
    super.key,
    required this.text,
    this.onClick,
    required this.textColor,
    required this.bgColor,
    this.fontWeight = FontWeight.w700,
    this.textAllCaps = false,
    this.textSize,
    this.borderColor,
    this.rippleColor,
    this.borderRadius,
    this.borderWidth,
    this.buttonHeight,
    this.icon,
    this.iconWidth,
    this.iconHeight,
    this.iconColor,
    this.horizontalPadding,
    this.verticalPadding,
  }) {
    textSize ??= Dimensions.buttonTextSize.sp;
    borderRadius ??= Dimensions.buttonBorderRadius.r;
    borderWidth ??= Dimensions.buttonBorderWidth.w;
    buttonHeight ??= Dimensions.buttonHeight.h;
    if (icon != null) {
      iconWidth ??= Dimensions.buttonIconSize.w;
      iconHeight ??= Dimensions.buttonIconSize.h;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(borderRadius!),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: borderWidth!,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius!),
          splashColor: rippleColor ??
              StaticFunctions.getColor(
                context,
                ColorEnum.touchSplashColor,
              ),
          onTap: onClick,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: verticalPadding ?? 0,
              horizontal: horizontalPadding ?? 0,
            ),
            height: buttonHeight,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (icon != null)
                    SvgPicture.asset(
                      icon!,
                      width: iconWidth,
                      height: iconHeight,
                      color: iconColor,
                    ),
                  if (icon != null)
                    SizedBox(
                      width: Dimensions.buttonSpaceBetweenIconText.w,
                    ),
                  Text(
                    textAllCaps ? text.toUpperCase() : text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: fontWeight,
                      fontSize: textSize,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
