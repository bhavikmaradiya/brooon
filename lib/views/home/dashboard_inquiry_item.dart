import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import './widget/shared_by_brooon_locked.dart';
import '../../../const/dimen_const.dart';
import '../../common_property_data_provider.dart';
import '../../const/string_const.dart';
import '../../localdb/properties/db_saved_filter.dart';
import '../../localdb/save_default_data.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../widgets/image_loader.dart';
import '../../widgets/inquiry_helpers/inquiry_actions.dart';
import '../../widgets/inquiry_helpers/inquiry_brooon_info.dart';
import '../../widgets/inquiry_helpers/inquiry_content.dart';
import '../../widgets/measure_size_widget.dart';

class DashBoardInquiryItem extends StatelessWidget {
  final AppLocalizations localizationsContext;
  final DbSavedFilter inquiry;
  final Function(DbSavedFilter) onInquirySelected;
  final bool isItFirst;
  final CommonPropertyDataProvider commonPropertyDataProvider;
  final bool sharedByBrooon;
  final bool isNearByInquiry;
  final Function? onLockItemClicked;

  DashBoardInquiryItem({
    required this.localizationsContext,
    required this.isItFirst,
    required this.inquiry,
    required this.onInquirySelected,
    required this.commonPropertyDataProvider,
    this.sharedByBrooon = false,
    this.isNearByInquiry = false,
    this.onLockItemClicked,
  });

  Widget _inquiryItem(
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
          onInquirySelected(inquiry);
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
                                image: null,
                                shouldApplyColor: false,
                                heroTag: sharedByBrooon
                                    ? '${Strings.brooonHeroTagInquiry}${inquiry.id}'
                                    : isNearByInquiry
                                        ? '${Strings.nearByHeroTagInquiry}${inquiry.id}'
                                        : '${Strings.inquiryHeroTag}${inquiry.id}',
                                isItInquiry: true,
                                propertyTypeId: inquiry.propertyType!.first,
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
                        inquiry.inquirySoldStatusId,
                        inquiry.inquiryStatusId,
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
                                        inquiry.inquiryStatusId ==
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
                                    inquiry.inquiryStatusValue ?? '',
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
                              inquiry.addedAt,
                              AppConfig.propertyAddedAtDateFormat,
                            )}'),
                            style: propertyItemsPreviewContentsStyle.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      if (StaticFunctions.needToShowLiveInquiryIndication(
                          inquiry))
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
                      if (inquiry.isFavorite)
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
              InquiryContent(
                localizationsContext: localizationsContext,
                inquiry: inquiry,
                sharedByBrooon: sharedByBrooon,
              ),
              if (!sharedByBrooon)
                Padding(
                  padding: EdgeInsets.only(
                    top: Dimensions.propertyItemCallShareContentPadding.h,
                    left: Dimensions.homePropertyItemPadding.w,
                    right: Dimensions.homePropertyItemPadding.w,
                  ),
                  child: InquiryActions(
                    localizationsContext: localizationsContext,
                    inquiry: inquiry,
                    isFromHome: true,
                    actionBgColor: ColorEnum.themeColorOpacity3Percentage,
                  ),
                ),
              if (sharedByBrooon)
                InquiryBrooonInfo(
                  localizationsContext: localizationsContext,
                  inquiry: inquiry,
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
                    commonPropertyDataProvider
                        .updateSharedByBrooonItemSize(size);
                  },
                  child: _inquiryItem(
                    context,
                    propertyItemsPreviewContentsStyle,
                  ),
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
          : _inquiryItem(
              context,
              propertyItemsPreviewContentsStyle,
            ),
    );
  }
}
