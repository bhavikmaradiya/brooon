import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import './model/view_all_screen_arg.dart';
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
import '../../widgets/inquiry_helpers/inquiry_content.dart';

class ViewAllInquiryItem extends StatelessWidget {
  final AppLocalizations localizationsContext;
  final DbSavedFilter inquiry;
  final CommonPropertyDataProvider commonPropertyDataProvider;
  final ViewAllFromType viewAllFromType;
  final bool isLastIndex;
  final Function()? onMatchingClicked;
  final Function(DbSavedFilter) onSelectedInquiry;

  ViewAllInquiryItem({
    required this.localizationsContext,
    required this.inquiry,
    required this.onMatchingClicked,
    required this.onSelectedInquiry,
    required this.commonPropertyDataProvider,
    required this.viewAllFromType,
    required this.isLastIndex,
  });

  @override
  Widget build(BuildContext context) {
    final inquiryItemsPreviewContentsStyle = TextStyle(
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
            onSelectedInquiry(inquiry);
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
                                  image: null,
                                  isItInquiry: true,
                                  shouldApplyColor: false,
                                  heroTag: 'Inquiry${inquiry.id}',
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
                                      style: inquiryItemsPreviewContentsStyle,
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
                              style: inquiryItemsPreviewContentsStyle.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: Dimensions
                                    .propertyItemPropertyContentTextSize9Px.sp,
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
                    Expanded(
                      child: InquiryContent(
                        localizationsContext: localizationsContext,
                        inquiry: inquiry,
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
                  child: InquiryActions(
                    localizationsContext: localizationsContext,
                    inquiry: inquiry,
                    isFromHome: false,
                    onMatchingClicked: (){
                      if (onMatchingClicked != null) {
                        onMatchingClicked!();
                      }
                    },
                    actionBgColor: ColorEnum.whiteColor,
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
