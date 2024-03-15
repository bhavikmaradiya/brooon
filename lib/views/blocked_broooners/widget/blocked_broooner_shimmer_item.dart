import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../const/dimen_const.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';

class BlockedBrooonerShimmerItem extends StatelessWidget {
  const BlockedBrooonerShimmerItem({
    Key? key,
  }) : super(key: key);

  Widget _skeletonColoredWidget(
    BuildContext context,
    double width,
    double height,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.homePropertyItemPadding.w,
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: ColoredBox(
          color: StaticFunctions.getColor(
            context,
            ColorEnum.whiteColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.blockedBrooonerItemBetweenSpacing.h / 2,
      ),
      decoration: BoxDecoration(
        color: StaticFunctions.getColor(
          context,
          ColorEnum.blueColorOpacity2Percentage,
        ),
        borderRadius: BorderRadius.circular(
          Dimensions.blockedBrooonerItemBorderRadius.sp,
        ),
        border: Border.all(
          color: StaticFunctions.getColor(
            context,
            ColorEnum.borderColorE0,
          ),
          width: Dimensions.blockedBrooonerItemBorderWidth.w,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.blockedBrooonerItemHorizontalPadding.w,
        vertical: Dimensions.blockedBrooonerItemVerticalPadding.h,
      ),
      child: Shimmer.fromColors(
        baseColor: StaticFunctions.getColor(
          context,
          ColorEnum.shimmerBaseColor,
        ),
        highlightColor: StaticFunctions.getColor(
          context,
          ColorEnum.shimmerHighlightColor,
        ),
        child: Row(
          children: [
            Container(
              width: Dimensions.blockedBrooonerItemProfileSize.w,
              height: Dimensions.blockedBrooonerItemProfileSize.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.borderColorE0,
                  ),
                  width: Dimensions.blockedBrooonerItemBorderWidth.w,
                ),
                color: StaticFunctions.getColor(
                  context,
                  ColorEnum.whiteColor,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    Dimensions.blockedBrooonerItemProfileSize.r,
                  ),
                ), //
                child: const SizedBox(),
              ),
            ),
            SizedBox(
              width: Dimensions.blockedBrooonerItemProfileTextSpacing.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _skeletonColoredWidget(
                    context,
                    double.infinity,
                    20.h,
                  ),
                  SizedBox(
                    height: Dimensions.blockedBrooonerItemNamePhoneSpacing.h,
                  ),
                  _skeletonColoredWidget(
                    context,
                    double.infinity,
                    20.h,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: StaticFunctions.getColor(
                  context,
                  ColorEnum.whiteColor,
                ),
                borderRadius: BorderRadius.circular(
                  Dimensions.blockedBrooonerItemBorderRadius.sp,
                ),
                border: Border.all(
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.borderColorE0,
                  ),
                  width: Dimensions.blockedBrooonerItemBorderWidth.w,
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical:
                    Dimensions.blockedBrooonerItemUnblockTextVerticalPadding.h,
                horizontal: Dimensions
                    .blockedBrooonerItemUnblockTextHorizontalPadding.w,
              ),
              child: _skeletonColoredWidget(
                context,
                50.w,
                20.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
