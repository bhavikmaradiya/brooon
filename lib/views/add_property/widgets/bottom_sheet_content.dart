import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../const/dimen_const.dart';
import '../../../const/routes.dart';
import '../../../const/string_const.dart';
import '../../../localdb/properties/db_property_amenity.dart';
import '../../../localdb/properties/db_property_preferred_cast.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/custom_chip.dart';
import '../../../widgets/light_divider.dart';
import '../../../widgets/search_widget.dart';
import '../add_property_provider.dart';

class BottomSheetContent extends StatefulWidget {
  final ScrollController scrollController;
  final AppLocalizations localizationsContext;
  final AddPropertyProvider addPropertyProvider;
  final String label;

  const BottomSheetContent({
    Key? key,
    required this.scrollController,
    required this.localizationsContext,
    required this.addPropertyProvider,
    required this.label,
  }) : super(key: key);

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  bool _isPreferredCastWithEmptyList = false;

  Widget _navigationWidget(
    BuildContext context,
    AppLocalizations localizationsContext,
    AddPropertyProvider addPropertyProvider,
    bool isSelected,
  ) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: StaticFunctions.getColor(
              context,
              ColorEnum.shadowColor,
            ),
            blurRadius: Dimensions.bottomSheetButtonRadius.r,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              Dimensions.bottomSheetButtonRadius.h,
            ),
            topRight: Radius.circular(
              Dimensions.bottomSheetButtonRadius.h,
            ),
          ),
          color: StaticFunctions.getColor(
            context,
            ColorEnum.whiteColor,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.screenHorizontalMargin.w,
          vertical: Dimensions.screenVerticalMarginBottom.h,
        ),
        child: ButtonWidget(
          text: _isPreferredCastWithEmptyList
              ? localizationsContext.titleAddCast
              : localizationsContext.done,
          textColor: StaticFunctions.getColor(
            context,
            isSelected ? ColorEnum.whiteColor : ColorEnum.gray90Color,
          ),
          bgColor: StaticFunctions.getColor(
            context,
            isSelected
                ? ColorEnum.themeColor
                : ColorEnum.themeColorOpacity3Percentage,
          ),
          borderColor: StaticFunctions.getColor(
            context,
            isSelected ? ColorEnum.themeColor : ColorEnum.grayColor,
          ),
          fontWeight: FontWeight.w700,
          onClick: () {
            if (_isPreferredCastWithEmptyList) {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                Routes.castManagement,
              );
            } else {
              if (isSelected) {
                if (widget.label == localizationsContext.amenities) {
                  addPropertyProvider.onAmenitiesDone();
                } else if (widget.label == localizationsContext.preferredCast) {
                  addPropertyProvider.onPreferredCastDone();
                }
                Navigator.pop(context);
              }
            }
          },
        ),
      ),
    );
  }

  Widget _selectedChips(AppLocalizations localizationsContext) {
    if (widget.label == localizationsContext.amenities) {
      if (widget.addPropertyProvider.tempSelectedAmenitiesList.isNotEmpty) {
        Map<int, String> map = {};
        widget.addPropertyProvider.tempSelectedAmenitiesList.forEach(
          (element) {
            map[element.id] = element.name;
          },
        );
        return Container(
          margin: EdgeInsets.only(
            left: Dimensions.screenHorizontalMargin.w,
            right: Dimensions.screenHorizontalMargin.w,
            bottom: Dimensions.screenHorizontalMargin.h,
          ),
          child: CustomChip(
            chipList: map,
            onChipDeleted: (int id) {
              widget.addPropertyProvider.updateAmenitiesSelection(
                id,
                Strings.typeRemove,
              );
              setState(() {});
            },
          ),
        );
      }
    } else if (widget.label == localizationsContext.preferredCast) {
      if (widget.addPropertyProvider.tempSelectedPreferredCastList.isNotEmpty) {
        Map<int, String> map = {};
        widget.addPropertyProvider.tempSelectedPreferredCastList.forEach(
          (element) {
            map[element.id] = element.name;
          },
        );
        return Container(
          margin: EdgeInsets.only(
            left: Dimensions.screenHorizontalMargin.w,
            right: Dimensions.screenHorizontalMargin.w,
            bottom: Dimensions.screenHorizontalMargin.h,
          ),
          child: CustomChip(
            chipList: map,
            onChipDeleted: (int id) {
              widget.addPropertyProvider.updatePreferredCastSelection(
                id,
                Strings.typeRemove,
              );
              setState(() {});
            },
          ),
        );
      }
    }
    return const SizedBox();
  }

  _searchBy(String searchBy) {
    if (widget.label == widget.localizationsContext.amenities) {
      widget.addPropertyProvider.searchByAmenitiesName(searchBy);
    } else if (widget.label == widget.localizationsContext.preferredCast) {
      widget.addPropertyProvider.searchByPreferredCastName(searchBy);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final List<DbPropertyAmenity> amenitiesList = [];
    final List<DbPropertyPreferredCast> preferredCastList = [];
    if (widget.label == widget.localizationsContext.amenities) {
      amenitiesList.clear();
      if (widget.addPropertyProvider.amenitiesList.isNotEmpty &&
          (widget.addPropertyProvider.filterAmenitiesList.length ==
              widget.addPropertyProvider.amenitiesList.length)) {
        final allOptionItem = DbPropertyAmenity()
          ..id = widget.addPropertyProvider.selectDeselectAllItemId
          ..name = widget.localizationsContext.selectAllText;
        amenitiesList.add(allOptionItem);
      }
      amenitiesList.addAll(widget.addPropertyProvider.filterAmenitiesList);
    } else if (widget.label == widget.localizationsContext.preferredCast) {
      preferredCastList.clear();
      if (widget.addPropertyProvider.preferredCastList.isNotEmpty &&
          (widget.addPropertyProvider.filterPreferredCastList.length ==
              widget.addPropertyProvider.preferredCastList.length)) {
        final allOptionItem = DbPropertyPreferredCast()
          ..id = widget.addPropertyProvider.selectDeselectAllItemId
          ..name = widget.localizationsContext.selectAllText;
        preferredCastList.add(allOptionItem);
      }
      preferredCastList
          .addAll(widget.addPropertyProvider.filterPreferredCastList);
      _isPreferredCastWithEmptyList =
          widget.addPropertyProvider.preferredCastList.isEmpty;
    }
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: _isPreferredCastWithEmptyList
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            scrollbars: false,
            overscroll: false,
          ),
          child: ListView(
            controller: widget.scrollController,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ColoredBox(
                    color: StaticFunctions.getColor(
                      context,
                      ColorEnum.themeColorOpacity3Percentage,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: Dimensions.screenHorizontalMargin.w,
                        right: (Dimensions.screenHorizontalMargin / 2).w,
                        top: Dimensions.screenHorizontalMargin.h,
                        bottom: Dimensions.screenHorizontalMargin.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.label,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Dimensions.bottomSheetTitleTextSize.sp,
                              color: StaticFunctions.getColor(
                                context,
                                ColorEnum.blackColor,
                              ),
                            ),
                          ),
                          Container(
                            width: Dimensions.closeIconSize.w,
                            height: Dimensions.closeIconSize.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Dimensions.closeIconRippleRadius.r,
                              ),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                borderRadius: BorderRadius.circular(
                                  Dimensions.closeIconRippleRadius.r,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(
                                    Dimensions.closeIconPadding.w,
                                  ),
                                  child: SvgPicture.asset(
                                    Strings.iconClose,
                                    width: Dimensions.closeIconSize.w,
                                    height: Dimensions.closeIconSize.w,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (!_isPreferredCastWithEmptyList)
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.screenHorizontalMargin.w,
                        vertical: Dimensions.screenHorizontalMargin.h,
                      ),
                      child: SearchWidget(
                        searchHint: widget.label ==
                                widget.localizationsContext.amenities
                            ? widget.localizationsContext.searchAmenities
                            : widget.label ==
                                    widget.localizationsContext.preferredCast
                                ? widget.localizationsContext.searchCast
                                : '',
                        onSearch: (String searchBy) {
                          _searchBy(searchBy);
                        },
                        onTyping: (String searchBy) {
                          _searchBy(searchBy);
                        },
                      ),
                    ),
                  if (!_isPreferredCastWithEmptyList)
                    _selectedChips(widget.localizationsContext),
                  if (!_isPreferredCastWithEmptyList) LightDivider(),
                ],
              ),
            ],
          ),
        ),
        if ((widget.label == widget.localizationsContext.amenities &&
                amenitiesList.isNotEmpty) ||
            (widget.label == widget.localizationsContext.preferredCast &&
                preferredCastList.isNotEmpty))
          SizedBox(
            height: (Dimensions.chipListItemVerticalMargin * 2).h,
          ),
        if ((widget.label == widget.localizationsContext.amenities &&
                amenitiesList.isNotEmpty) ||
            (widget.label == widget.localizationsContext.preferredCast &&
                preferredCastList.isNotEmpty))
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                scrollbars: false,
                overscroll: false,
              ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                controller: widget.scrollController,
                itemCount: widget.label == widget.localizationsContext.amenities
                    ? amenitiesList.length
                    : widget.label == widget.localizationsContext.preferredCast
                        ? preferredCastList.length
                        : 0,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: StaticFunctions.getColor(
                        context,
                        ColorEnum.touchSplashColor,
                      ),
                      onTap: () {
                        final data = widget.label ==
                                widget.localizationsContext.amenities
                            ? amenitiesList[index]
                            : widget.label ==
                                    widget.localizationsContext.preferredCast
                                ? preferredCastList[index]
                                : null;
                        if (widget.label ==
                            widget.localizationsContext.amenities) {
                          widget.addPropertyProvider.updateAmenitiesSelection(
                            (data as DbPropertyAmenity).id,
                          );
                        } else if (widget.label ==
                            widget.localizationsContext.preferredCast) {
                          widget.addPropertyProvider
                              .updatePreferredCastSelection(
                            (data as DbPropertyPreferredCast).id,
                          );
                        }
                        setState(() {});
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.screenHorizontalMargin.w,
                          vertical: Dimensions.chipListItemVerticalMargin.h,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              (widget.label ==
                                          widget.localizationsContext.amenities
                                      ? widget.addPropertyProvider
                                          .isAmenitiesSelectedForId(
                                          amenitiesList[index].id,
                                        )
                                      : widget.label ==
                                              widget.localizationsContext
                                                  .preferredCast
                                          ? widget.addPropertyProvider
                                              .isPreferredCastSelectedForId(
                                              preferredCastList[index].id,
                                            )
                                          : false)
                                  ? Strings.iconCheckBoxSelected
                                  : Strings.iconCheckBoxUnSelected,
                              width: Dimensions.chipListItemIconSize.w,
                              height: Dimensions.chipListItemIconSize.w,
                            ),
                            SizedBox(
                              width: Dimensions.chipListItemIconTextSpacing.w,
                            ),
                            Text(
                              widget.label ==
                                      widget.localizationsContext.amenities
                                  ? amenitiesList[index].name
                                  : widget.label ==
                                          widget.localizationsContext
                                              .preferredCast
                                      ? preferredCastList[index].name
                                      : '',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: Dimensions.chipListItemTextSize.sp,
                                color: StaticFunctions.getColor(
                                  context,
                                  ColorEnum.blackColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        if ((widget.label == widget.localizationsContext.amenities &&
                amenitiesList.isEmpty) ||
            (widget.label == widget.localizationsContext.preferredCast &&
                widget.addPropertyProvider.filterPreferredCastList.isEmpty &&
                !_isPreferredCastWithEmptyList))
          Expanded(
            child: const SizedBox(),
          ),
        if (_isPreferredCastWithEmptyList)
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Strings.iconNoCastData,
                  height: Dimensions.castScreenNoDataIconSize.h,
                  width: Dimensions.castScreenNoDataIconSize.h,
                ),
                SizedBox(
                  height: Dimensions.castScreenNoDataContentSpacing.h,
                ),
                Text(
                  widget.localizationsContext.noCastWarning1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: StaticFunctions.getColor(
                      context,
                      ColorEnum.blackColor,
                    ),
                    fontWeight: FontWeight.w400,
                    fontSize: Dimensions.castScreenNoDataTextSize.sp,
                  ),
                ),
                Text(
                  widget.localizationsContext.noCastWarning2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: StaticFunctions.getColor(
                      context,
                      ColorEnum.blackColor,
                    ),
                    fontWeight: FontWeight.w400,
                    fontSize: Dimensions.castScreenNoDataTextSize.sp,
                  ),
                )
              ],
            ),
          ),
        _navigationWidget(
          context,
          widget.localizationsContext,
          widget.addPropertyProvider,
          true,
          // if done button only need to enable while any list item is selected then uncomment below:
          // widget.addPropertyProvider.tempSelectedAmenitiesList.isNotEmpty,
        ),
      ],
    );
  }
}
