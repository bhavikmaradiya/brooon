import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import './sharing_option.dart';
import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';

class SharingOptionItem extends StatelessWidget {
  final SharingOption option;
  final Function? onClicked;

  SharingOptionItem({
    required this.option,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onClicked != null) {
          onClicked!();
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical:
              (Dimensions.optionBottomSheetSharingOptionVerticalMargin.h / 2),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.screenHorizontalMargin.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  option.isEnabled
                      ? Strings.iconShareOptionEnabled
                      : Strings.iconShareOptionDisabled,
                  width: Dimensions.optionBottomSheetIconSize.w,
                  height: Dimensions.optionBottomSheetIconSize.w,
                ),
                SizedBox(
                  width: Dimensions.optionBottomSheetIconContentMargin.w,
                ),
                Text(
                  option.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: Dimensions.optionBottomSheetTitleTextSize.sp,
                    color: StaticFunctions.getColor(
                      context,
                      ColorEnum.blueColor,
                    ),
                  ),
                ),
              ],
            ),
            if (option.subtitle.trim().isNotEmpty)
              SizedBox(
                height: Dimensions.optionBottomSheetTitleSubTitleSpacing.h,
              ),
            if (option.subtitle.trim().isNotEmpty)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Dimensions.optionBottomSheetIconSize.w,
                    height: Dimensions.optionBottomSheetIconSize.w,
                  ),
                  SizedBox(
                    width: Dimensions.optionBottomSheetIconContentMargin.w,
                  ),
                  Expanded(
                    child: Text(
                      option.subtitle,
                      maxLines: 2,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize:
                            Dimensions.optionBottomSheetSubTitleTextSize.sp,
                        color: StaticFunctions.getColor(
                          context,
                          ColorEnum.blackColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
