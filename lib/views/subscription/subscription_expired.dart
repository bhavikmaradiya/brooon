import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import './subscription_expired_provider.dart';
import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../localdb/subscription/db_subscription_plan.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../widgets/button_widget.dart';

class SubscriptionExpired extends StatelessWidget {
  const SubscriptionExpired({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SubscriptionExpiredProvider(),
      child: _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> with WidgetsBindingObserver {
  late String message;
  late AppLocalizations localizationsContext;
  SubscriptionExpiredProvider? provider;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }


  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    localizationsContext = AppLocalizations.of(context)!;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (provider == null) {
        provider = Provider.of<SubscriptionExpiredProvider>(
          context,
          listen: false,
        );
        provider!.init(localizationsContext);
      }
    });

    super.didChangeDependencies();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      provider?.verifyPlan(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: ThemeConfig.appBar(
          context,
          statusBarColor: ColorEnum.whiteColor,
        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: Dimensions.screenHorizontalMargin.w,
              vertical:
                  Dimensions.subscriptionExpiredScreenButtonMarginBottom.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          Strings.iconSessionTimeout,
                          height: Dimensions.subscriptionExpiredIconSize.h,
                          width: Dimensions.subscriptionExpiredIconSize.h,
                        ),
                      ),
                      SizedBox(
                        height: Dimensions
                            .subscriptionExpiredContentBetweenSpacing.h,
                      ),
                      Selector<SubscriptionExpiredProvider,
                          DbSubscriptionPlan?>(
                        shouldRebuild: (prev, next) => true,
                        selector: (_, state) => state.planInfo,
                        builder: (_, plan, __) {
                          String message = localizationsContext.subscription;
                          if (plan?.title != null) {
                            message = plan!.title!;
                          }
                          return Text(
                            localizationsContext.subscriptionExpired(message),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: StaticFunctions.getColor(
                                context,
                                ColorEnum.blackColor,
                              ),
                              fontSize:
                                  Dimensions.subscriptionExpiredTextSize.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                ButtonWidget(
                  text: localizationsContext.verifyPlan,
                  textColor: StaticFunctions.getColor(
                    context,
                    ColorEnum.whiteColor,
                  ),
                  bgColor: StaticFunctions.getColor(
                    context,
                    ColorEnum.themeColor,
                  ),
                  onClick: () => provider?.verifyPlan(context),
                ),
                SizedBox(
                  height: Dimensions.subscriptionExpiredContentBetweenSpacing.h,
                ),
                ButtonWidget(
                  text: localizationsContext.subscribeNow,
                  textColor: StaticFunctions.getColor(
                    context,
                    ColorEnum.whiteColor,
                  ),
                  bgColor: StaticFunctions.getColor(
                    context,
                    ColorEnum.themeColor,
                  ),
                  onClick: () => provider?.launchURL(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
