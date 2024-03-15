import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../common_property_data_provider.dart';
import '../../const/dimen_const.dart';
import '../../const/routes.dart';
import '../../const/string_const.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/save_default_data.dart';
import '../../utils/app_config.dart';
import '../../utils/app_privacy_helper.dart';
import '../../utils/choose_location_from_enum.dart';
import '../../utils/choose_plan_from_enum.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../utils/subscription_utils.dart';
import '../../utils/theme_config.dart';
import '../profile/profile_from_enum.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: AppConfig.splashTimer,
      ),
    );
    _animation = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.fastOutSlowIn,
    );
    _animationController?.forward();
    StaticFunctions.getFirebaseDeviceToken();
    StaticFunctions.observeFirebaseDeviceTokenChange();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Future.delayed(
          const Duration(
            seconds: AppConfig.splashTimer,
          ),
          () async {
            final _isarService = IsarService();
            final userInfo = await _isarService.getUserInfo();
            if (userInfo != null) {
              StaticFunctions.userId = userInfo.id;
              StaticFunctions.userInfo = userInfo;
              final isPrivacyBreak = await AppPrivacyHelper.checkForPrivacy(
                context,
                RedirectionFromForPrivacyCheck.splash,
                _isarService,
              );
              if (isPrivacyBreak) {
                return;
              }
              final isUserHasSubscription = await SubscriptionUtils
                  .checkForUserHasActiveSubscriptionPlan();
              Provider.of<CommonPropertyDataProvider>(
                context,
                listen: false,
              ).updateSubscribedPlan(isUserHasSubscription);

              if (userInfo.isUserLoggedOut) {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.authenticationRoute,
                );
              } else if (userInfo.firstName == null ||
                  userInfo.firstName!.trim().isEmpty ||
                  userInfo.lastName == null ||
                  userInfo.lastName!.trim().isEmpty) {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.profile,
                  arguments: ProfileFrom.splash,
                );
              } else if (AppConfig.enabledSubscriptionFeature &&
                  SubscriptionUtils.checkUserSubscriptionExpired()) {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.subscription,
                  arguments: ChoosePlanFrom.splash,
                );
              } else if (userInfo.latitude == null ||
                  userInfo.longitude == null ||
                  userInfo.currentArea == null ||
                  userInfo.latitude == 0.0 ||
                  userInfo.longitude == 0.0 ||
                  userInfo.currentArea!.trim().isEmpty) {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.chooseLocation,
                  arguments: ChooseLocationFrom.splash,
                );
              } else {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.home,
                );
              }
            } else {
              final appSettings = await _isarService.getAppSettings();
              if (appSettings == null || !appSettings.isWalkthroughSeen) {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.walkThroughRoute,
                );
              } else {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.authenticationRoute,
                );
              }
            }
          },
        );
      },
    );
  }

  @override
  void didChangeDependencies() async {
    await SaveDefaultData().init(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizationsContext = AppLocalizations.of(context)!;
    TextStyle lightTextStyle = TextStyle(
      color: StaticFunctions.getColor(
        context,
        ColorEnum.blackColor,
      ),
      fontWeight: FontWeight.w400,
      fontSize: Dimensions.splashAppTagTextSize.sp,
    );
    final bgOpacityColor = StaticFunctions.getColor(
      context,
      ColorEnum.darkBgOpacityColor,
    );
    StaticFunctions.statusBarColor(
      statusBarColor: StaticFunctions.getColor(
        context,
        ColorEnum.statusBarColor,
      ),
      isStatusBarTextBlack: !StaticFunctions.isAppDarkMode(context),
    );
    String tagLine = localizationsContext.appTagline;
    return Scaffold(
      appBar: ThemeConfig.appBar(context),
      body: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: Dimensions.splashBg1MarginTop.h,
              ),
              child: SvgPicture.asset(
                Strings.splashBg1,
                width: Dimensions.splashBg1Width.w,
                height: Dimensions.splashBg1Height.h,
                color: bgOpacityColor,
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                top: Dimensions.splashLogoMarginTop.h,
              ),
              child: Column(
                children: [
                  SvgPicture.asset(
                    Strings.splashLogo,
                    width: Dimensions.splashLogoWidth.w,
                    height: Dimensions.splashLogoHeight.h,
                  ),
                  SizedBox(
                    height: Dimensions.splashAppTagTextLogoSpacing.h,
                  ),
                  ScaleTransition(
                    scale: _animation!,
                    child: Text(
                      tagLine,
                      style: lightTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(
                top: Dimensions.splashBg2MarginTop.h,
              ),
              child: SvgPicture.asset(
                Strings.splashBg2,
                width: Dimensions.splashBg2Width.w,
                height: Dimensions.splashBg2Height.h,
                color: bgOpacityColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: Dimensions.splashBg3MarginTop.h,
                left: Dimensions.splashBg3marginLeft.w,
              ),
              child: SvgPicture.asset(
                Strings.splashBg3,
                width: Dimensions.splashBg3Width.w,
                height: Dimensions.splashBg3Height.h,
                color: bgOpacityColor,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(
                  bottom: Dimensions.splashBuildingMarginBottom.h,
                ),
                width: MediaQuery.of(context).size.width,
                height: Dimensions.splashBuildingHeight.h,
                child: Image(
                  image: AssetImage(
                    Strings.splashBuilding,
                  ),
                  color: bgOpacityColor,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
