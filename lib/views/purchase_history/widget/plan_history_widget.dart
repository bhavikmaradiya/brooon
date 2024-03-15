import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../const/dimen_const.dart';
import '../../../localdb/subscription/db_plan_history.dart';
import '../../../utils/app_config.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';
import '../../../widgets/light_divider.dart';

class PlanHistoryWidget extends StatelessWidget {
  final DbPlanHistory plan;

  PlanHistoryWidget({
    Key? key,
    required this.plan,
  }) : super(key: key);

  BoxDecoration _historyPlanContainerBoxDecoration(BuildContext context) {
    return BoxDecoration(
      color: StaticFunctions.getColor(
        context,
        plan.isActive
            ? ColorEnum.whiteColor
            : ColorEnum.blueColorOpacity2Percentage,
      ),
      borderRadius: BorderRadius.circular(
        Dimensions.purchaseHistoryPlanStatusBoxRadius.r,
      ),
      border: Border.all(
        color: plan.isActive
            ? StaticFunctions.getColor(
                context,
                ColorEnum.greenColor,
              )
            : StaticFunctions.getColor(
                context,
                ColorEnum.borderColorE0,
              ),
        width: Dimensions.purchaseHistoryActivePlanBorderWidth.w,
      ),
    );
  }

  Widget _transactionInfoWidget(
    BuildContext context,
    String title,
    String value,
  ) {
    if (value.trim().isEmpty) {
      return const SizedBox();
    }
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.purchaseHistoryActivePlanInnerPadding.w,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: Dimensions.purchaseHistoryPlanPaymentDetailsTextSize.sp,
              color: StaticFunctions.getColor(
                context,
                ColorEnum.blackColor,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize:
                    Dimensions.purchaseHistoryPlanPaymentDetailsTextSize.sp,
                fontWeight: FontWeight.w600,
                color: StaticFunctions.getColor(
                  context,
                  ColorEnum.blackColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizationsContext = AppLocalizations.of(context)!;
    final purchasedOnDateFormat =
        DateFormat(AppConfig.historyPurchasedOnDateFormat);
    final purchasedOnDateTime =
        DateTime.fromMillisecondsSinceEpoch(plan.purchasedOn);
    final purchasedOn = purchasedOnDateFormat.format(purchasedOnDateTime);
    final startEndDateFormat = DateFormat(AppConfig.historyStartEndDateFormat);
    final startDateTime = DateTime.fromMillisecondsSinceEpoch(plan.startDate);
    final startDate = startEndDateFormat.format(startDateTime);
    final endDateTime = DateTime.fromMillisecondsSinceEpoch(plan.endDate);
    final endDate = startEndDateFormat.format(endDateTime);
    return Container(
      color: StaticFunctions.getColor(
        context,
        plan.isActive
            ? ColorEnum.stickyHeaderBlueBgColor
            : ColorEnum.whiteColor,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.purchaseHistoryActivePlanInnerPadding.h,
        ),
        margin: EdgeInsets.only(
          left: Dimensions.screenHorizontalMargin.w,
          right: Dimensions.screenHorizontalMargin.w,
          bottom: Dimensions.purchaseHistoryItemMargin.h,
        ),
        decoration: _historyPlanContainerBoxDecoration(context),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimensions
                              .purchaseHistoryActivePlanInnerPadding.w,
                        ),
                        child: Text(
                          plan.planName,
                          style: TextStyle(
                            fontSize:
                                Dimensions.purchaseHistoryPlanNameTextSize.sp,
                            fontWeight: FontWeight.w500,
                            color: StaticFunctions.getColor(
                              context,
                              ColorEnum.blueColor,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimensions
                              .purchaseHistoryActivePlanInnerPadding.w,
                        ),
                        child: Row(
                          children: [
                            Text(
                              '${plan.price}',
                              style: TextStyle(
                                fontSize: Dimensions
                                    .purchaseHistoryPlanPriceTextSize.sp,
                                fontWeight: FontWeight.w600,
                                color: StaticFunctions.getColor(
                                  context,
                                  ColorEnum.themeColor,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: Dimensions
                                    .purchaseHistoryDurationItemTopMargin.h,
                              ),
                              child: Text(
                                localizationsContext.subscriptionPriceDuration(
                                  plan.duration.toLowerCase(),
                                ),
                                style: TextStyle(
                                  fontSize: Dimensions
                                      .purchaseHistoryPlanPerDurationTextSize
                                      .sp,
                                  color: StaticFunctions.getColor(
                                    context,
                                    ColorEnum.themeColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height:
                            Dimensions.purchaseHistoryPlanDividerBetweenSpace.h,
                      ),
                      LightDivider(),
                      SizedBox(
                        height:
                            Dimensions.purchaseHistoryPlanDividerBetweenSpace.h,
                      ),
                      if (plan.planName.toLowerCase() !=
                          AppConfig.freeTrialPlanType.toLowerCase())
                        _transactionInfoWidget(
                          context,
                          localizationsContext.paymentMode,
                          plan.paymentMode,
                        ),
                      if (plan.planName.toLowerCase() !=
                          AppConfig.freeTrialPlanType.toLowerCase())
                        _transactionInfoWidget(
                          context,
                          localizationsContext.transactionId,
                          plan.transactionId,
                        ),
                      if (plan.planName.toLowerCase() !=
                          AppConfig.freeTrialPlanType.toLowerCase())
                        _transactionInfoWidget(
                          context,
                          localizationsContext.purchasedOn,
                          purchasedOn,
                        ),
                      _transactionInfoWidget(
                        context,
                        localizationsContext.startDate,
                        startDate,
                      ),
                      _transactionInfoWidget(
                        context,
                        localizationsContext.endDate,
                        endDate,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 15,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions
                      .purchaseHistoryPlanStatusBoxInnerHorizontalPadding.w,
                  vertical: Dimensions
                      .purchaseHistoryPlanStatusBoxInnerVerticalPadding.h,
                ),
                decoration: BoxDecoration(
                  color: StaticFunctions.getColor(
                    context,
                    plan.isActive ? ColorEnum.greenColor : ColorEnum.redColor,
                  ),
                  borderRadius: BorderRadius.circular(
                    Dimensions.purchaseHistoryPlanStatusBoxRadius.r,
                  ),
                ),
                child: Text(
                  (plan.isActive
                          ? localizationsContext.currentActivePlan
                          : localizationsContext.expiredPlan)
                      .toUpperCase(),
                  style: TextStyle(
                    color: StaticFunctions.getColor(
                      context,
                      ColorEnum.whiteColor,
                    ),
                    fontWeight: FontWeight.w700,
                    fontSize: Dimensions.purchaseHistoryPlanStatusTextSize.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
