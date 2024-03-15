import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../views/authentication/authentication.dart';
import '../../widgets/countdown/countdown.dart';
import '../../widgets/screen_bg.dart';
import '../../widgets/text_field_widget.dart';
import '../../widgets/toolbar.dart';
import 'auth_provider.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification>
    with TickerProviderStateMixin {
  late AppLocalizations localizationsContext;
  AuthProvider? _authProvider;
  late AnimationController _countdownController;
  String? mobileNo;

  FocusNode? firstOtpFieldFocused;
  FocusNode? secondOtpFieldFocused;
  FocusNode? thirdOtpFieldFocused;
  FocusNode? fourthOtpFieldFocused;
  FocusNode? fifthOtpFieldFocused;
  FocusNode? sixthOtpFieldFocused;

  @override
  void initState() {
    super.initState();
    firstOtpFieldFocused = FocusNode();
    secondOtpFieldFocused = FocusNode();
    thirdOtpFieldFocused = FocusNode();
    fourthOtpFieldFocused = FocusNode();
    fifthOtpFieldFocused = FocusNode();
    sixthOtpFieldFocused = FocusNode();

    _countdownController = AnimationController(
        vsync: this, duration: AppConfig.resendOtpTimeoutDuration);
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (ModalRoute.of(context)?.settings.arguments != null) {
          setState(
            () {
              mobileNo = (ModalRoute.of(context)?.settings.arguments
                  as Map)[Authentication.extraPhoneNum];
            },
          );
        }
        Future.delayed(
          const Duration(milliseconds: 10),
          () {
            _countdownController.forward();
          },
        );
      },
    );
    _countdownController.addStatusListener(
      (status) {
        setState(() {});
      },
    );
  }

  @override
  void didChangeDependencies() {
    if (_authProvider == null) {
      _authProvider = Provider.of<AuthProvider>(
        context,
        listen: false,
      );
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _countdownController.dispose();
    super.dispose();
  }

  TextEditingController fieldController(int index) {
    return index == 5
        ? _authProvider!.sixthOtpController
        : index == 4
            ? _authProvider!.fifthOtpController
            : index == 3
                ? _authProvider!.fourthOtpController
                : index == 2
                    ? _authProvider!.thirdOtpController
                    : index == 1
                        ? _authProvider!.secondOtpController
                        : _authProvider!.firstOtpController;
  }

  FocusNode? fieldFocusNode(int index) {
    return index == 5
        ? sixthOtpFieldFocused
        : index == 4
            ? fifthOtpFieldFocused
            : index == 3
                ? fourthOtpFieldFocused
                : index == 2
                    ? thirdOtpFieldFocused
                    : index == 1
                        ? secondOtpFieldFocused
                        : firstOtpFieldFocused;
  }

  Future<void> onFieldValueChanged(
    BuildContext context,
    int? currentIndex,
    String value,
  ) async {
    if (value.isNotEmpty) {
      _authProvider!.updateOtpValidInvalidStatus = false;
      if (value.length > 1) {
        if (currentIndex == 0) {
          _authProvider!.firstOtpController.text = value.substring(0, 1);
          _authProvider!.secondOtpController.text = value.substring(1, 2);
        } else if (currentIndex == 1) {
          _authProvider!.secondOtpController.text = value.substring(0, 1);
          _authProvider!.thirdOtpController.text = value.substring(1, 2);
        } else if (currentIndex == 2) {
          _authProvider!.thirdOtpController.text = value.substring(0, 1);
          _authProvider!.fourthOtpController.text = value.substring(1, 2);
        } else if (currentIndex == 3) {
          _authProvider!.fourthOtpController.text = value.substring(0, 1);
          _authProvider!.fifthOtpController.text = value.substring(1, 2);
        } else if (currentIndex == 4) {
          _authProvider!.fifthOtpController.text = value.substring(0, 1);
          _authProvider!.sixthOtpController.text = value.substring(1, 2);
        }
      }
    } else if (currentIndex != null && currentIndex != 0) {
      if (currentIndex == 5) {
        if (_authProvider!.fifthOtpController.text.isNotEmpty) {
          FocusScope.of(context).requestFocus(fifthOtpFieldFocused);
        } else if (_authProvider!.fourthOtpController.text.isNotEmpty) {
          FocusScope.of(context).requestFocus(fourthOtpFieldFocused);
        } else if (_authProvider!.thirdOtpController.text.isNotEmpty) {
          FocusScope.of(context).requestFocus(thirdOtpFieldFocused);
        } else if (_authProvider!.secondOtpController.text.isNotEmpty) {
          FocusScope.of(context).requestFocus(secondOtpFieldFocused);
        } else {
          FocusScope.of(context).requestFocus(firstOtpFieldFocused);
        }
      } else if (currentIndex == 4) {
        if (_authProvider!.fourthOtpController.text.isNotEmpty) {
          FocusScope.of(context).requestFocus(fourthOtpFieldFocused);
        } else if (_authProvider!.thirdOtpController.text.isNotEmpty) {
          FocusScope.of(context).requestFocus(thirdOtpFieldFocused);
        } else if (_authProvider!.secondOtpController.text.isNotEmpty) {
          FocusScope.of(context).requestFocus(secondOtpFieldFocused);
        } else {
          FocusScope.of(context).requestFocus(firstOtpFieldFocused);
        }
      } else if (currentIndex == 3) {
        if (_authProvider!.thirdOtpController.text.isNotEmpty) {
          FocusScope.of(context).requestFocus(thirdOtpFieldFocused);
        } else if (_authProvider!.secondOtpController.text.isNotEmpty) {
          FocusScope.of(context).requestFocus(secondOtpFieldFocused);
        } else {
          FocusScope.of(context).requestFocus(firstOtpFieldFocused);
        }
      } else if (currentIndex == 2) {
        if (_authProvider!.secondOtpController.text.isNotEmpty) {
          FocusScope.of(context).requestFocus(secondOtpFieldFocused);
        } else {
          FocusScope.of(context).requestFocus(firstOtpFieldFocused);
        }
      } else {
        FocusScope.of(context).requestFocus(firstOtpFieldFocused);
      }
    }
    final String otp =
        _authProvider!.firstOtpController.text.toString().trim() +
            _authProvider!.secondOtpController.text.toString().trim() +
            _authProvider!.thirdOtpController.text.toString().trim() +
            _authProvider!.fourthOtpController.text.toString().trim() +
            _authProvider!.fifthOtpController.text.toString().trim() +
            _authProvider!.sixthOtpController.text.toString().trim();
    if (otp.length == AppConfig.otpLength) {
      _authProvider!.verifyOtpUsingFirebaseAuth(
        context,
        localizationsContext,
        otp: otp,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    AnimationStatus countdownAnimationStatus = _countdownController.status;
    localizationsContext = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: ThemeConfig.appBar(context, statusBarColor: ColorEnum.whiteColor),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            ScreenBg(
              bgOpacityColorEnum: ColorEnum.lightBgOpacityColor,
              bottomMargin: Dimensions.splashBuildingMarginBottom.h,
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.screenHorizontalMargin.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: Dimensions.appLogoHeight.h,
                    margin: EdgeInsets.only(top: Dimensions.logoMarginTop.h),
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
                        localizationsContext.otp,
                        style: TextStyle(
                          color: StaticFunctions.getColor(
                              context, ColorEnum.themeColor),
                          fontWeight: FontWeight.w600,
                          fontSize: Dimensions.headerTextSize.sp,
                        ),
                      ),
                      Text(
                        localizationsContext.verification,
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
                  Wrap(
                    children: [
                      Text(
                        "${localizationsContext.enterOtpSendTo} ",
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
                      Text(
                        mobileNo ?? "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: StaticFunctions.getColor(
                            context,
                            ColorEnum.gray90Color,
                          ),
                          fontWeight: FontWeight.w600,
                          fontSize: Dimensions.descriptionTextSize.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.marginBetweenFieldDescription.h,
                  ),
                  IntrinsicWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            AppConfig.otpLength,
                            (index) => Row(
                              children: [
                                TextFieldWidget(
                                  fieldHeight: Dimensions.otpFieldSize.w,
                                  fieldWidth: Dimensions.otpFieldSize.w,
                                  keyBoardType: TextInputType.number,
                                  maxLength: (index == AppConfig.otpLength - 1)
                                      ? AppConfig.otpFieldLength - 1
                                      : AppConfig.otpFieldLength,
                                  fontWeight: FontWeight.w600,
                                  inputFormatter: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  textSize: Dimensions.otpFieldTextSize.sp,
                                  contentPadding: EdgeInsets.all(0),
                                  textAlign: TextAlign.center,
                                  isCursorVisible: false,
                                  isCopyPasteAllowed: false,
                                  autoFocus: true,
                                  inputAction:
                                      (index == AppConfig.otpLength - 1)
                                          ? TextInputAction.done
                                          : TextInputAction.next,
                                  otpFieldsIndex: index,
                                  controller: fieldController(index),
                                  focusNode: fieldFocusNode(index),
                                  onValueChanged:
                                      (int? currentIndex, String value) {
                                    onFieldValueChanged(
                                      context,
                                      currentIndex,
                                      value,
                                    );
                                  },
                                ),
                                if (index != AppConfig.otpLength - 1)
                                  SizedBox(
                                    width: Dimensions.otpFieldMargins.w,
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Selector<AuthProvider, Tuple2<bool, bool>>(
                          selector: (_, state) => Tuple2(state.isInvalidOtp, state.isLoginApiFailed,),
                          shouldRebuild: (_, __) => true,
                          builder: (context, tuple, child) {
                            if (tuple.item1 || tuple.item2) {
                              FocusScope.of(context).requestFocus(
                                firstOtpFieldFocused,
                              );
                            }
                            return AnimatedOpacity(
                              opacity: tuple.item1 ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 200),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: Dimensions
                                        .otpMarginsBetweenFieldError.h,
                                  ),
                                  Text(
                                    localizationsContext.invalidOtp,
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
                            );
                          },
                        ),
                        SizedBox(
                          height: Dimensions.otpMarginsBetweenFieldTimer.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Opacity(
                              opacity: countdownAnimationStatus !=
                                      AnimationStatus.forward
                                  ? 1
                                  : 0,
                              child: Text(
                                localizationsContext.didNotReceivedOtp,
                                style: TextStyle(
                                  color: StaticFunctions.getColor(
                                    context,
                                    ColorEnum.gray90Color,
                                  ),
                                  fontWeight: FontWeight.w400,
                                  fontSize: Dimensions.contentTextSize.sp,
                                ),
                              ),
                            ),
                            if (countdownAnimationStatus ==
                                AnimationStatus.forward)
                              Countdown(
                                animation: StepTween(
                                  begin:
                                      _countdownController.duration?.inSeconds,
                                  end: 0,
                                ).animate(_countdownController),
                              ),
                          ],
                        ),
                        if (countdownAnimationStatus != AnimationStatus.forward)
                          SizedBox(
                            height: Dimensions.otpMarginsBetweenTimerResend.h,
                          ),
                        if (countdownAnimationStatus != AnimationStatus.forward)
                          InkWell(
                            onTap: () {
                              if (countdownAnimationStatus !=
                                  AnimationStatus.forward) {
                                _countdownController.reset();
                                Future.delayed(
                                  const Duration(milliseconds: 50),
                                  () {
                                    _countdownController.forward();
                                  },
                                );
                                StaticFunctions.unFocusKeyboardIfAny(context);
                                _authProvider?.resendOtpUsingFirebaseAuth(
                                  context,
                                  localizationsContext,
                                );
                              }
                            },
                            child: Text(
                              localizationsContext.resendOtp,
                              style: TextStyle(
                                color: StaticFunctions.getColor(
                                  context,
                                  ColorEnum.themeColor,
                                ),
                                fontWeight: FontWeight.w600,
                                fontSize: Dimensions.contentTextSize.sp,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                ToolBar(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
