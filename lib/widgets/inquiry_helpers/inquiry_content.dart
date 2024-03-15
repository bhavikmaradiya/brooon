import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../common_property_data_provider.dart';
import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../localdb/properties/db_saved_filter.dart';
import '../../localdb/save_default_data.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../views/view_all_property/model/view_all_screen_arg.dart';

class InquiryContent extends StatelessWidget {
  final AppLocalizations localizationsContext;
  final DbSavedFilter inquiry;
  final bool sharedByBrooon;
  final ViewAllFromType? viewAllFromType;
  final bool showBrooonNameInContent;

  const InquiryContent({
    Key? key,
    required this.localizationsContext,
    required this.inquiry,
    this.sharedByBrooon = false,
    this.viewAllFromType,
    this.showBrooonNameInContent = false,
  }) : super(key: key);

  Widget _priceWidget(
    BuildContext context,
    bool isActiveColor,
  ) {
    final price = StaticFunctions.getInquiryFormattedPrice(
      localizationsContext: localizationsContext,
      inquiry: inquiry,
    ).values.first;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.homePropertyItemPadding.w,
      ),
      child: Text(
        StaticFunctions.isPriceAvailable(price)
            ? price
            : localizationsContext.unknownPrice,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: Dimensions.propertyItemPropertyContentTextSize16Px.sp,
          color: StaticFunctions.getColor(
            context,
            (isActiveColor && StaticFunctions.isPriceAvailable(price))
                ? ColorEnum.themeColor
                : ColorEnum.gray90Color,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        maxLines: 1,
      ),
    );
  }

  _inquiryAlsoAvailableWidget(
    BuildContext context,
    bool isActiveColor,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.homePropertyItemPadding.w,
      ),
      child: Text(
        (inquiry.propertyForValues != null &&
                inquiry.propertyForValues!.length > 2)
            ? '${localizationsContext.inquiryAvailableFor('${inquiry.propertyForValues![1]}')} & ${inquiry.propertyForValues![2]}'
            : (inquiry.propertyForValues != null &&
                    inquiry.propertyForValues!.length > 1)
                ? '${localizationsContext.inquiryAvailableFor('${inquiry.propertyForValues![1]}')}'
                : '',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: Dimensions.propertyItemPropertyContentTextSize12Px.sp,
          color: StaticFunctions.getColor(
            context,
            isActiveColor ? ColorEnum.blueColor : ColorEnum.gray90Color,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        maxLines: 1,
      ),
    );
  }

  Widget _inquiryContent({
    required BuildContext context,
    required bool isActiveColor,
  }) {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!sharedByBrooon || showBrooonNameInContent)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.homePropertyItemPadding.w,
                  ),
                  child: Text(
                    showBrooonNameInContent
                        ? (inquiry.brooonName ?? localizationsContext.appName)
                        : StaticFunctions.inquiryItemIdWithName(inquiry),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize:
                          Dimensions.propertyItemPropertyContentTextSize12Px.sp,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.gray90Color,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                ),
              if (!sharedByBrooon || showBrooonNameInContent)
                SizedBox(
                  height: Dimensions.propertyItemPadding2Px.h,
                ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.homePropertyItemPadding.w,
                ),
                child: Text(
                  '${CommonPropertyDataProvider.inquiryAreaWithPropertyType(localizationsContext, inquiry)}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize:
                        Dimensions.propertyItemPropertyContentTextSize14Px.sp,
                    color: StaticFunctions.getColor(
                      context,
                      isActiveColor
                          ? ColorEnum.blackColor
                          : ColorEnum.gray90Color,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ),
              SizedBox(
                height: Dimensions.propertyItemPadding8Px.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.homePropertyItemPadding.w,
                ),
                child: Text(
                  (inquiry.propertyForValues != null &&
                          inquiry.propertyForValues!.isNotEmpty)
                      ? '${localizationsContext.propertyForValue('${inquiry.propertyForValues![0]}')}'
                      : '${localizationsContext.unknownText}',
                  style: TextStyle(
                    fontSize:
                        Dimensions.propertyItemPropertyContentTextSize12Px.sp,
                    color: StaticFunctions.getColor(
                      context,
                      isActiveColor
                          ? ColorEnum.blackColor
                          : ColorEnum.gray90Color,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ),
              SizedBox(
                height: Dimensions.propertyItemNamePriceMargin.h,
              ),
              _priceWidget(
                context,
                isActiveColor,
              ),
              _inquiryAlsoAvailableWidget(
                context,
                isActiveColor,
              ),
              SizedBox(
                height: Dimensions.propertyItemLocationPriceMargin.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.homePropertyItemPadding.w,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Strings.iconLocation,
                      height: Dimensions.propertyItemLocationIconHeight.h,
                      width: Dimensions.propertyItemLocationIconWidth.w,
                      color: StaticFunctions.getColor(
                        context,
                        isActiveColor &&
                                StaticFunctions.isInquiryLocationAvailable(
                                    inquiry)
                            ? ColorEnum.themeColor
                            : ColorEnum.gray90Color,
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.propertyItemLocationIconTextSpacing.w,
                    ),
                    Expanded(
                      child: Text(
                        (inquiry.location != null &&
                                inquiry.location!.isNotEmpty)
                            ? inquiry.location!
                            : localizationsContext.unknownLocation,
                        style: TextStyle(
                          fontSize: Dimensions
                              .propertyItemPropertyContentTextSize12Px.sp,
                          color: StaticFunctions.getColor(
                            context,
                            isActiveColor &&
                                    StaticFunctions.isInquiryLocationAvailable(
                                        inquiry)
                                ? ColorEnum.blackColor
                                : ColorEnum.gray90Color,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (inquiry.inquirySoldStatusId == SaveDefaultData.soldStatusId)
            Positioned(
              top: 0,
              right: Dimensions.homePropertyItemPadding.w,
              child: SvgPicture.asset(
                StaticFunctions.getInquirySoldUnsoldIcon(inquiry),
                width: Dimensions.viewAllPropertyItemSoldIconSize.w,
                height: Dimensions.viewAllPropertyItemSoldIconSize.w,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _inquiryContent(
      context: context,
      isActiveColor: viewAllFromType == ViewAllFromType.closedDeals
          ? true
          : inquiry.inquiryStatusId == SaveDefaultData.activeStatusId,
    );
  }
}
