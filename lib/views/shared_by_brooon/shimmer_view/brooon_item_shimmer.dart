import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../const/dimen_const.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';
import '../../../widgets/light_divider.dart';
import '../../view_all_property/model/view_all_screen_arg.dart';

class BrooonItemShimmer extends StatelessWidget {
  final Axis listScrollDirection;
  final ViewAllFromType? fromType;
  final bool isImagePreviewVisible;
  final bool isActionVisible;

  const BrooonItemShimmer({
    Key? key,
    this.fromType,
    required this.listScrollDirection,
    required this.isImagePreviewVisible,
    this.isActionVisible = false,
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

  Widget _spacingBetweenWidget() {
    return SizedBox(
      height: 10.h,
    );
  }

  Widget _basicInfoView(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isImagePreviewVisible)
          Padding(
            padding: EdgeInsets.only(
              left: Dimensions.viewAllPropertyItemContentPaddings.w,
            ),
            child: Container(
              width: Dimensions.viewAllPropertyItemImageSize.w,
              height: Dimensions.viewAllPropertyItemImageSize.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    Dimensions.propertyItemBorderRadius.r,
                  ),
                ),
                border: Border.all(
                  width: Dimensions.imageOutlineBorderWidth.w,
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.borderColorE0,
                  ),
                ),
                color: StaticFunctions.getColor(
                  context,
                  ColorEnum.whiteColor,
                ),
              ),
            ),
          ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _skeletonColoredWidget(
                context,
                150.w,
                20.h,
              ),
              _spacingBetweenWidget(),
              _skeletonColoredWidget(
                context,
                220.w,
                20.h,
              ),
              _spacingBetweenWidget(),
              _skeletonColoredWidget(
                context,
                50.w,
                20.h,
              ),
              _spacingBetweenWidget(),
              _skeletonColoredWidget(
                context,
                150.w,
                20.h,
              ),
              _spacingBetweenWidget(),
              _skeletonColoredWidget(
                context,
                180.w,
                20.h,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _brooonInfoView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LightDivider(),
        _spacingBetweenWidget(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.homePropertyItemPadding.w,
          ),
          child: Row(
            children: [
              Container(
                width: Dimensions.propertyItemBrooonProfileSize.w,
                height: Dimensions.propertyItemBrooonProfileSize.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: StaticFunctions.getColor(
                      context,
                      ColorEnum.borderColorE0,
                    ),
                    width: Dimensions.propertyItemBorderWidth.w,
                  ),
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.whiteColor,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      Dimensions.propertyItemBrooonProfileSize.r,
                    ),
                  ), //
                  child: const SizedBox(),
                ),
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
                      height: Dimensions.propertyItemBrooonNamePhoneSpacing.h,
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
                width: Dimensions.propertyItemBrooonPhoneSize.w,
                height: Dimensions.propertyItemBrooonPhoneSize.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Dimensions.propertyItemBrooonPhoneContainerRadius.r,
                  ),
                  border: Border.all(
                    color: StaticFunctions.getColor(
                      context,
                      ColorEnum.borderColorE0,
                    ),
                    width: Dimensions.propertyItemBorderWidth.w,
                  ),
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.whiteColor,
                  ),
                ),
                padding: EdgeInsets.all(
                  Dimensions.propertyItemBorderWidth.w,
                ),
                child: Padding(
                  padding: EdgeInsets.all(
                    (Dimensions.propertyItemBrooonPhoneSize / 4).w,
                  ),
                  child: _skeletonColoredWidget(
                    context,
                    20.w,
                    20.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _actionItemView(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Dimensions.propertyItemCallShareViewRadius.r,
          ),
          border: Border.all(
            width: Dimensions.propertyItemBorderWidth.w,
            color: StaticFunctions.getColor(
              context,
              ColorEnum.borderColorE0,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.propertyItemCallShareViewContentPadding.h,
          ),
          child: Center(
            child: Container(
              height: Dimensions.propertyItemCallShareViewIconSize.w,
              width: Dimensions.propertyItemCallShareViewIconSize.w,
              color: StaticFunctions.getColor(
                context,
                ColorEnum.whiteColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _actionView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.viewAllPropertyItemContentPaddings.w,
        right: Dimensions.viewAllPropertyItemContentPaddings.w,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _actionItemView(context),
          SizedBox(
            width: Dimensions.propertyItemCallShareViewItemSpacing.w,
          ),
          _actionItemView(context),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: isActionVisible ? 215.h : 245.h,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: listScrollDirection,
        itemCount: listScrollDirection == Axis.horizontal ? 3 : 5,
        itemBuilder: (context, index) {
          return Container(
            width: Dimensions.homePropertyItemWidth.w,
            margin: EdgeInsets.only(
              left: listScrollDirection == Axis.horizontal
                  ? (index == 0 ? Dimensions.screenHorizontalMargin.w : 0)
                  : 0,
              right: listScrollDirection == Axis.horizontal
                  ? Dimensions.screenHorizontalMargin.w
                  : 0,
              top: listScrollDirection == Axis.vertical
                  ? fromType != ViewAllFromType.brooonProperties &&
                          fromType != ViewAllFromType.brooonInquiries
                      ? Dimensions.viewAllPropertyItemVerticalMargins.h
                      : (index != 0
                          ? Dimensions.viewAllPropertyItemVerticalMargins.h
                          : 0)
                  : 0,
            ),
            padding: EdgeInsets.all(
              Dimensions.propertyItemBorderWidth.w,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: Dimensions.propertyItemBorderWidth.w,
                color: StaticFunctions.getColor(
                  context,
                  ColorEnum.borderColorE0,
                ),
              ),
              borderRadius: BorderRadius.circular(
                Dimensions.propertyItemBorderRadius.r,
              ),
              color: StaticFunctions.getColor(
                context,
                ColorEnum.blueColorOpacity3Percentage,
              ),
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
              child: Padding(
                padding: EdgeInsets.only(
                  top: Dimensions.homePropertyItemPadding.w,
                  bottom: Dimensions.homePropertyItemPadding.w,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _basicInfoView(context),
                    _spacingBetweenWidget(),
                    if (!isActionVisible) _brooonInfoView(context),
                    if (isActionVisible) _actionView(context),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
