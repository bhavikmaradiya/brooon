import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import './animated_toggle_switch_widget.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../const/dimen_const.dart';
import '../const/string_const.dart';
import '../views/view_all_property/model/property_visual_type.dart';

class ToolBar extends StatefulWidget {
  final bool enableBackground;
  final String title;
  final Function()? onBackPressed;
  final ColorEnum textColor;
  final ColorEnum backArrowColor;
  final bool enableSearch;
  final bool enableBack;
  final bool centerTitle;
  final bool isFilterVisible;
  final bool isFilterApplied;
  final bool autoFocusAndHideSearch;
  final bool propertySearchToggleSwitchEnable;
  final String endText;
  final String defaultSearchText;
  final String? searchHint;
  final Function(String)? onSearchChange;
  final Function? onFilterClick;
  final Function(PropertyVisualType)? onToggleSwitchChanged;
  final Function? onEndTextClick;
  final TextEditingController? searchFieldController;
  final String? customIconSvgPath;
  final Function? onCustomIconClicked;

  const ToolBar({
    Key? key,
    this.title = '',
    this.enableBackground = false,
    this.enableSearch = false,
    this.enableBack = true,
    this.centerTitle = false,
    this.onBackPressed,
    this.onSearchChange,
    this.isFilterVisible = false,
    this.isFilterApplied = false,
    this.propertySearchToggleSwitchEnable = false,
    this.autoFocusAndHideSearch = false,
    this.endText = '',
    this.defaultSearchText = '',
    this.onFilterClick,
    this.onEndTextClick,
    this.onToggleSwitchChanged,
    this.textColor = ColorEnum.blackColor,
    this.backArrowColor = ColorEnum.blackColor,
    this.searchHint,
    this.searchFieldController,
    this.customIconSvgPath,
    this.onCustomIconClicked,
  }) : super(key: key);

  @override
  State<ToolBar> createState() => _ToolBarState();
}

class _ToolBarState extends State<ToolBar> {
  bool _isSearchVisible = false;
  FocusNode _searchFocusNode = FocusNode();
  TextEditingController? _searchController;
  AppLocalizations? _localizationsContext;

