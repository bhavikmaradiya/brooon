import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../const/dimen_const.dart';
import '../../../const/string_const.dart';
import '../../../localdb/subscription/db_subscription_plan.dart';
import '../../../utils/app_config.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';
import '../../../widgets/light_divider.dart';

class CurrentPlanItem extends StatelessWidget {
  final AppLocalizations localizationsContext;
  final DbSubscriptionPlan currentPlan;

  const CurrentPlanItem({
    Key? key,
    required this.localizationsContext,
    required this.currentPlan,
  }) : super(key: key);

  BoxDecoration _durationBorderDecoration(BuildContext context) {
    return BoxDecoration(
      color: StaticFunctions.getColor(
        context,
        ColorEnum.whiteColor,
      ),
      borderRadius: BorderRadius.circular(
        Dimensions.subscriptionScreenPurchaseHistoryBorderRadius.r,
      ),
      border: Border.all(
        color: StaticFunctions.getColor(
          context,
          ColorEnum.borderColorE0,
        ),
        width: Dimensions.subscriptionScreenPurchaseHistoryBorderWidth.w,
      ),
    );
  }

  BoxDecoration _containerBoxDecoration(BuildContext context) {
    return BoxDecoration(
      color: StaticFunctions.getColor(
        context,
        ColorEnum.blueColorOpacity2Percentage,
      ),
      borderRadius: BorderRadius.circular(
        Dimensions.subscriptionScreenPurchaseHistoryBorderRadius.r,
      ),
      border: Border.all(
        color: StaticFunctions.getColor(
          context,
          ColorEnum.borderColorE0,
        ),
        width: Dimensions.subscriptionScreenPurchaseHistoryBorderWidth.w,
      ),
    );
  }

  Widget _planDurationView(
    BuildContext context,
    DbSubscriptionPlan detail,
  ) {
    return Container(
      decoration: _durationBorderDecoration(context),
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.subscriptionScreenPurchaseHistoryPadding.w,
            vertical: Dimensions.subscriptionScreenPurchaseHistoryPadding.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                detail.price ?? '',
                style: TextStyle(
                  color: StaticFunctions.getColor(
                    context,
                    detail.isSelected
                        ? ColorEnum.themeColor
                        : ColorEnum.blueColor,
                  ),
                  fontWeight: FontWeight.w600,
                  fontSize: Dimensions.subscriptionScreenPlanPriceTextSize.sp,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    top: Dimensions.subscriptionDurationFontMarginTop.h,
                  ),
                  child: Text(
                    detail.type == AppConfig.freeTrialPlanType
                        ? localizationsContext.subscriptionFreeDuration(
                            detail.duration?.toLowerCase() ?? '',
                          )
                        : localizationsContext.subscriptionPriceDuration(
                            detail.duration?.toLowerCase() ?? '',
                          ),
                    style: TextStyle(
                      color: StaticFunctions.getColor(
                        context,
                        detail.isSelected
                            ? ColorEnum.themeColor
                            : ColorEnum.blueColor,
                      ),
                      fontSize:
                          Dimensions.subscriptionScreenPlanDurationTextSize.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _planDetailView(List<DbSubscriptionPlan> plans) {
    return ListView.builder(
      itemCount: plans.length,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, itemIndex) {
        final planDetail = plans[itemIndex];
        final descriptionContentTextStyle = TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: Dimensions.subscriptionScreenPlanContentTextSize.sp,
          color: StaticFunctions.getColor(
            context,
            ColorEnum.blackColor,
          ),
        );
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.screenHorizontalMargin.w,
          ),
          child: Container(
            decoration: _containerBoxDecoration(context),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(
                    Dimensions.subscriptionScreenPlanPadding.w,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            planDetail.title ?? '',
                            style: TextStyle(
                              color: StaticFunctions.getColor(
                                context,
                                ColorEnum.blueColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w600,
                              fontSize: Dimensions
                                  .subscriptionScreenPlanNameSize.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions
                            .subscriptionScreenPlanAndContentBetweenSpace.h,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: planDetail.description?.length ?? 0,
                        itemBuilder: (context, descriptionIndex) {
                          final description =
                              planDetail.description?[descriptionIndex] ??
                                  '';
                          return Container(
                            margin: EdgeInsets.symmetric(
                              vertical: Dimensions
                                  .subscriptionScreenPlanContentBetweenSpace
                                  .h,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  Strings.iconPlanCheck,
                                  width: Dimensions
                                      .subscriptionScreenContentCheckSize.w,
                                  height: Dimensions
                                      .subscriptionScreenContentCheckSize.w,
                                ),
                                SizedBox(
                                  width: Dimensions
                                      .subscriptionScreenPlanContentBulletBetweenSpace
                                      .w,
                                ),
                                Expanded(
                                  child: Text(
                                    description,
                                    maxLines: 1,
                                    style: descriptionContentTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: Dimensions
                            .subscriptionScreenPlanDurationTopMargin.h,
                      ),
                      _planDurationView(
                        context,
                        planDetail,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: Dimensions.activePlanBadgeMarginTop.h,
                  right: 0,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        Strings.activePlanBg,
                        width: Dimensions.activePlanBadgeWidth.w,
                        height: Dimensions.activePlanBadgeHeight.h,
                        color: !planDetail.isExpired
                            ? StaticFunctions.getColor(
                          context,
                          ColorEnum.greenColor,
                        )
                            : StaticFunctions.getColor(
                          context,
                          ColorEnum.redColor,
                        ),
                      ),
                      Text(
                        !planDetail.isExpired
                            ? localizationsContext.currentActivePlan
                            : localizationsContext.expiredPlan,
                        style: TextStyle(
                          color: StaticFunctions.getColor(
                            context,
                            ColorEnum.whiteColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w700,
                          fontSize: Dimensions.activePlanTextSize.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<DbSubscriptionPlan> list = [];
    list.add(currentPlan);
    return _planDetailView(list);
  }
}
