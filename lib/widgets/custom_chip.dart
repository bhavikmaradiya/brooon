import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../const/dimen_const.dart';
import '../const/string_const.dart';
import '../utils/enums.dart';
import '../utils/static_functions.dart';

class CustomChip extends StatelessWidget {
  final Map<int, String> chipList;
  final Function(int id)? onChipDeleted;

  const CustomChip({
    Key? key,
    required this.chipList,
    required this.onChipDeleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Dimensions.chipItemSpacing.w,
      runSpacing: Dimensions.chipItemSpacing.h,
      children: [
        ...chipList.entries.map(
          (element) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Dimensions.chipBorderRadius.r,
                ),
                border: Border.all(
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.borderColorE0,
                  ),
                  width: Dimensions.chipBorderWidth.w,
                ),
                color: StaticFunctions.getColor(
                  context,
                  ColorEnum.themeColorOpacity3Percentage,
                ),
              ),
              padding: EdgeInsets.only(
                left: Dimensions.chipHorizontalSpacing.w,
                top: Dimensions.chipVerticalSpacing.h,
                bottom: Dimensions.chipVerticalSpacing.h,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    element.value,
                    style: TextStyle(
                      fontSize: Dimensions.chipTextSize.sp,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.blackColor,
                      ),
                    ),
                  ),
                  if (onChipDeleted != null)
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: StaticFunctions.getColor(
                          context,
                          ColorEnum.touchSplashColor,
                        ),
                        borderRadius: BorderRadius.circular(
                          (Dimensions.chipBorderRadius * 4).r,
                        ),
                        onTap: () {
                          if (onChipDeleted != null) {
                            onChipDeleted!(element.key);
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            top: Dimensions.chipIconTextMarginTop.h,
                          ),
                          padding: EdgeInsets.all(
                            Dimensions.chipDeleteIconPadding.w,
                          ),
                          child: SvgPicture.asset(
                            Strings.iconClose,
                            width: Dimensions.chipDeleteIconSize.w,
                            height: Dimensions.chipDeleteIconSize.w,
                          ),
                        ),
                      ),
                    ),
                  if (onChipDeleted == null)
                    Padding(
                      padding: EdgeInsets.only(
                        top: Dimensions.chipDeleteIconPadding.w,
                        right: Dimensions.chipDeleteIconPadding.w,
                        bottom: Dimensions.chipDeleteIconPadding.w,
                      ),
                    ),
                ],
              ),
            );
          },
        ).toList(),
      ],
    );
  }
}
