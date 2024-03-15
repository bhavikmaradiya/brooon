import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../widgets/screen_bg.dart';
import '../common_widget/navigator_helper.dart';

class OtpVerified extends StatefulWidget {
  OtpVerified({Key? key}) : super(key: key);

  @override
  State<OtpVerified> createState() => _OtpVerifiedState();
}

class _OtpVerifiedState extends State<OtpVerified> {
  late AppLocalizations localizationsContext;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: AppConfig.otpVerifiedDuration),
      () async {
        NavigatorHelper.openScreenAfterLogin(
          context,
          true,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    localizationsContext = AppLocalizations.of(context)!;
    return Scaffold(
      body: Stack(
        children: [
          ScreenBg(
            bgOpacityColorEnum: ColorEnum.lightBgOpacityColor,
            bottomMargin: Dimensions.splashBuildingMarginBottom.h,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  Strings.iconOtpVerified,
                  width: Dimensions.iconOtpVerifiedSize.w,
                  height: Dimensions.iconOtpVerifiedSize.w,
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.blueColor,
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.otpVerifiedLogoTextMargin.h,
              ),
              Text.rich(
                TextSpan(
                  text: localizationsContext.otp,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: StaticFunctions.getColor(
                      context,
                      ColorEnum.themeColor,
                    ),
                    fontSize: Dimensions.otpVerifiedTextSize.sp,
                  ),
                  children: [
                    TextSpan(
                      text: "${localizationsContext.verified}",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: StaticFunctions.getColor(
                          context,
                          ColorEnum.blackColor,
                        ),
                        fontSize: Dimensions.otpVerifiedTextSize.sp,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
