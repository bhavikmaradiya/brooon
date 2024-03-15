import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../const/dimen_const.dart';
import '../../../const/string_const.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';
import '../model/buyer_seller_enum.dart';
import '../model/buyer_seller_info.dart';

class BuyerSellerItem extends StatelessWidget {
  final BuyerSellerInfo buyerSellerInfo;
  final AppLocalizations? localizationsContext;
  final bool isLastIndex;
  final Function(BuyerSellerViewType)? onItemClick;
  final Function? onCallClick;
  final BuyerSellerType buyerSellerType;

  const BuyerSellerItem({
    Key? key,
    required this.buyerSellerInfo,
    required this.localizationsContext,
    required this.isLastIndex,
    required this.onItemClick,
    required this.onCallClick,
    required this.buyerSellerType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inquiryCount = buyerSellerInfo.inquiryCount;
    final propertyCount = buyerSellerInfo.propertyCount;
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.screenHorizontalMargin.w,
        right: Dimensions.screenHorizontalMargin.w,
        top: Dimensions.customerOwnerListItemSpacing.h,
        bottom: isLastIndex ? (Dimensions.fabIconSize.h * 2) : 0,
      ),
      padding: EdgeInsets.all(
        Dimensions.customerOwnerListItemBorderWidth.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Dimensions.customerOwnerListItemRadius.r,
        ),
        border: Border.all(
          width: Dimensions.customerOwnerListItemBorderWidth.w,
          color: StaticFunctions.getColor(
            context,
            ColorEnum.borderColorE0,
          ),
        ),
        color: StaticFunctions.getColor(
          context,
          ColorEnum.blueColorOpacity2Percentage,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(
          Dimensions.customerOwnerListItemPadding.w,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        buyerSellerInfo.name ??
                            localizationsContext!.unknownText,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize:
                              Dimensions.customerOwnerListItemNameTextSize.sp,
                          fontWeight: FontWeight.w600,
                          color: StaticFunctions.getColor(
                            context,
                            ColorEnum.blackColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height:
                            Dimensions.customerOwnerListItemContentSpacing.h,
                      ),
                      Text(
                        (buyerSellerInfo.phone == null ||
                                buyerSellerInfo.phone!.trim().isEmpty)
                            ? localizationsContext!.noPhoneFound
                            : buyerSellerInfo.phone!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize:
                              Dimensions.customerOwnerListItemPhoneTextSize.sp,
                          color: StaticFunctions.getColor(
                            context,
                            ColorEnum.blackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (buyerSellerInfo.phone != null &&
                    buyerSellerInfo.phone!.trim().isNotEmpty)
                  Container(
                    width: Dimensions.customerOwnerListItemCallContainerSize.w,
                    height: Dimensions.customerOwnerListItemCallContainerSize.w,
                    padding: EdgeInsets.all(
                      Dimensions.customerOwnerListItemBorderWidth.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimensions.customerOwnerListItemRadius.r,
                      ),
                      border: Border.all(
                        width: Dimensions.customerOwnerListItemBorderWidth.w,
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
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: StaticFunctions.getColor(
                          context,
                          ColorEnum.touchSplashColor,
                        ),
                        borderRadius: BorderRadius.circular(
                          Dimensions.customerOwnerListItemRadius.r,
                        ),
                        onTap: () {
                          if (onCallClick != null) {
                            onCallClick!();
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.all(
                            (Dimensions.customerOwnerListItemCallContainerSize /
                                    4)
                                .w,
                          ),
                          child: SvgPicture.asset(
                            Strings.iconCall,
                            color: StaticFunctions.getColor(
                              context,
                              ColorEnum.themeColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: Dimensions.customerOwnerListItemPadding.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimensions.buyerSellerActionBtnsRadius.r,
                      ),
                      border: Border.all(
                        width: Dimensions.buyerSellerActionBtnsBorderWidth.w,
                        color: StaticFunctions.getColor(
                          context,
                          ColorEnum.borderColorE0,
                        ),
                      ),
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.themeColorOpacity3Percentage,
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          if (onItemClick != null) {
                            if (buyerSellerType == BuyerSellerType.buyers) {
                              onItemClick!(BuyerSellerViewType.inquiries);
                            } else if (buyerSellerType ==
                                BuyerSellerType.sellers) {
                              onItemClick!(BuyerSellerViewType.properties);
                            }
                          }
                        },
                        borderRadius: BorderRadius.circular(
                          Dimensions.buyerSellerActionBtnsRadius.r,
                        ),
                        splashColor: StaticFunctions.getColor(
                          context,
                          ColorEnum.touchSplashColor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions
                                .buyerSellerActionBtnsContentPadding.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                buyerSellerType == BuyerSellerType.buyers
                                    ? '${inquiryCount}'
                                    : '${propertyCount}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: Dimensions
                                      .buyerSellerActionBtnCountTextSize.sp,
                                  fontWeight: FontWeight.w600,
                                  color: StaticFunctions.getColor(
                                    context,
                                    ColorEnum.blackColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Dimensions
                                    .buyerSellerActionBtnsCountTextPadding.w,
                              ),
                              Flexible(
                                child: Text(
                                  buyerSellerType == BuyerSellerType.buyers
                                      ? localizationsContext!
                                          .inquiryListedBtnText(
                                          inquiryCount,
                                        )
                                      : localizationsContext!
                                          .propertyListedBtnText(
                                          propertyCount,
                                        ),
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: Dimensions
                                        .buyerSellerActionBtnsTextSize.sp,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis,
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
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: Dimensions.buyerSellerActionBtnsSpacing.w,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimensions.buyerSellerActionBtnsRadius.r,
                      ),
                      border: Border.all(
                        width: Dimensions.buyerSellerActionBtnsBorderWidth.w,
                        color: StaticFunctions.getColor(
                          context,
                          ColorEnum.borderColorE0,
                        ),
                      ),
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.themeColorOpacity3Percentage,
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          if (onItemClick != null) {
                            if (buyerSellerType == BuyerSellerType.buyers) {
                              onItemClick!(BuyerSellerViewType.properties);
                            } else if (buyerSellerType ==
                                BuyerSellerType.sellers) {
                              onItemClick!(BuyerSellerViewType.inquiries);
                            }
                          }
                        },
                        borderRadius: BorderRadius.circular(
                          Dimensions.buyerSellerActionBtnsRadius.r,
                        ),
                        splashColor: StaticFunctions.getColor(
                          context,
                          ColorEnum.touchSplashColor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions
                                .buyerSellerActionBtnsContentPadding.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                buyerSellerType == BuyerSellerType.buyers
                                    ? '${propertyCount}'
                                    : '${inquiryCount}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: Dimensions
                                      .buyerSellerActionBtnCountTextSize.sp,
                                  fontWeight: FontWeight.w600,
                                  color: StaticFunctions.getColor(
                                    context,
                                    (buyerSellerType == BuyerSellerType.buyers
                                                ? propertyCount
                                                : inquiryCount) <=
                                            0
                                        ? ColorEnum.blackColor
                                        : ColorEnum.greenMatchingColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Dimensions
                                    .buyerSellerActionBtnsCountTextPadding.w,
                              ),
                              Flexible(
                                child: Text(
                                  buyerSellerType == BuyerSellerType.buyers
                                      ? localizationsContext!
                                          .matchingPropertyBtnText(
                                          propertyCount,
                                        )
                                      : localizationsContext!
                                          .matchingInquiryBtnText(
                                          inquiryCount,
                                        ),
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: Dimensions
                                        .buyerSellerActionBtnsTextSize.sp,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis,
                                    color: StaticFunctions.getColor(
                                      context,
                                      (buyerSellerType == BuyerSellerType.buyers
                                                  ? propertyCount
                                                  : inquiryCount) <=
                                              0
                                          ? ColorEnum.blackColor
                                          : ColorEnum.greenMatchingColor,
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
            ),
          ],
        ),
      ),
    );
  }
}
