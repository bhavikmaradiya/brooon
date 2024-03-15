import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import './auth_provider.dart';
import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/phone_number_input_formatter.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/screen_bg.dart';
import '../../widgets/text_field_widget.dart';

class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key: key);

  static const extraPhoneNum = "extraPhone";

  Widget _getOtpWidget(
    AppLocalizations localizationsContext,
    BuildContext context,
    AuthProvider provider,
    bool isNeedToShow,
  ) {
    return Opacity(
      opacity: isNeedToShow ? 1 : 0,
      child: Selector<AuthProvider, String>(
        selector: (_, state) => state.mobileNo,
        builder: (_, mobileNum, child) {
          return ButtonWidget(
            text: localizationsContext.getOtp,
            textColor: StaticFunctions.getColor(
              context,
              StaticFunctions.isValidPhoneNumber(mobileNum)
                  ? ColorEnum.whiteColor
                  : ColorEnum.gray90Color,
            ),
            bgColor: StaticFunctions.getColor(
              context,
              StaticFunctions.isValidPhoneNumber(mobileNum)
                  ? ColorEnum.themeColor
                  : ColorEnum.themeColorOpacity3Percentage,
            ),
            borderColor: StaticFunctions.getColor(
              context,
              StaticFunctions.isValidPhoneNumber(mobileNum)
                  ? ColorEnum.themeColor
                  : ColorEnum.borderColorE0,
            ),
            onClick: () {
              if (isNeedToShow &&
                  StaticFunctions.isValidPhoneNumber(mobileNum)) {
                provider.verifyPhoneNumberUsingFirebaseAuth(
                  context,
                  localizationsContext,
                );
              }
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizationsContext = AppLocalizations.of(context)!;
    AuthProvider provider = Provider.of<AuthProvider>(context, listen: false);
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          child: Scaffold(
            appBar: ThemeConfig.appBar(context,
                statusBarColor: ColorEnum.whiteColor),
            resizeToAvoidBottomInset: false,
            body: WillPopScope(
              onWillPop: () => Future.value(false),
              child: Stack(
                children: [
                  const ScreenBg(
                    bgOpacityColorEnum: ColorEnum.lightBgOpacityColor,
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.screenHorizontalMargin.w,
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                        height: MediaQuery.of(context).size.height,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: Dimensions.appLogoHeight.h,
                            margin: EdgeInsets.only(
                              top: Dimensions.logoMarginTop.h,
                            ),
                            child: SvgPicture.asset(
                              Strings.appLogo,
                              width: Dimensions.appLogoWidth.w,
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.marginBetweenLogoText.h,
                          ),
                          Wrap(
                            children: [
                              Text(
                                localizationsContext.welcomes,
                                style: TextStyle(
                                  color: StaticFunctions.getColor(
                                    context,
                                    ColorEnum.themeColor,
                                  ),
                                  fontWeight: FontWeight.w600,
                                  fontSize: Dimensions.headerTextSize.sp,
                                ),
                              ),
                              Text(
                                localizationsContext.you,
                                style: TextStyle(
                                  color: StaticFunctions.getColor(
                                    context,
                                    ColorEnum.blackColor,
                                  ),
                                  fontWeight: FontWeight.w400,
                                  fontSize: Dimensions.headerTextSize.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.marginBetweenHeaderDescription.h,
                          ),
                          Text(
                            localizationsContext.weWillSendPassword,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: StaticFunctions.getColor(
                                context,
                                ColorEnum.gray90Color,
                              ),
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.descriptionTextSize.sp,
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.marginBetweenFieldDescription.h,
                          ),
                          TextFieldWidget(
                            label: localizationsContext.mobileNumber,
                            hint: localizationsContext.mobileNumberHint,
                            controller: provider.mobileNoController,
                            keyBoardType: TextInputType.phone,
                            maxLength: AppConfig.mobileNoFieldLength,
                            keepLabelAlwaysOnTop: true,
                            inputFormatter: [
                              FilteringTextInputFormatter.digitsOnly,
                              PhoneNumberTextInputFormatter(),
                            ],
                            onValueChanged: (int? currentIndex, String value) =>
                                provider.setMobileNo = value,
                          ),
                          Selector<AuthProvider, String>(
                            shouldRebuild: (prev, next) => true,
                            selector: (_, state) => state.mobileNo,
                            builder: (context, mobileNum, child) {
                              return AnimatedOpacity(
                                opacity: !StaticFunctions.isValidPhoneNumber(
                                            mobileNum) &&
                                        !mobileNum.trim().isEmpty
                                    ? 1.0
                                    : 0.0,
                                duration: const Duration(milliseconds: 200),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal:
                                        Dimensions.errorTextHorizontalSpacing.w,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      SizedBox(
                                        height: Dimensions
                                            .marginsBetweenFieldError.h,
                                      ),
                                      Text(
                                        localizationsContext.invalidMobile,
                                        style: TextStyle(
                                          color: StaticFunctions.getColor(
                                            context,
                                            ColorEnum.errorColor,
                                          ),
                                          fontWeight: FontWeight.w400,
                                          fontSize: Dimensions.errorTextSize.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          if (isKeyboardVisible)
                            SizedBox(
                              height:
                                  Dimensions.marginBetweenFieldDescription.h,
                            ),
                          _getOtpWidget(
                            localizationsContext,
                            context,
                            provider,
                            isKeyboardVisible,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: Dimensions.getOtpButtonMarginBottom.h,
                        left: Dimensions.screenHorizontalMargin.w,
                        right: Dimensions.screenHorizontalMargin.w,
                      ),
                      child: _getOtpWidget(
                        localizationsContext,
                        context,
                        provider,
                        !isKeyboardVisible,
                      ),
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
}
