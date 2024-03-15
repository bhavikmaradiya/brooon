import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../const/dimen_const.dart';
import '../utils/app_config.dart';
import '../utils/enums.dart';
import '../utils/static_functions.dart';

class TextFieldWidget extends StatefulWidget {
  final String? label;
  final String? hint;
  final String suffixIconAssetPath;
  final String suffixSecondIconAssetPath;
  Color? suffixIconColor;
  double? suffixIconSize;
  final TextInputType keyBoardType;
  final TextInputAction inputAction;
  final bool isSecure;
  final String obSecureChar;
  final ColorEnum borderColor;
  final FontWeight hintFontWeight;
  final FontWeight fontWeight;
  final int? maxLength;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatter;
  double? fieldWidth;
  double? fieldHeight;
  double? textSize;
  double? hintTextSize;
  double? labelTextSize;
  final bool isCursorVisible;
  final bool keepLabelAlwaysOnTop;
  final TextAlign textAlign;
  final bool isCopyPasteAllowed;
  final bool autoFocus;
  final int? otpFieldsIndex;
  Function(int? currentIndex, String value) onValueChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final String? pricePrefixValue;
  final String? suffixUnitText;
  final bool isOutlineBorderRequired;
  final bool isEnabled;
  final Color? backgroundColor;
  EdgeInsetsGeometry? contentPadding;
  final Function? onSuffixIconClick;
  final Function? onSecondSuffixIconClick;

