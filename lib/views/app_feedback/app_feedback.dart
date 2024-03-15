import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import './app_feedback_provider.dart';
import '../../const/dimen_const.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_field_widget.dart';
import '../../widgets/toolbar.dart';

class AppFeedback extends StatelessWidget {
  const AppFeedback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppFeedbackProvider(),
      builder: (_, __) => _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  Widget _submitButtonWidget(
    BuildContext screenContext,
    AppLocalizations localizationsContext,
    AppFeedbackProvider appFeedbackProvider,
  ) {
    return Selector<AppFeedbackProvider, bool>(
      selector: (_, state) => state.isValid,
      shouldRebuild: (prev, next) => prev != next,
      builder: (context, isValid, child) {
        return ButtonWidget(
          text: localizationsContext.feedbackSubmit,
          onClick: isValid
              ? () => appFeedbackProvider.onSubmitFeedback(
                    screenContext,
                    localizationsContext.feedbackSuccess,
                    localizationsContext.feedbackFailed,
                  )
              : null,
          borderWidth: Dimensions.appFeedbackBottomButtonBorderWidth.w,
          textColor: StaticFunctions.getColor(
            context,
            isValid ? ColorEnum.whiteColor : ColorEnum.gray90Color,
          ),
          bgColor: StaticFunctions.getColor(
            context,
            isValid
                ? ColorEnum.themeColor
                : ColorEnum.themeColorOpacity3Percentage,
          ),
          borderColor: StaticFunctions.getColor(
            context,
            isValid ? ColorEnum.themeColor : ColorEnum.borderColorE0,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizationsContext = AppLocalizations.of(context)!;
    AppFeedbackProvider appFeedbackProvider = Provider.of<AppFeedbackProvider>(
      context,
      listen: false,
    );
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          appBar: ThemeConfig.appBar(
            context,
            statusBarColor: ColorEnum.whiteColor,
          ),
          bottomNavigationBar: Container(
            color: StaticFunctions.getColor(
              context,
              ColorEnum.whiteColor,
            ),
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: Dimensions.screenHorizontalMargin.w,
                vertical: Dimensions.screenVerticalMarginBottom.h,
              ),
              child: _submitButtonWidget(
                context,
                localizationsContext,
                appFeedbackProvider,
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ToolBar(
                  title: localizationsContext.drawerItemFeedback,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: Dimensions.screenHorizontalMargin.w,
                            vertical: Dimensions.screenVerticalMarginBottom.h,
                          ),
                          child: Selector<AppFeedbackProvider,
                              TextEditingController>(
                            shouldRebuild: (prev, next) => true,
                            selector: (_, state) =>
                                state.descriptionFieldController,
                            builder: (context, controller, child) {
                              return TextFieldWidget(
                                label:
                                    localizationsContext.feedbackMessageLabel,
                                controller: controller,
                                maxLines: Dimensions
                                    .appFeedbackDescriptionFieldMaxLine,
                                fieldHeight: Dimensions
                                    .appFeedbackDescriptionFieldHeight.h,
                                keyBoardType: TextInputType.multiline,
                                inputAction: Platform.isAndroid
                                    ? TextInputAction.newline
                                    : TextInputAction.done,
                                keepLabelAlwaysOnTop: true,
                                onValueChanged:
                                    (int? currentIndex, String value) =>
                                        appFeedbackProvider.validateData(),
                              );
                            },
                          ),
                        ),
                        if (isKeyboardVisible)
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: Dimensions.screenHorizontalMargin.w,
                              vertical: Dimensions.screenVerticalMarginBottom.h,
                            ),
                            child: _submitButtonWidget(
                              context,
                              localizationsContext,
                              appFeedbackProvider,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
