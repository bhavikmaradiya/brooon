import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import './model/view_all_screen_arg.dart';
import '../../../const/dimen_const.dart';
import '../../common_property_data_provider.dart';
import '../../const/string_const.dart';
import '../../localdb/properties/db_property.dart';
import '../../localdb/save_default_data.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../widgets/image_loader.dart';
import '../../widgets/property_helpers/property_actions.dart';
import '../../widgets/property_helpers/property_content.dart';

class ViewAllPropertyItem extends StatelessWidget {
  final AppLocalizations localizationsContext;
  final DbProperty property;
  final CommonPropertyDataProvider commonPropertyDataProvider;
  final ViewAllFromType viewAllFromType;
  final bool isLastIndex;
  final bool isMapItem;
  final Function(DbProperty) onSelectedProperty;
  final Function()? onMatchingClicked;

  ViewAllPropertyItem({
    required this.localizationsContext,
    required this.property,
    required this.onSelectedProperty,
    required this.commonPropertyDataProvider,
    required this.viewAllFromType,
    required this.isLastIndex,
    this.onMatchingClicked,
    this.isMapItem = false,
  });

  @override
  Widget build(BuildContext context) {
    final propertyItemsPreviewContentsStyle = TextStyle(
      fontSize: Dimensions.propertyItemPropertyContentTextSize10Px.sp,
      fontWeight: FontWeight.w600,
      color: StaticFunctions.getColor(
        context,
        ColorEnum.whiteColor,
      ),
    );
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: Dimensions.viewAllPropertyItemVerticalMargins.h,
        bottom: isLastIndex
            ? (viewAllFromType == ViewAllFromType.nearBy ||
                    viewAllFromType == ViewAllFromType.sellers ||
                    viewAllFromType == ViewAllFromType.buyers)
                ? Dimensions.viewAllPropertyItemVerticalMargins.h
                : Dimensions.viewAllPropertyLastItemBottomMargin.h
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
            isMapItem ? ColorEnum.blueColor : ColorEnum.borderColorE0,
          ),
        ),
        borderRadius: BorderRadius.circular(
          Dimensions.propertyItemBorderRadius.r,
        ),
        color: StaticFunctions.getColor(
          context,
          isMapItem
              ? ColorEnum.whiteColor
              : ColorEnum.blueColorOpacity3Percentage,
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
            Dimensions.propertyItemBorderRadius.r,
          ),
          onTap: () {
            onSelectedProperty(property);
          },
          child: Padding(
            padding: EdgeInsets.only(
              left: Dimensions.viewAllPropertyItemContentPaddings.w,
              top: Dimensions.viewAllPropertyItemContentPaddings.w,
              bottom: Dimensions.viewAllPropertyItemContentPaddings.w,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Stack(
                          children: [
                            Container(
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
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    Dimensions.propertyItemBorderRadius.r,
                                  ),
                                ), //
                                child: ImageLoader(
                                  image: (property.photos != null &&
                                          property.photos!.isNotEmpty)
                                      ? property.photos!.first
                                      : '',
                                  heroTag: isMapItem
                                      ? 'map${property.id}'
                                      : '${property.id}',
                                  propertyTypeId: property.propertyTypeId,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: Dimensions
                                    .homePropertyItemImageShadowHeight.h,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black.withOpacity(0.6),
                                      Colors.black.withOpacity(0),
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(
                                      Dimensions.propertyItemBorderRadius.r,
                                    ),
                                    bottomRight: Radius.circular(
                                      Dimensions.propertyItemBorderRadius.r,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (StaticFunctions.isActiveInactiveStatusTagNeedToShow(
                          property.propertySoldStatusId,
                          property.propertyStatusId,
                        ))
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Padding(
                              padding: EdgeInsets.all(
                                Dimensions.propertyItemPreviewContentsSpacing.h,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    Dimensions
                                        .propertyItemPropertyStatusRadius.r,
                                  ),
                                  color: StaticFunctions.getColor(
                                    context,
                                    ColorEnum.darkBgOpacityColor,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: Dimensions
                                      .propertyItemPropertyStatusPaddingVertical
                                      .h,
                                  horizontal: Dimensions
                                      .propertyItemPropertyStatusPaddingHorizontal
                                      .h,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: Dimensions
                                          .propertyItemPropertyStatusMarkSize.h,
                                      height: Dimensions
                                          .propertyItemPropertyStatusMarkSize.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: StaticFunctions.getColor(
                                          context,
                                          property.propertyStatusId ==
                                                  SaveDefaultData.activeStatusId
                                              ? ColorEnum.greenColor
                                              : ColorEnum.grayAEColor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: Dimensions
                                          .propertyItemPropertyStatusPaddingVertical
                                          .h,
                                    ),
                                    Text(
                                      property.propertyStatusValue,
                                      style: propertyItemsPreviewContentsStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Padding(
                            padding: EdgeInsets.all(
                              Dimensions.propertyItemPreviewContentsSpacing.h,
                            ),
                            child: Text(
                              localizationsContext.propertyAddedAt(
                                  '${StaticFunctions.changeDateFormat(
                                property.addedAt,
                                AppConfig.propertyAddedAtDateFormat,
                              )}'),
                              style: propertyItemsPreviewContentsStyle.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: Dimensions
                                    .propertyItemPropertyContentTextSize9Px.sp,
                              ),
                            ),
                          ),
                        ),
                        if (StaticFunctions.needToShowLivePropertyIndication(
                          property,
                        ))
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions
                                    .propertyItemPreviewContentsSpacing.h,
                                vertical: Dimensions
                                    .propertyItemLivePropertyContentsTopSpacing
                                    .h,
                              ),
                              child: Lottie.asset(
                                Strings.livePropertyAnimation,
                                width:
                                    Dimensions.livePropertySmallAnimationSize.w,
                                height:
                                    Dimensions.livePropertySmallAnimationSize.w,
                              ),
                            ),
                          ),
                        if (property.isFavorite)
                          Positioned(
                            top: Dimensions.favoriteIconAroundPadding.h,
                            left: Dimensions.favoriteIconAroundPadding.w,
                            child: SvgPicture.asset(
                              Strings.iconDrawerFavorite,
                              height: Dimensions.favoriteIconSize.h,
                              width: Dimensions.favoriteIconSize.h,
                            ),
                          ),
                      ],
                    ),
                    Expanded(
                      child: PropertyContent(
                        localizationsContext: localizationsContext,
                        sharedByBrooon: false,
                        property: property,
                        viewAllFromType: viewAllFromType,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: Dimensions.viewAllPropertyItemContentPaddings.w,
                    top: Dimensions.viewAllPropertyItemContentPaddings.w,
                  ),
                  child: PropertyActions(
                    localizationsContext: localizationsContext,
                    property: property,
                    isFromHome: false,
                    onMatchingClicked: () {
                      if (onMatchingClicked != null) {
                        onMatchingClicked!();
                      }
                    },
                    actionBgColor: isMapItem
                        ? ColorEnum.themeColorOpacity3Percentage
                        : ColorEnum.whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
