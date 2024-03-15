import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/dimen_const.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';

class PropertyCountItemWidget extends StatelessWidget {
  final String countText;
  final Color? touchSplashColor;
  final bool isSelected;
  final Function() onSelect;

  PropertyCountItemWidget(
      {required this.countText,
      required this.onSelect,
      required this.isSelected,
      this.touchSplashColor = null})
      : super();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      double totalHeightOfBox = constraint.constrainHeight();
      double fontSize = (totalHeightOfBox * 0.35).sp;
      // double boxRadius = (totalWidthOfBox * 0.1).r;
      double boxRadius = Dimensions.borderRadius.r;
      return Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: StaticFunctions.getColor(
                  context,
                  isSelected
                      ? ColorEnum.themeColorOpacity3Percentage
                      : ColorEnum.whiteColor,
                ),
                borderRadius: BorderRadius.circular(boxRadius),
                border: Border.all(
                  width: 50.w,
                  color: StaticFunctions.getColor(
                    context,
                    isSelected ? ColorEnum.themeColor : ColorEnum.grayColor,
                  ),
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => onSelect(),
                  splashColor: touchSplashColor ??
                      StaticFunctions.getColor(
                        context,
                        ColorEnum.touchSplashColor,
                      ),
                  borderRadius: BorderRadius.circular(boxRadius),
                  child: Container(
                    child: Center(
                      child: Text(
                        countText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: fontSize,
                          color: StaticFunctions.getColor(
                            context,
                            isSelected
                                ? ColorEnum.themeColor
                                : ColorEnum.blackColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
