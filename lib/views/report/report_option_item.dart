import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import './report_options.dart';
import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';

class ReportOptionItem extends StatelessWidget {
  final ReportOptions option;
  final Function? onClicked;

  ReportOptionItem({
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
          vertical: (Dimensions.optionBottomSheetSharingOptionVerticalMargin.h / 2),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.screenHorizontalMargin.w,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: Dimensions.optionBottomSheetCheckboxMarginTop.h,
              ),
              child: SvgPicture.asset(
                option.isSelected
                    ? Strings.iconShareOptionEnabled
                    : Strings.iconShareOptionDisabled,
                width: Dimensions.optionBottomSheetIconSize.w,
                height: Dimensions.optionBottomSheetIconSize.w,
              ),
            ),
            SizedBox(
              width: Dimensions.optionBottomSheetIconContentMargin.w,
            ),
            Expanded(
              child: Text(
                option.reason,
                style: TextStyle(
                  fontSize: Dimensions.optionBottomSheetTitleTextSize.sp,
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.blackColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