  @override
  void initState() {
    _searchController ??=
        widget.searchFieldController ?? TextEditingController();
    if (widget.defaultSearchText.trim().isNotEmpty) {
      _searchController!.text = widget.defaultSearchText.toString().trim();
      _isSearchVisible = true;
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_localizationsContext == null) {
      _localizationsContext = AppLocalizations.of(context)!;
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _searchController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _searchController ??=
        widget.searchFieldController ?? TextEditingController();
    return Container(
      color: StaticFunctions.getColor(
        context,
        ColorEnum.toolbarDefaultColor,
      ),
      padding: EdgeInsets.only(
        left: (Dimensions.screenHorizontalMargin / 2).w,
        right: widget.endText.isNotEmpty
            ? Dimensions.screenHorizontalMargin.w
            : (Dimensions.screenHorizontalMargin / 1.75).w,
        top: Dimensions.toolbarVerticalMargin.h,
        bottom: Dimensions.toolbarVerticalMargin.h,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.enableBack)
            Container(
              width: Dimensions.toolbarBackArrowSize.w,
              height: Dimensions.toolbarBackArrowSize.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Dimensions.toolbarRippleRadius.r,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    if (widget.onBackPressed == null) {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    } else {
                      widget.onBackPressed!();
                    }
                  },
                  borderRadius: BorderRadius.circular(
                    Dimensions.toolbarRippleRadius.r,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      Dimensions.toolbarBackArrowPadding.w,
                    ),
                    child: SvgPicture.asset(
                      Strings.iconLeftArrow,
                      width: Dimensions.toolbarBackArrowSize.w,
                      height: Dimensions.toolbarBackArrowSize.w,
                      color: StaticFunctions.getColor(
                        context,
                        widget.backArrowColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          if (widget.enableBack)
            SizedBox(
              width: Dimensions.toolbarTextIconBetweenSpace.w,
            ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    width: double.infinity,
                    alignment: !widget.centerTitle
                        ? Alignment.centerLeft
                        : Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            widget.title,
                            textAlign: widget.centerTitle
                                ? TextAlign.center
                                : TextAlign.start,
                            maxLines: 1,
                            style: TextStyle(
                              color: StaticFunctions.getColor(
                                context,
                                widget.textColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                              fontSize: Dimensions.toolbarTextSize.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        if (widget.endText.isNotEmpty)
                          GestureDetector(
                            onTap: () {
                              if (widget.onEndTextClick != null) {
                                widget.onEndTextClick!();
                              }
                            },
                            child: Text(
                              widget.endText,
                              maxLines: 1,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: StaticFunctions.getColor(
                                  context,
                                  ColorEnum.themeColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                                fontSize: Dimensions.toolbarEndTextSize.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: widget.enableSearch && _isSearchVisible,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      color: StaticFunctions.getColor(
                          context, ColorEnum.whiteColor),
                      child: TextField(
                        autocorrect: false,
                        enableSuggestions: false,
                        autofocus: widget.autoFocusAndHideSearch,
                        controller: _searchController,
                        focusNode: _searchFocusNode,
                        cursorColor: StaticFunctions.getColor(
                          context,
                          ColorEnum.blackColor,
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Dimensions.toolbarTextSize.sp,
                          color: StaticFunctions.getColor(
                            context,
                            ColorEnum.blackColor,
                          ),
                        ),
                        onSubmitted: (value) => widget.onSearchChange != null
                            ? widget.onSearchChange!(value)
                            : null,
                        onChanged: widget.onSearchChange,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                          hintText: widget.searchHint != null
                              ? widget.searchHint
                              : _localizationsContext?.toolbarSearch ?? '',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: StaticFunctions.getColor(
                              context,
                              ColorEnum.gray90Color,
                            ),
                            fontWeight: FontWeight.w400,
                            fontSize: Dimensions.toolbarTextSize.sp,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          if (!widget.autoFocusAndHideSearch && widget.enableSearch)
            Container(
              width: Dimensions.toolbarBackArrowSize.w,
              height: Dimensions.toolbarBackArrowSize.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Dimensions.toolbarRippleRadius.r,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(
                    Dimensions.toolbarRippleRadius.r,
                  ),
                  onTap: () {
                    if (!_isSearchVisible) {
                      FocusScope.of(context).requestFocus(_searchFocusNode);
                    } else {
                      _searchController!.text = '';
                      _searchFocusNode.unfocus();
                    }
                    setState(
                      () {
                        _isSearchVisible = !_isSearchVisible;
                        if (widget.onSearchChange != null) {
                          widget.onSearchChange!(_searchController!.text);
                        }
                      },
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(
                      Dimensions.toolbarBackArrowPadding.w,
                    ),
                    child: SvgPicture.asset(
                      !_isSearchVisible
                          ? Strings.iconSearch
                          : Strings.iconClose,
                      width: Dimensions.toolbarBackArrowSize.w,
                      height: Dimensions.toolbarBackArrowSize.w,
                      color: StaticFunctions.getColor(
                        context,
                        widget.backArrowColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          if (widget.isFilterVisible)
            Stack(
              children: [
                Container(
                  width: Dimensions.toolbarBackArrowSize.w,
                  height: Dimensions.toolbarBackArrowSize.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Dimensions.toolbarRippleRadius.r,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(
                        Dimensions.toolbarRippleRadius.r,
                      ),
                      onTap: () {
                        if (widget.onFilterClick != null) {
                          widget.onFilterClick!();
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.all(
                          Dimensions.toolbarFilterIconPadding.w,
                        ),
                        child: SvgPicture.asset(
                          Strings.iconSettings,
                          width: Dimensions.toolbarBackArrowSize.w,
                          height: Dimensions.toolbarBackArrowSize.w,
                          color: StaticFunctions.getColor(
                            context,
                            ColorEnum.blackColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (widget.isFilterApplied)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      height: Dimensions.appliedFilterDotSize.h,
                      width: Dimensions.appliedFilterDotSize.h,
                      margin: EdgeInsets.symmetric(
                        horizontal: Dimensions.toolbarFilterIconPadding.w / 2,
                      ),
                      decoration: BoxDecoration(
                        color: StaticFunctions.getColor(
                          context,
                          ColorEnum.whiteColor,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(
                          Dimensions.appliedFilterDotInsideCirclePadding.w,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: StaticFunctions.getColor(
                              context,
                              ColorEnum.themeColor,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const SizedBox(),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          if (widget.propertySearchToggleSwitchEnable)
            AnimatedToggleSwitchWidget(
              onSwitchChanged: widget.onToggleSwitchChanged,
            ),
          if (widget.customIconSvgPath != null &&
              widget.customIconSvgPath!.trim().isNotEmpty)
            Container(
              width: Dimensions.toolbarBackArrowSize.w,
              height: Dimensions.toolbarBackArrowSize.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Dimensions.toolbarRippleRadius.r,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(
                    Dimensions.toolbarRippleRadius.r,
                  ),
                  onTap: () {
                    if (widget.onCustomIconClicked != null) {
                      widget.onCustomIconClicked!();
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(
                      Dimensions.toolbarFilterIconPadding.w,
                    ),
                    child: SvgPicture.asset(
                      widget.customIconSvgPath!,
                      width: Dimensions.toolbarBackArrowSize.w,
                      height: Dimensions.toolbarBackArrowSize.w,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
