import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import './public_property_option.dart';
import '../../../const/dimen_const.dart';
import '../../../const/string_const.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';

class PublicPropertyConfirmationOption extends StatelessWidget {
  final PublicPropertyOption option;

  PublicPropertyConfirmationOption({
    required this.option,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: (Dimensions.optionBottomSheetSharingOptionVerticalMargin.h / 2),
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
            children: [
              SvgPicture.asset(
                option.isEnabled
                    ? Strings.iconPublicPropertyConfirmationOptionEnabled
                    : Strings.iconPublicPropertyConfirmationOptionDisabled,
                width: Dimensions.optionBottomSheetSmallIconSize.w,
                height: Dimensions.optionBottomSheetSmallIconSize.w,
                color: StaticFunctions.getColor(
                    context,
                    option.isEnabled
                        ? ColorEnum.greenColor
                        : ColorEnum.redColor),
              ),
              if (option.isEnabled)
                SizedBox(
                  width: Dimensions
                      .optionBottomSheetIconContentMargin.w,
                ),
              if (!option.isEnabled)
                SizedBox(
                  width: Dimensions.optionBottomSheetSmallIconSize.w,
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
          SizedBox(
            height: Dimensions.optionBottomSheetTitleSubTitleSpacing.h,
          ),
          Row(
            children: [
              SizedBox(
                width: (Dimensions.optionBottomSheetIconSize +
                        Dimensions
                            .optionBottomSheetIconContentMargin -
                        2)
                    .w,
              ),
              Expanded(
                child: Text(
                  option.subtitle,
                  maxLines: 2,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: Dimensions.optionBottomSheetSubTitleTextSize.sp,
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
    );
  }
}
