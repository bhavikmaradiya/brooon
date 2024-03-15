import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import './widget/subscription_plans.dart';
import '../../common_property_data_provider.dart';
import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../localdb/subscription/db_subscription_plan.dart';
import '../../utils/app_config.dart';
import '../../utils/choose_plan_from_enum.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../views/subscription/subscription_provider.dart';
import '../../widgets/no_internet_view/no_internet_view.dart';
import '../../widgets/toolbar.dart';

class Subscription extends StatelessWidget {
  const Subscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ChoosePlanFrom?;
    return ChangeNotifierProvider(
      create: (_) => SubscriptionProvider(),
      builder: (_, __) => _SubscriptionBody(
        arguments: arguments ?? ChoosePlanFrom.splash,
      ),
    );
  }
}

class _SubscriptionBody extends StatefulWidget {
  final ChoosePlanFrom arguments;

  _SubscriptionBody({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  @override
  State<_SubscriptionBody> createState() => _SubscriptionBodyState();
}

class _SubscriptionBodyState extends State<_SubscriptionBody> {
  SubscriptionProvider? _subscriptionProvider;
  CommonPropertyDataProvider? _commonDataProvider;
  late AppLocalizations _localizationsContext;

  @override
  void didChangeDependencies() {
    _localizationsContext = AppLocalizations.of(context)!;
    if (_commonDataProvider == null) {
      _commonDataProvider = Provider.of<CommonPropertyDataProvider>(
        context,
        listen: false,
      );
    }
    if (_subscriptionProvider == null) {
      _subscriptionProvider = Provider.of<SubscriptionProvider>(
        context,
        listen: false,
      );
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) {
          _subscriptionProvider!.init(
            widget.arguments,
            context,
            _localizationsContext,
            _commonDataProvider,
          );
        },
      );
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _subscriptionProvider?.disposeSubscription();
    super.dispose();
  }

  bool isMandatoryToChoosePlan() {
    return (widget.arguments == ChoosePlanFrom.splash ||
        widget.arguments == ChoosePlanFrom.forceSubscription);
  }

  Widget _subscribeButton() {
    final textStyle = TextStyle(
      fontSize: Dimensions.subscriptionButtonPriceFontSize.sp,
      fontWeight: FontWeight.w700,
      color: StaticFunctions.getColor(
        context,
        ColorEnum.whiteColor,
      ),
    );
    return Selector<SubscriptionProvider,
        Tuple2<List<DbSubscriptionPlan>, bool>>(
      selector: (_, state) => Tuple2(
        state.plansList,
        state.isFetchingPlans,
      ),
      shouldRebuild: (_, __) => true,
      builder: (context, tuple, child) {
        if (tuple.item1.isEmpty) {
          if (tuple.item2) {
            return const SizedBox();
          }
          return const SizedBox();
        }
        final selectedPlan =
            tuple.item1.firstWhere((element) => element.isSelected);
        final radius = Dimensions.buttonBorderRadius.r;
        return Container(
          height: Dimensions.buttonHeight.h,
          margin: EdgeInsets.symmetric(
            horizontal: Dimensions.screenHorizontalMargin.w,
            vertical: Dimensions.screenVerticalMarginBottom.h,
          ),
          decoration: BoxDecoration(
            color: StaticFunctions.getColor(
              context,
              ColorEnum.themeColor,
            ),
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(radius),
              splashColor: StaticFunctions.getColor(
                context,
                ColorEnum.touchSplashColor,
              ),
              onTap: () {
                _subscriptionProvider?.purchasePlan();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Selector<SubscriptionProvider, bool>(
                    selector: (_, state) => state.isUpgradeRequired,
                    builder: (
                      context,
                      isUpgradeRequired,
                      child,
                    ) {
                      return Text(
                        isUpgradeRequired
                            ? _localizationsContext.upgradePlanNow(
                                selectedPlan.price ?? '',
                              )
                            : _localizationsContext.subscribeNowWithPrice(
                                selectedPlan.price ?? '',
                              ),
                        style: textStyle,
                      );
                    },
                  ),
                  Text(
                    selectedPlan.type == AppConfig.freeTrialPlanType
                        ? _localizationsContext.subscriptionFreeDuration(
                            selectedPlan.duration?.toLowerCase() ?? '',
                          )
                        : _localizationsContext.subscriptionPriceDuration(
                            selectedPlan.duration?.toLowerCase() ?? '',
                          ),
                    style: textStyle.copyWith(
                      fontSize:
                          Dimensions.subscriptionButtonDurationFontSize.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeConfig.appBar(context),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () => Future.value(!isMandatoryToChoosePlan()),
          child: Column(
            children: [
              ToolBar(
                title: widget.arguments == ChoosePlanFrom.splash
                    ? _localizationsContext.chooseYourPlan
                    : _localizationsContext.subscription,
                enableBack: !isMandatoryToChoosePlan(),
                centerTitle: isMandatoryToChoosePlan(),
                endText: isMandatoryToChoosePlan()
                    ? ''
                    : _localizationsContext.btnPurchaseHistory,
                onEndTextClick: isMandatoryToChoosePlan()
                    ? null
                    : () {
                        _subscriptionProvider?.viewPurchaseHistory();
                      },
              ),
              Selector<SubscriptionProvider, bool>(
                shouldRebuild: (prev, next) => prev != next,
                selector: (_, state) => state.isNetworkAvailable,
                builder: (context, isNetwork, child) {
                  return isNetwork
                      ? Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: Dimensions
                                  .subscriptionPremiumCrownContainerTopSpacing
                                  .h,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: Dimensions
                                              .subscriptionPremiumCrownContainerSize
                                              .w,
                                          height: Dimensions
                                              .subscriptionPremiumCrownContainerSize
                                              .w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              Dimensions
                                                  .subscriptionPremiumCrownContainerRadius
                                                  .r,
                                            ),
                                            color: StaticFunctions.getColor(
                                              context,
                                              ColorEnum
                                                  .blueColorOpacity5Percentage,
                                            ),
                                          ),
                                          child: Center(
                                            child: SvgPicture.asset(
                                              Strings.iconPremiumCrown,
                                              width: Dimensions
                                                  .subscriptionPremiumCrownIconWidth
                                                  .w,
                                              height: Dimensions
                                                  .subscriptionPremiumCrownIconHeight
                                                  .h,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: Dimensions
                                              .subscriptionScreenPremiumIconTextSpacing
                                              .h,
                                        ),
                                        Selector<SubscriptionProvider, bool>(
                                          selector: (_, state) =>
                                              state.isUpgradeRequired,
                                          builder: (
                                            context,
                                            isUpgradeRequired,
                                            child,
                                          ) {
                                            return Text(
                                              isUpgradeRequired
                                                  ? _localizationsContext
                                                      .upgradeToPremium
                                                  : _localizationsContext
                                                      .plansAndPricing,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: StaticFunctions.getColor(
                                                  context,
                                                  ColorEnum.themeColor,
                                                ),
                                                fontSize: Dimensions
                                                    .subscriptionScreenTitleSize
                                                    .sp,
                                              ),
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          height: Dimensions
                                              .subscriptionScreenTopTextsBetweenSpace
                                              .h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: Dimensions
                                                .screenHorizontalMargin.w,
                                          ),
                                          child: Text(
                                            _localizationsContext.explorePlans,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: StaticFunctions.getColor(
                                                context,
                                                ColorEnum.blackColor,
                                              ),
                                              fontSize: Dimensions
                                                  .subscriptionScreenSubtitleSize
                                                  .sp,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: Dimensions
                                              .subscriptionScreenTitleContentBetweenSpace
                                              .h,
                                        ),
                                        Selector<SubscriptionProvider,
                                            List<DbSubscriptionPlan>>(
                                          shouldRebuild: (prev, next) => true,
                                          selector: (_, state) =>
                                              state.plansList,
                                          builder: (context, planList, child) {
                                            final list = planList;
                                            if (StaticFunctions.userInfo
                                                    ?.subscribedPlanId !=
                                                null) {
                                              list.removeWhere(
                                                (element) =>
                                                    element.type ==
                                                    AppConfig.freeTrialPlanType,
                                              );
                                            }
                                            return SubscriptionPlans(
                                              localizationsContext:
                                                  _localizationsContext,
                                              subscriptionProvider:
                                                  _subscriptionProvider,
                                              planList: list,
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          height: Dimensions
                                              .subscriptionScreenTitleContentBetweenSpace
                                              .h,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                _subscribeButton(),
                              ],
                            ),
                          ),
                        )
                      : Expanded(
                          child: NoInternetView(
                            onRetryClicked: () {
                              _subscriptionProvider?.checkForSubscriptions();
                            },
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
