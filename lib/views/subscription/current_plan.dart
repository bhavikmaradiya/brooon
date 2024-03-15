import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import './current_plan_provider.dart';
import './widget/current_plan_item.dart';
import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../localdb/subscription/db_subscription_plan.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/no_internet_view/no_internet_view.dart';
import '../../widgets/toolbar.dart';

class CurrentPlan extends StatelessWidget {
  const CurrentPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CurrentPlanProvider(),
      builder: (_, __) => _CurrentPlanBody(),
    );
  }
}

class _CurrentPlanBody extends StatefulWidget {
  _CurrentPlanBody({
    Key? key,
  }) : super(key: key);

  @override
  State<_CurrentPlanBody> createState() => _CurrentPlanBodyState();
}

class _CurrentPlanBodyState extends State<_CurrentPlanBody> {
  CurrentPlanProvider? _currentPlanProvider;
  late AppLocalizations _localizationsContext;

  @override
  void didChangeDependencies() {
    _localizationsContext = AppLocalizations.of(context)!;
    if (_currentPlanProvider == null) {
      _currentPlanProvider = Provider.of<CurrentPlanProvider>(
        context,
        listen: false,
      );
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) {
          _currentPlanProvider!.init(context);
        },
      );
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _upgradePlanButton() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.screenHorizontalMargin.w,
        vertical: Dimensions.screenVerticalMarginBottom.h,
      ),
      child: ButtonWidget(
        text: _localizationsContext.upgradePlan,
        textColor: StaticFunctions.getColor(
          context,
          ColorEnum.whiteColor,
        ),
        bgColor: StaticFunctions.getColor(
          context,
          ColorEnum.themeColor,
        ),
        onClick: () {
          _currentPlanProvider?.upgradePlan();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeConfig.appBar(context),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () => Future.value(true),
          child: Column(
            children: [
              ToolBar(
                title: _localizationsContext.subscription,
                enableBack: true,
                centerTitle: false,
                endText: _localizationsContext.btnPurchaseHistory,
                onEndTextClick: () {
                  _currentPlanProvider?.viewPurchaseHistory();
                },
              ),
              Selector<CurrentPlanProvider, bool>(
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
                                        Text(
                                          _localizationsContext.currentPlan,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: StaticFunctions.getColor(
                                              context,
                                              ColorEnum.themeColor,
                                            ),
                                            fontSize: Dimensions
                                                .subscriptionScreenTitleSize.sp,
                                          ),
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
                                            _localizationsContext
                                                .currentPlanDesc,
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
                                        Selector<CurrentPlanProvider,
                                            DbSubscriptionPlan?>(
                                          shouldRebuild: (prev, next) => true,
                                          selector: (_, state) =>
                                              state.currentPlan,
                                          builder:
                                              (context, currentPlan, child) {
                                            if (currentPlan != null) {
                                              return CurrentPlanItem(
                                                localizationsContext:
                                                    _localizationsContext,
                                                currentPlan: currentPlan,
                                              );
                                            }
                                            return const SizedBox();
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
                                _upgradePlanButton(),
                              ],
                            ),
                          ),
                        )
                      : Expanded(
                          child: NoInternetView(
                            onRetryClicked: () {
                              _currentPlanProvider?.checkForSubscriptions();
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
