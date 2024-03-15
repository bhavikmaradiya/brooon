import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import './widget/shared_by_brooon_locked.dart';
import '../../../const/dimen_const.dart';
import '../../common_property_data_provider.dart';
import '../../const/string_const.dart';
import '../../localdb/properties/db_property.dart';
import '../../localdb/save_default_data.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../widgets/image_loader.dart';
import '../../widgets/measure_size_widget.dart';
import '../../widgets/property_helpers/property_actions.dart';
import '../../widgets/property_helpers/property_brooon_info.dart';
import '../../widgets/property_helpers/property_content.dart';

class DashBoardPropertyItem extends StatelessWidget {
  final AppLocalizations localizationsContext;
  final DbProperty property;
  final Function(DbProperty) onPropertySelected;
  final bool isItFirst;
  final CommonPropertyDataProvider commonPropertyDataProvider;
  final bool sharedByBrooon;
  final bool isNearByProperty;
  final Function? onLockItemClicked;

  DashBoardPropertyItem({
    required this.localizationsContext,
    required this.isItFirst,
    required this.property,
    required this.onPropertySelected,
    required this.commonPropertyDataProvider,
    this.sharedByBrooon = false,
    this.isNearByProperty = false,
    this.onLockItemClicked,
  });

  Widget _propertyItem(
    BuildContext context,
    TextStyle propertyItemsPreviewContentsStyle,
  ) {
    return Material(
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
          onPropertySelected(property);
        },
        child: Padding(
          padding: EdgeInsets.only(
            top: Dimensions.homePropertyItemPadding.w,
            bottom: Dimensions.homePropertyItemPadding.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!sharedByBrooon)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.homePropertyItemPadding.w,
                  ),
                  child: Stack(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: Dimensions.homePropertyItemImageHeight.h,
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
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  Dimensions.propertyItemBorderRadius.r,
                                ),
                              ),
                              child: ImageLoader(
                                image: (property.photos != null &&
                                        property.photos!.isNotEmpty)
                                    ? property.photos!.first
                                    : '',
                                heroTag: sharedByBrooon
                                    ? '${Strings.brooonHeroTag}${property.id}'
                                    : isNearByProperty
                                        ? '${Strings.nearByHeroTag}${property.id}'
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
                                  Dimensions.propertyItemPropertyStatusRadius.r,
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
                            ),
                          ),
                        ),
                      ),
                      if (StaticFunctions.needToShowLivePropertyIndication(
                          property))
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions
                                  .propertyItemPreviewContentsSpacing.h,
                              vertical: Dimensions
                                  .propertyItemLivePropertyContentsTopSpacing.h,
                            ),
                            child: Lottie.asset(
                              Strings.livePropertyAnimation,
                              width: Dimensions.livePropertyAnimationSize.w,
                              height: Dimensions.livePropertyAnimationSize.w,
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
                ),
              if (!sharedByBrooon)
                SizedBox(
                  height: Dimensions.homePropertyItemContentPaddingTop.h,
                ),
              PropertyContent(
                localizationsContext: localizationsContext,
                property: property,
                sharedByBrooon: sharedByBrooon,
              ),
              if (!sharedByBrooon)
                Padding(
                  padding: EdgeInsets.only(
                    top: Dimensions.propertyItemCallShareContentPadding.h,
                    left: Dimensions.homePropertyItemPadding.w,
                    right: Dimensions.homePropertyItemPadding.w,
                  ),
                  child: PropertyActions(
                    localizationsContext: localizationsContext,
                    property: property,
                    isFromHome: true,
                    actionBgColor: ColorEnum.themeColorOpacity3Percentage,
                  ),
                ),
              if (sharedByBrooon)
                PropertyBrooonInfo(
                  localizationsContext: localizationsContext,
                  property: property,
                ),
            ],
          ),
        ),
      ),
    );
  }

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
      width: Dimensions.homePropertyItemWidth.w,
      margin: EdgeInsets.only(
        left: (isItFirst ? Dimensions.screenHorizontalMargin.w : 0),
        right: Dimensions.screenHorizontalMargin.w,
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
          sharedByBrooon
              ? ColorEnum.blueColorOpacity3Percentage
              : ColorEnum.whiteColor,
        ),
      ),
      padding: EdgeInsets.all(
        Dimensions.propertyItemBorderWidth.w,
      ),
      child: sharedByBrooon
          ? Stack(
              children: [
                MeasureSize(
                  onChange: (size) {
                    commonPropertyDataProvider.updateSharedByBrooonItemSize(
                      size,
                    );
                  },
                  child:
                      _propertyItem(context, propertyItemsPreviewContentsStyle),
                ),
                SharedByBrooonLocked(
                  onLockItemClicked: () {
                    if (onLockItemClicked != null) {
                      onLockItemClicked!();
                    }
                  },
                ),
              ],
            )
          : _propertyItem(
              context,
              propertyItemsPreviewContentsStyle,
            ),
    );
  }
}
