import 'package:collection/collection.dart';
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
import '../subscription_provider.dart';

class SubscriptionPlans extends StatelessWidget {
  final AppLocalizations localizationsContext;
  final SubscriptionProvider? subscriptionProvider;
  final List<DbSubscriptionPlan> planList;

  const SubscriptionPlans({
    Key? key,
    required this.localizationsContext,
    required this.subscriptionProvider,
    required this.planList,
  }) : super(key: key);

  BoxDecoration _durationBorderDecoration(
    BuildContext context,
    bool isSelected,
  ) {
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
          isSelected ? ColorEnum.themeColor : ColorEnum.borderColorE0,
        ),
        width: isSelected
            ? Dimensions.subscriptionScreenSelectedPlanBorderWidth.w
            : Dimensions.subscriptionScreenPurchaseHistoryBorderWidth.w,
      ),
    );
  }

  BoxDecoration _containerBoxDecoration(
    BuildContext context,
    bool isSelected,
  ) {
    return BoxDecoration(
      color: StaticFunctions.getColor(
        context,
        isSelected
            ? ColorEnum.themeColorOpacity3Percentage
            : ColorEnum.blueColorOpacity2Percentage,
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
    double? topMargin,
  ) {
    return Container(
      decoration: _durationBorderDecoration(
        context,
        detail.isSelected,
      ),
      margin: topMargin == null
          ? null
          : EdgeInsets.only(
              top: topMargin,
            ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            subscriptionProvider?.updateSelectedPlan(detail.planId ?? '');
          },
          borderRadius: BorderRadius.circular(
            Dimensions.subscriptionScreenPurchaseHistoryBorderRadius.r,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.subscriptionScreenPurchaseHistoryPadding.w,
              vertical: Dimensions.subscriptionScreenPurchaseHistoryPadding.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  detail.isSelected
                      ? Strings.iconRadioChecked
                      : Strings.iconRadioUnChecked,
                  width: Dimensions.subscriptionScreenRadioBtnSize.w,
                  height: Dimensions.subscriptionScreenRadioBtnSize.w,
                ),
                SizedBox(
                  width: Dimensions.subscriptionScreenPlanRadioBtnSpace.w,
                ),
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
                        fontSize: Dimensions
                            .subscriptionScreenPlanDurationTextSize.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _planDetailView(List<List<DbSubscriptionPlan>> plans) {
    return ListView.builder(
      itemCount: plans.length,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, itemIndex) {
        final planDetail = plans[itemIndex][0];
        final descriptionContentTextStyle = TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: Dimensions.subscriptionScreenPlanContentTextSize.sp,
          color: StaticFunctions.getColor(
            context,
            ColorEnum.blackColor,
          ),
        );
        bool isAnyPlanSelected = plans[itemIndex]
                .firstWhereOrNull(
                  (element) => element.isSelected,
                )
                ?.isSelected ??
            false;
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.screenHorizontalMargin.w,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: _containerBoxDecoration(
                  context,
                  isAnyPlanSelected,
                ),
                padding: EdgeInsets.all(
                  Dimensions.subscriptionScreenPlanPadding.w,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      planDetail.title ?? '',
                      style: TextStyle(
                        color: StaticFunctions.getColor(
                          context,
                          isAnyPlanSelected
                              ? ColorEnum.themeColor
                              : ColorEnum.blackColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w600,
                        fontSize: Dimensions.subscriptionScreenPlanNameSize.sp,
                      ),
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
                            planDetail.description?[descriptionIndex] ?? '';
                        return Container(
                          margin: EdgeInsets.symmetric(
                            vertical: Dimensions
                                .subscriptionScreenPlanContentBetweenSpace.h,
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
                      height:
                          Dimensions.subscriptionScreenPlanDurationTopMargin.h,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: plans[itemIndex].length,
                      itemBuilder: (_, priceDurationIndex) {
                        return _planDurationView(
                          context,
                          plans[itemIndex][priceDurationIndex],
                          priceDurationIndex != 0
                              ? Dimensions
                                  .subscriptionScreenDurationItemTopMargin.h
                              : null,
                        );
                      },
                    ),
                  ],
                ),
              ),
              if (planDetail.type == AppConfig.freeTrialPlanType)
                SizedBox(
                  height: Dimensions.subscriptionScreenPlanDividerSpacing.h,
                ),
              if (planDetail.type == AppConfig.freeTrialPlanType)
                LightDivider(),
              if (planDetail.type == AppConfig.freeTrialPlanType)
                SizedBox(
                  height: Dimensions.subscriptionScreenPlanDividerSpacing.h,
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<List<DbSubscriptionPlan>> plans = [];
    final freePlan = planList.firstWhereOrNull(
      (element) => element.type == AppConfig.freeTrialPlanType,
    );
    if (freePlan != null) {
      plans.add([freePlan]);
    }
    final premiumPlan = planList.where(
      (element) => element.type != AppConfig.freeTrialPlanType,
    );
    if (premiumPlan.isNotEmpty) {
      plans.add(premiumPlan.toList());
    }
    return plans.isNotEmpty ? _planDetailView(plans) : const SizedBox();
  }
}
