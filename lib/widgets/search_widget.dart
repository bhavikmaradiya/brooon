import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../const/dimen_const.dart';
import '../const/string_const.dart';
import '../utils/enums.dart';
import '../utils/static_functions.dart';

class SearchWidget extends StatefulWidget {
  final String searchHint;
  final String? prefixIconAssets;
  final ColorEnum? prefixIconColor;
  final String? suffixIconAssets;
  final double? suffixIconSize;
  final ColorEnum? suffixIconColor;
  final bool? isSuffixIconRequired;
  final Function onSearch;
  final Function? suffixIconClick;
  final Function? onTyping;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextEditingController? controller;
  final Function(bool hasFocus)? onFocusChanged;

  SearchWidget({
    Key? key,
    required this.searchHint,
    required this.onSearch,
    this.controller,
    this.prefixIconAssets,
    this.prefixIconColor,
    this.suffixIconAssets,
    this.suffixIconColor,
    this.suffixIconSize,
    this.isSuffixIconRequired,
    this.suffixIconClick,
    this.onTyping,
    this.focusNode,
    this.autofocus,
    this.onFocusChanged,
  }) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  void initState() {
    if (widget.focusNode != null) {
      widget.focusNode!.addListener(() {
        if (widget.onFocusChanged != null) {
          widget.onFocusChanged!(widget.focusNode!.hasFocus);
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.fieldHeight.h,
      child: Card(
        color: StaticFunctions.getColor(
          context,
          ColorEnum.whiteColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Dimensions.searchFieldBorderRadius.r,
          ),
          // if you need this
          side: BorderSide(
            color: StaticFunctions.getColor(
              context,
              ColorEnum.borderColorE0,
            ),
            width: Dimensions.searchFieldBorderWidth.w,
          ),
        ),
        margin: EdgeInsets.zero,
        elevation: Dimensions.searchCardElevation,
        child: Container(
          padding: EdgeInsets.only(
            left: Dimensions.searchFilterBoxInnerHorizontalSpacing.w,
            right: (Dimensions.searchFilterBoxInnerHorizontalSpacing / 2).w,
            top: Dimensions.searchFilterBoxInnerVerticalSpacing.h,
            bottom: Dimensions.searchFilterBoxInnerVerticalSpacing.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: double.infinity,
                child: SvgPicture.asset(
                  (widget.prefixIconAssets == null ||
                          widget.prefixIconAssets.toString().trim().isEmpty)
                      ? Strings.iconSearchFilter
                      : widget.prefixIconAssets!,
                  height: Dimensions.searchFilterFieldIconSize.h,
                  width: Dimensions.searchFilterFieldIconSize.h,
                  color: StaticFunctions.getColor(
                    context,
                    (widget.prefixIconColor == null)
                        ? ColorEnum.gray90Color
                        : widget.prefixIconColor!,
                  ),
                ),
              ),
              SizedBox(
                width: Dimensions.searchFilterTextFieldHorizontalSpacing.w,
              ),
              Expanded(
                child: TextField(
                  autocorrect: false,
                  enableSuggestions: false,
                  textAlignVertical: TextAlignVertical.center,
                  cursorColor: StaticFunctions.getColor(
                    context,
                    ColorEnum.blackColor,
                  ),
                  autofocus: widget.autofocus ?? false,
                  focusNode: widget.focusNode,
                  decoration: InputDecoration(
                    hintText: widget.searchHint,
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: Dimensions.searchFieldFontSize.sp,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.gray90Color,
                      ),
                    ),
                    border: InputBorder.none,
                    isCollapsed: true,
                  ),
                  maxLines: 1,
                  controller: widget.controller,
                  textInputAction: TextInputAction.search,
                  keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: Dimensions.searchFieldFontSize.sp,
                    color: StaticFunctions.getColor(
                      context,
                      ColorEnum.blackColor,
                    ),
                  ),
                  onSubmitted: (value) {
                    widget.onSearch(value);
                  },
                  onChanged: (value) {
                    if (widget.onTyping != null) {
                      widget.onTyping!(value);
                    }
                  },
                ),
              ),
              if (widget.isSuffixIconRequired ?? false)
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                      Dimensions.searchFieldBorderRadius.r,
                    ),
                    onTap: () {
                      if (widget.suffixIconClick != null) {
                        widget.suffixIconClick!();
                      }
                    },
                    child: SizedBox(
                      width: (Dimensions.searchFilterIconSize * 2).h,
                      height: double.infinity,
                      child: Center(
                        child: SvgPicture.asset(
                          (widget.suffixIconAssets == null ||
                                  widget.suffixIconAssets
                                      .toString()
                                      .trim()
                                      .isEmpty)
                              ? Strings.iconSettings
                              : widget.suffixIconAssets!,
                          color: StaticFunctions.getColor(
                            context,
                            (widget.suffixIconColor == null)
                                ? ColorEnum.blueColor
                                : widget.suffixIconColor!,
                          ),
                          height: (widget.suffixIconSize == null)
                              ? Dimensions.searchFilterIconSize.h
                              : widget.suffixIconSize!.h,
                          width: (widget.suffixIconSize == null)
                              ? Dimensions.searchFilterIconSize.h
                              : widget.suffixIconSize!.h,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
