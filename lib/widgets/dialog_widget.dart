import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../const/dimen_const.dart';
import '../../utils/static_functions.dart';
import '../utils/enums.dart';
import './button_widget.dart';

class DialogWidget extends StatelessWidget {
  final String? icon;
  final double? iconSize;
  final String title;
  final String? positiveButton;
  final String? negativeButton;
  final Function()? onPositiveButtonClick;
  final Function()? onNegativeButtonClick;
  final Widget? titleWidget;
  final bool isDialogCancellable;

  const DialogWidget({
    super.key,
    this.icon,
    required this.title,
    this.iconSize,
    this.positiveButton,
    this.negativeButton,
    this.onPositiveButtonClick,
    this.onNegativeButtonClick,
    this.titleWidget,
    this.isDialogCancellable = true,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(isDialogCancellable),
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(
          horizontal: Dimensions.screenHorizontalMargin.w,
        ),
        backgroundColor: StaticFunctions.getColor(
          context,
          ColorEnum.whiteColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Dimensions.dialogRadius.r,
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: Dimensions.dialogVerticalMargin.h,
            horizontal: Dimensions.dialogHorizontalMargin.w,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (icon != null && icon!.trim().isNotEmpty)
                SvgPicture.asset(
                  icon!,
                  width:
                      iconSize == null ? Dimensions.dialogIconSize.h : iconSize,
                  height:
                      iconSize == null ? Dimensions.dialogIconSize.h : iconSize,
                ),
              SizedBox(
                height: Dimensions.dialogIconTitleBetweenSpace.h,
              ),
              titleWidget == null
                  ? Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: StaticFunctions.getColor(
                          context,
                          ColorEnum.blackColor,
                        ),
                        fontSize: Dimensions.dialogTextSize.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : titleWidget!,
              SizedBox(
                height: Dimensions.dialogTitleButtonBetweenSpace.h,
              ),
              Row(
                children: [
                  if (negativeButton != null &&
                      negativeButton!.trim().isNotEmpty)
                    Expanded(
                      child: ButtonWidget(
                        text: negativeButton!,
                        onClick: onNegativeButtonClick != null
                            ? onNegativeButtonClick!
                            : () {},
                        textSize: Dimensions.dialogButtonsTextSize.sp,
                        textColor: StaticFunctions.getColor(
                          context,
                          ColorEnum.themeColor,
                        ),
                        bgColor: StaticFunctions.getColor(
                          context,
                          ColorEnum.themeColorOpacity3Percentage,
                        ),
                        borderColor: StaticFunctions.getColor(
                          context,
                          ColorEnum.borderColorE0,
                        ),
                        fontWeight: FontWeight.w700,
                        borderRadius: Dimensions.dialogButtonsBorderRadius.r,
                        borderWidth: Dimensions.dialogButtonsBorderWidth.w,
                      ),
                    ),
                  if (negativeButton != null && positiveButton != null)
                    SizedBox(
                      width: Dimensions.dialogButtonsBetweenSpace.w,
                    ),
                  if (positiveButton != null && positiveButton!.isNotEmpty)
                    Expanded(
                      child: ButtonWidget(
                        text: positiveButton!,
                        onClick: onPositiveButtonClick != null
                            ? onPositiveButtonClick!
                            : () {},
                        textSize: Dimensions.dialogButtonsTextSize.sp,
                        textColor: StaticFunctions.getColor(
                          context,
                          ColorEnum.whiteColor,
                        ),
                        bgColor: StaticFunctions.getColor(
                          context,
                          ColorEnum.themeColor,
                        ),
                        borderRadius: Dimensions.dialogButtonsBorderRadius.r,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