  TextFieldWidget({
    super.key,
    required this.onValueChanged,
    this.label,
    this.hint,
    this.maxLines = 1,
    this.backgroundColor,
    this.keyBoardType = TextInputType.text,
    this.inputAction = TextInputAction.done,
    this.fontWeight = FontWeight.w400,
    this.hintFontWeight = FontWeight.w400,
    this.suffixIconAssetPath = '',
    this.suffixSecondIconAssetPath = '',
    this.suffixIconColor,
    this.keepLabelAlwaysOnTop = false,
    this.isSecure = false,
    this.obSecureChar = '*',
    this.borderColor = ColorEnum.borderColorE0,
    this.maxLength,
    this.inputFormatter,
    this.fieldHeight,
    this.fieldWidth,
    this.textSize,
    this.hintTextSize,
    this.labelTextSize,
    this.isCursorVisible = true,
    this.textAlign = TextAlign.start,
    this.isCopyPasteAllowed = true,
    this.autoFocus = false,
    this.otpFieldsIndex,
    this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.suffixIconSize,
    this.pricePrefixValue,
    this.suffixUnitText,
    this.isOutlineBorderRequired = true,
    this.isEnabled = true,
    this.contentPadding,
    this.onSuffixIconClick,
    this.onSecondSuffixIconClick,
  }) {
    fieldWidth ??= double.infinity;
    fieldHeight ??= Dimensions.fieldHeight.h;
    textSize ??= Dimensions.fieldTextSize.sp;
    hintTextSize ??= Dimensions.fieldTextSize.sp;
    labelTextSize ??= Dimensions.floatingLabelTextSize.sp;
    contentPadding ??= EdgeInsets.only(
      left: Dimensions.fieldContentPaddingWidth.w,
      right: (suffixIconAssetPath.trim().isNotEmpty)
          ? (Dimensions.fieldContentPaddingWidth +
                  (suffixSecondIconAssetPath.trim().isNotEmpty
                      ? Dimensions.suffixIconToTextMargin * Dimensions.suffixSecondIconMargin
                      : Dimensions.suffixIconToTextMargin))
              .w
          : Dimensions.fieldContentPaddingWidth.w,
      top: Dimensions.fieldContentPaddingHeight.h,
      bottom: Dimensions.fieldContentPaddingHeight.h,
    );
  }

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  OutlineInputBorder outlineInputBorderView(BuildContext context) {
    if (widget.isOutlineBorderRequired) {
      return OutlineInputBorder(
        borderSide: BorderSide(
          color: StaticFunctions.getColor(
            context,
            widget.borderColor,
          ),
          width: Dimensions.fieldBorderWidth.w,
        ),
        borderRadius: BorderRadius.circular(
          Dimensions.fieldCornerRadius.w,
        ),
      );
    }
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 0,
      ),
    );
  }

  TextStyle labelTextStyle(BuildContext context) {
    return TextStyle(
      color: StaticFunctions.getColor(
        context,
        ColorEnum.blueColor,
      ),
      fontWeight: widget.hintFontWeight,
      fontSize: widget.labelTextSize,
    );
  }

  TextStyle hintTextStyle(BuildContext context) {
    return TextStyle(
      color: StaticFunctions.getColor(
        context,
        ColorEnum.gray90Color,
      ),
      fontWeight: widget.hintFontWeight,
      fontSize: widget.hintTextSize,
    );
  }

  TextStyle inputTextStyle(BuildContext context) {
    return TextStyle(
      fontWeight: widget.fontWeight,
      fontSize: widget.textSize,
      color: StaticFunctions.getColor(
        context,
        widget.isEnabled ? ColorEnum.blackColor : ColorEnum.gray90Color,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.otpFieldsIndex != null) {
      widget.focusNode?.addListener(() {
        if (widget.focusNode?.hasFocus ?? false) {
          if ((widget.controller?.text.isNotEmpty ?? false)) {
            if (widget.otpFieldsIndex == AppConfig.otpLength - 1) {
              FocusScope.of(context).unfocus();
            }
          }
        }
      });
    }
  }

  @override
  void dispose() {
    widget.focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.fieldWidth,
      height: widget.fieldHeight,
      child: Stack(
        children: [
          TextField(
            autocorrect: false,
            enableSuggestions: false,
            focusNode: widget.focusNode,
            controller: widget.controller,
            enableInteractiveSelection: widget.isCopyPasteAllowed,
            textAlign: widget.textAlign,
            style: inputTextStyle(context),
            cursorColor: StaticFunctions.getColor(
              context,
              ColorEnum.blackColor,
            ),
            enabled: widget.isEnabled,
            autofocus: widget.autoFocus,
            showCursor: widget.isCursorVisible,
            maxLength: widget.maxLength ?? TextField.noMaxLength,
            maxLines: widget.maxLines,
            inputFormatters: widget.inputFormatter,
            decoration: InputDecoration(
              counterText: '',
              fillColor: widget.backgroundColor,
              filled: widget.backgroundColor != null,
              prefix: widget.keyBoardType == TextInputType.phone
                  ? null
                  /*Padding(
                      padding: EdgeInsets.only(
                        left: Dimensions.phonePrefixRightSpacing.w,
                      ),
                      child: Text(
                        AppConfig.mobileNumPrefix,
                        style: inputTextStyle(context).copyWith(
                          color: Colors.transparent,
                        ),
                      ),
                    )*/
                  : (widget.pricePrefixValue != null &&
                          widget.pricePrefixValue!.isNotEmpty)
                      ? Text(
                          widget.pricePrefixValue!,
                          style: inputTextStyle(context).copyWith(
                            color: Colors.transparent,
                          ),
                        )
                      : null,
              hintText: widget.hint,
              floatingLabelBehavior: widget.keepLabelAlwaysOnTop
                  ? FloatingLabelBehavior.always
                  : FloatingLabelBehavior.auto,
              hintStyle: hintTextStyle(context),
              labelText: widget.label,
              labelStyle: labelTextStyle(context),
              border: outlineInputBorderView(context),
              enabledBorder: outlineInputBorderView(context),
              focusedBorder: outlineInputBorderView(context),
              disabledBorder: outlineInputBorderView(context),
              contentPadding: widget.contentPadding!,
            ),
            obscureText: widget.isSecure,
            obscuringCharacter: widget.obSecureChar,
            keyboardType: widget.keyBoardType,
            textInputAction: widget.inputAction,
            onSubmitted: (value) {
              if (widget.inputAction == TextInputAction.next &&
                  widget.nextFocusNode != null) {
                FocusScope.of(context).requestFocus(widget.nextFocusNode);
              }
            },
            onChanged: (value) {
              if (widget.otpFieldsIndex != null) {
                if (value.length == widget.maxLength) {
                  if (widget.otpFieldsIndex! < AppConfig.otpLength - 1) {
                    FocusScope.of(context).nextFocus();
                  }
                }
              }
              widget.onValueChanged(widget.otpFieldsIndex, value);
            },
          ),
          /*if (widget.keyBoardType == TextInputType.phone)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.fieldsIconMargin.h,
                    bottom: Dimensions.fieldsIconVerticalMargin.h,
                  ),
                  child: Text(
                    AppConfig.mobileNumPrefix,
                    textAlign: TextAlign.center,
                    style: inputTextStyle(context),
                  ),
                ),
              ),
            ),*/
          if (widget.pricePrefixValue != null &&
              widget.pricePrefixValue!.isNotEmpty)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(
                  left: Dimensions.fieldsIconMargin.w,
                  top: (widget.pricePrefixValue == AppConfig.rupeeSymbol)
                      ? Dimensions.fieldsIconVerticalMargin.h
                      : 0,
                  bottom: (widget.pricePrefixValue != AppConfig.rupeeSymbol)
                      ? Dimensions.fieldsIconVerticalMargin.h
                      : 0,
                ),
                child: Center(
                  child: Text(
                    widget.pricePrefixValue!,
                    textAlign: TextAlign.center,
                    style: inputTextStyle(context).copyWith(
                      fontSize: Dimensions.fieldsPricePrefixSize.sp,
                    ),
                  ),
                ),
              ),
            ),
          if (widget.suffixIconAssetPath.trim().isNotEmpty)
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: InkWell(
                onTap: widget.onSuffixIconClick == null
                    ? null
                    : () {
                        if (widget.onSuffixIconClick != null) {
                          widget.onSuffixIconClick!();
                        }
                      },
                splashColor: StaticFunctions.getColor(
                  context,
                  ColorEnum.touchSplashColor,
                ),
                child: Container(
                  padding: EdgeInsets.all(
                    Dimensions.fieldsIconMargin.h,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.suffixUnitText != null &&
                          widget.suffixUnitText!.toString().isNotEmpty)
                        Text(
                          widget.suffixUnitText!,
                          style: TextStyle(
                            fontSize: Dimensions.fieldsSuffixTextSize.sp,
                            fontWeight: FontWeight.w400,
                            color: StaticFunctions.getColor(
                              context,
                              ColorEnum.blackColor,
                            ),
                          ),
                        ),
                      if (widget.suffixUnitText != null &&
                          widget.suffixUnitText!.toString().isNotEmpty)
                        SizedBox(
                          width: Dimensions.fieldsSuffixTextIconPadding.w,
                        ),
                      (widget.suffixIconAssetPath.endsWith("svg")
                          ? SvgPicture.asset(
                              widget.suffixIconAssetPath,
                              color: widget.suffixIconColor,
                              height: widget.suffixIconSize,
                              width: widget.suffixIconSize,
                            )
                          : Image.asset(
                              widget.suffixIconAssetPath,
                              color: widget.suffixIconColor,
                              height: widget.suffixIconSize,
                              width: widget.suffixIconSize,
                            )),
                    ],
                  ),
                ),
              ),
            ),
          if (widget.suffixSecondIconAssetPath.trim().isNotEmpty)
            Positioned(
              right: (Dimensions.suffixIconToTextMargin * 1.2).w,
              top: 0,
              bottom: 0,
              child: InkWell(
                onTap: widget.onSecondSuffixIconClick == null
                    ? null
                    : () {
                        if (widget.onSecondSuffixIconClick != null) {
                          widget.onSecondSuffixIconClick!();
                        }
                      },
                splashColor: StaticFunctions.getColor(
                  context,
                  ColorEnum.touchSplashColor,
                ),
                child: Container(
                  padding: EdgeInsets.all(
                    Dimensions.fieldsIconMargin.h,
                  ),
                  child: (widget.suffixIconAssetPath.endsWith("svg")
                      ? SvgPicture.asset(
                          widget.suffixSecondIconAssetPath,
                          height: widget.suffixIconSize,
                          width: widget.suffixIconSize,
                        )
                      : Image.asset(
                          widget.suffixSecondIconAssetPath,
                          height: widget.suffixIconSize,
                          width: widget.suffixIconSize,
                        )),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
