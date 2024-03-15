import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../common_property_data_provider.dart';
import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../localdb/properties/db_property.dart';
import '../../localdb/save_default_data.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../views/view_all_property/model/view_all_screen_arg.dart';

class PropertyContent extends StatelessWidget {
  final AppLocalizations localizationsContext;
  final DbProperty property;
  final bool sharedByBrooon;
  final ViewAllFromType? viewAllFromType;
  final bool showBrooonNameInContent;

  const PropertyContent({
    Key? key,
    required this.localizationsContext,
    required this.property,
    required this.sharedByBrooon,
    this.viewAllFromType,
    this.showBrooonNameInContent = false,
  }) : super(key: key);

  Widget _priceWidget(
    BuildContext context,
    bool isActiveColor,
  ) {
    final price = StaticFunctions.getPropertyFormattedPrice(
      localizationsContext: localizationsContext,
      property: property,
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

  Widget _propertyAlsoAvailableWidget(
    BuildContext context,
    bool isActiveColor,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.homePropertyItemPadding.w,
      ),
      child: Text(
        (property.propertyForValues != null &&
                property.propertyForValues!.length > 2)
            ? '${localizationsContext.propertyAvailableFor('${property.propertyForValues![1]}')} & ${property.propertyForValues![2]}'
            : (property.propertyForValues != null &&
                    property.propertyForValues!.length > 1)
                ? '${localizationsContext.propertyAvailableFor('${property.propertyForValues![1]}')}'
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

  Widget _propertyContent({
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
                        ? (property.brooonName ?? localizationsContext.appName)
                        : StaticFunctions.propertyItemIdWithName(property),
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
                  '${CommonPropertyDataProvider.propertyAreaWithPropertyType(property)}',
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
                  (property.propertyForValues != null &&
                          property.propertyForValues!.isNotEmpty)
                      ? '${localizationsContext.propertyForValue('${property.propertyForValues![0]}')}'
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
              _propertyAlsoAvailableWidget(
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
                                StaticFunctions.isPropertyLocationAvailable(
                                    property)
                            ? ColorEnum.themeColor
                            : ColorEnum.gray90Color,
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.propertyItemLocationIconTextSpacing.w,
                    ),
                    Expanded(
                      child: Text(
                        sharedByBrooon
                            ? (property.publicAddressLandMark != null &&
                                    property.publicAddressLandMark!.isNotEmpty)
                                ? property.publicAddressLandMark!
                                : localizationsContext.unknownLocation
                            : (property.addressLandMark != null &&
                                    property.addressLandMark!.isNotEmpty)
                                ? property.addressLandMark!
                                : localizationsContext.unknownLocation,
                        style: TextStyle(
                          fontSize: Dimensions
                              .propertyItemPropertyContentTextSize12Px.sp,
                          color: StaticFunctions.getColor(
                            context,
                            isActiveColor &&
                                    StaticFunctions.isPropertyLocationAvailable(
                                        property)
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
          if (property.propertySoldStatusId == SaveDefaultData.soldStatusId)
            Positioned(
              top: 0,
              right: Dimensions.homePropertyItemPadding.w,
              child: SvgPicture.asset(
                StaticFunctions.getPropertySoldUnsoldIcon(property),
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
    return _propertyContent(
      context: context,
      isActiveColor: viewAllFromType == ViewAllFromType.closedDeals
          ? true
          : property.propertyStatusId == SaveDefaultData.activeStatusId,
    );
  }
}
