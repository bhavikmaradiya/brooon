import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../const/dimen_const.dart';
import '../utils/enums.dart';
import '../utils/static_functions.dart';

class BottomSheetGridItem extends StatelessWidget {
  final String title;
  final String icon;
  final Function()? onTap;
  final bool isDisabled;

  const BottomSheetGridItem({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        double totalWidthOfBox = constraint.constrainWidth();
        double totalHeightOfBox = constraint.constrainHeight();
        double checkedIconSize = (totalWidthOfBox * 0.16).h;
        double paddingAroundBox = (checkedIconSize * 0.4).h;
        double iconSize = (totalHeightOfBox * 0.36).h;
        double textHorizontalSpacing = 0;
        double fontSize = (totalHeightOfBox * 0.15).sp;
        double boxRadius = Dimensions.borderRadius.r;
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              top: paddingAroundBox,
              bottom: paddingAroundBox,
              child: Container(
                decoration: BoxDecoration(
                  color: StaticFunctions.getColor(
                    context,
                    isDisabled
                        ? ColorEnum.themeColorOpacity3Percentage
                        : ColorEnum.whiteColor,
                  ),
                  borderRadius: BorderRadius.circular(boxRadius),
                  border: Border.all(
                    width: Dimensions.bottomSheetGridBoxItemBorderWidth.w,
                    color: StaticFunctions.getColor(
                      context,
                      ColorEnum.borderColorE0,
                    ),
                  ),
                ),
                padding: EdgeInsets.all(
                  Dimensions.bottomSheetGridBoxItemBorderWidth.w,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: isDisabled ? null : onTap,
                    borderRadius: BorderRadius.circular(boxRadius),
                    child: Container(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              bottom: Dimensions
                                  .bottomSheetGridImageVerticalPadding.h,
                            ),
                            child: SvgPicture.asset(
                              icon,
                              width: iconSize,
                              height: iconSize,
                              color: isDisabled
                                  ? StaticFunctions.getColor(
                                      context,
                                      ColorEnum.gray90Color,
                                    )
                                  : null,
                            ),
                          ),
                          Positioned(
                            bottom:
                                Dimensions.bottomSheetGridTextVerticalPadding.h,
                            left: textHorizontalSpacing,
                            right: textHorizontalSpacing,
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: fontSize,
                                color: StaticFunctions.getColor(
                                  context,
                                  isDisabled
                                      ? ColorEnum.gray99Color
                                      : ColorEnum.blackColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
