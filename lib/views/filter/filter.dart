import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import './model/filter_search_by.dart';
import '../../common_property_data_provider.dart';
import '../../const/dimen_const.dart';
import '../../const/routes.dart';
import '../../const/string_const.dart';
import '../../localdb/helpers/db_locations_tags.dart';
import '../../localdb/properties/db_property_amenity.dart';
import '../../localdb/properties/db_property_bhk_type.dart';
import '../../localdb/properties/db_property_building_type.dart';
import '../../localdb/properties/db_property_construction_type.dart';
import '../../localdb/properties/db_property_facing_type.dart';
import '../../localdb/properties/db_property_for.dart';
import '../../localdb/properties/db_property_furnished_status.dart';
import '../../localdb/properties/db_property_preferred_cast.dart';
import '../../localdb/properties/db_property_scheme_type.dart';
import '../../localdb/properties/db_property_type.dart';
import '../../localdb/properties/db_saved_filter.dart';
import '../../localdb/save_default_data.dart';
import '../../utils/app_config.dart';
import '../../utils/choose_location_from_enum.dart';
import '../../utils/enums.dart';
import '../../utils/price_formatter.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../views/filter/filter_provider.dart';
import '../../views/filter/model/filter_screen_arg.dart';
import '../../views/filter/saved_filter_list_dialog_provider.dart';
import '../../views/filter/widget/measurement_field_widget.dart';
import '../../views/filter/widget/price_range_field_widget.dart';
import '../../views/filter/widget/property_type_item_widget.dart';
import '../../views/filter/widget/saved_filter_widget.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/checkbox_widget.dart';
import '../../widgets/light_divider.dart';
import '../../widgets/suggestion_field/suggestion_field_configuration.dart';
import '../../widgets/suggestion_field/suggestions_box/suggestions_box_decoration.dart';
import '../../widgets/suggestion_field/text_field_with_dropdown.dart';
import '../../widgets/suggestion_field_item.dart';
import '../../widgets/text_field_widget.dart';
import '../../widgets/toolbar.dart';
import '../add_property/model/options.dart';
import '../choose_location/fetch_location_provider.dart';
import '../choose_location/model/retrieve_location_arg.dart';
import '../common_widget/amenity_item_widget.dart';
import '../common_widget/checkbox_radio_item.dart';
import '../common_widget/incremental_item.dart';
import '../common_widget/preferred_cast_item_widget.dart';
import '../view_all_property/model/view_all_screen_arg.dart';

class Filter extends StatelessWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        (ModalRoute.of(context)?.settings.arguments as FilterScreenArg?);
    return ChangeNotifierProvider(
      create: (_) => FilterProvider(),
      builder: (_, __) => _Body(
        args: args,
      ),
    );
  }
}

class _Body extends StatefulWidget {
  final FilterScreenArg? args;

  _Body({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  FilterProvider? provider;
  late AppLocalizations localizationsContext;
  late Size size;

  @override
  void didChangeDependencies() {
    localizationsContext = AppLocalizations.of(context)!;
    size = MediaQuery.of(context).size;
    if (provider == null) {
      provider = Provider.of<FilterProvider>(
        context,
        listen: false,
      );
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) {
          provider!.init(context, widget.args);
        },
      );
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeConfig.appBar(
        context,
        statusBarColor: ColorEnum.whiteColor,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: StaticFunctions.getColor(
                context,
                ColorEnum.shadowColor,
              ),
              blurRadius: Dimensions.filterScreenBottomBarShadowRadius.r,
            ),
          ],
        ),
        child: Container(
          color: StaticFunctions.getColor(
            context,
            ColorEnum.whiteColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LightDivider(),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal:
                      Dimensions.filterScreenBottomButtonHorizontalSpacing.w,
                  vertical: Dimensions.bottomSheetVerticalPadding.h,
                ),
                child: Selector<FilterProvider, Tuple2<bool, bool>>(
                  shouldRebuild: (prev, next) => true,
                  selector: (_, state) => Tuple2(
                    state.doesFilterExists,
                    state.isValid,
                  ),
                  builder: (_, data, __) {
                    bool _shouldShowReset =
                        ((widget.args != null && !data.item1) || !data.item1);
                    return Row(
                      children: [
                        if (_shouldShowReset)
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                right: Dimensions
                                    .filterScreenBottomButtonSpacingBetween.w,
                              ),
                              child: ButtonWidget(
                                text: localizationsContext.resetFilter,
                                onClick: () {
                                  FocusScope.of(context).requestFocus(
                                    FocusNode(),
                                  );
                                  provider!.setData(shouldReset: true);
                                },
                                borderWidth: Dimensions
                                    .filterScreenBottomButtonBorderWidth.w,
                                textColor: StaticFunctions.getColor(
                                  context,
                                  ColorEnum.themeColor,
                                ),
                                borderColor: StaticFunctions.getColor(
                                  context,
                                  ColorEnum.themeColor,
                                ),
                                bgColor: StaticFunctions.getColor(
                                  context,
                                  ColorEnum.themeColorOpacity3Percentage,
                                ),
                              ),
                            ),
                          ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              left: _shouldShowReset
                                  ? Dimensions
                                      .filterScreenBottomButtonSpacingBetween.w
                                  : 0,
                            ),
                            child: ButtonWidget(
                              text: localizationsContext.applyFilter,
                              onClick: data.item2
                                  ? () => provider!.applyFilter(context)
                                  : null,
                              borderWidth: Dimensions
                                  .filterScreenBottomButtonBorderWidth.w,
                              borderColor: StaticFunctions.getColor(
                                context,
                                data.item2
                                    ? ColorEnum.themeColor
                                    : ColorEnum.borderColorE0,
                              ),
                              textColor: StaticFunctions.getColor(
                                context,
                                data.item2
                                    ? ColorEnum.whiteColor
                                    : ColorEnum.gray90Color,
                              ),
                              bgColor: StaticFunctions.getColor(
                                context,
                                data.item2
                                    ? ColorEnum.themeColor
                                    : ColorEnum.themeColorOpacity3Percentage,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Selector<FilterProvider, DbSavedFilter?>(
                shouldRebuild: (prev, next) => true,
                selector: (_, state) => state.filterToEdit,
                builder: (_, isFilterSaved, __) {
                  return FutureBuilder(
                    future: provider?.getFilterTitle(
                      localizationsContext,
                      widget.args?.propertyType,
                    ),
                    builder: (context, snapshot) {
                      return ToolBar(
                        title: snapshot.data ?? provider!.filterTitle,
                        enableBackground: true,
                      );
                    },
                  );
                },
              ),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                      child: Column(
                        children: [
                          /*Selector<
                              FilterProvider,
                              Tuple3<List<DbSavedFilter>, List<DbSavedFilter>,
                                  DbSavedFilter?>>(
                            shouldRebuild: (prev, next) => true,
                            selector: (_, state) => Tuple3(
                              state.filterListToDisplay,
                              state.originalFilterList,
                              state.filterToEdit,
                            ),
                            builder: (context, savedFilterData, child) {
                              return AnimatedSwitcher(
                                switchInCurve: Curves.easeIn,
                                switchOutCurve: Curves.easeOut,
                                duration: const Duration(
                                  milliseconds: 100,
                                ),
                                child:
                                    savedFilterData.item3 == null &&
                                            savedFilterData.item2.isNotEmpty
                                        ? Column(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: Dimensions
                                                      .screenHorizontalMargin.w,
                                                ),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          SizedBox(
                                                            height: Dimensions
                                                                .filterScreenSubtitleTextTopSpacing
                                                                .h,
                                                          ),
                                                          Card(
                                                            color:
                                                                StaticFunctions
                                                                    .getColor(
                                                              context,
                                                              ColorEnum
                                                                  .whiteColor,
                                                            ),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                Dimensions
                                                                    .searchFilterFieldBorderRadius
                                                                    .r,
                                                              ),
                                                              side: BorderSide(
                                                                color:
                                                                    StaticFunctions
                                                                        .getColor(
                                                                  context,
                                                                  ColorEnum
                                                                      .grayColor,
                                                                ),
                                                                width: Dimensions
                                                                    .searchFilterFieldBorderWidth
                                                                    .w,
                                                              ),
                                                            ),
                                                            margin:
                                                                EdgeInsets.zero,
                                                            elevation: Dimensions
                                                                .searchFilterCardElevation,
                                                            child: Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                horizontal:
                                                                    Dimensions
                                                                        .searchFilterBoxInnerHorizontalSpacing
                                                                        .w,
                                                                vertical: Dimensions
                                                                    .searchFilterBoxInnerVerticalSpacing
                                                                    .h,
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  SvgPicture
                                                                      .asset(
                                                                    Strings
                                                                        .iconSearchFilter,
                                                                    height: Dimensions
                                                                        .searchFilterFieldIconSize
                                                                        .h,
                                                                    width: Dimensions
                                                                        .searchFilterFieldIconSize
                                                                        .h,
                                                                    color: StaticFunctions
                                                                        .getColor(
                                                                      context,
                                                                      ColorEnum
                                                                          .gray90Color,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      margin: EdgeInsets
                                                                          .only(
                                                                        left: Dimensions
                                                                            .searchFilterTextFieldHorizontalSpacing
                                                                            .w,
                                                                      ),
                                                                      child: Selector<
                                                                          FilterProvider,
                                                                          Tuple2<
                                                                              TextEditingController,
                                                                              FocusNode>>(
                                                                        shouldRebuild:
                                                                            (prev, next) =>
                                                                                true,
                                                                        selector:
                                                                            (_, state) =>
                                                                                Tuple2(
                                                                          state
                                                                              .searchFieldController,
                                                                          state
                                                                              .searchFieldFocusNode,
                                                                        ),
                                                                        builder: (context,
                                                                            searchTuple,
                                                                            child) {
                                                                          return TextField(
                                                                            autocorrect:
                                                                                false,
                                                                            enableSuggestions:
                                                                                false,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              hintText: localizationsContext.searchFilter,
                                                                              hintStyle: TextStyle(
                                                                                fontWeight: FontWeight.w400,
                                                                                fontSize: Dimensions.searchFilterFieldFontSize.sp,
                                                                                color: StaticFunctions.getColor(
                                                                                  context,
                                                                                  ColorEnum.gray90Color,
                                                                                ),
                                                                              ),
                                                                              contentPadding: EdgeInsets.symmetric(
                                                                                horizontal: Dimensions.searchFilterFieldInnerHorizontalSpacing.w,
                                                                                vertical: Dimensions.searchFilterFieldInnerVerticalSpacing.h,
                                                                              ),
                                                                              border: InputBorder.none,
                                                                            ),
                                                                            cursorColor:
                                                                                StaticFunctions.getColor(
                                                                              context,
                                                                              ColorEnum.blackColor,
                                                                            ),
                                                                            maxLines:
                                                                                1,
                                                                            controller:
                                                                                searchTuple.item1,
                                                                            focusNode:
                                                                                searchTuple.item2,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            onChanged: (value) =>
                                                                                provider!.searchFilter(),
                                                                            style:
                                                                                TextStyle(
                                                                              fontWeight: FontWeight.w400,
                                                                              fontSize: Dimensions.searchFilterFieldFontSize.sp,
                                                                              color: StaticFunctions.getColor(
                                                                                context,
                                                                                ColorEnum.blackColor,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: Dimensions
                                                          .filterScreenSubtitleTextTopSpacing
                                                          .h,
                                                    ),
                                                    Container(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            localizationsContext
                                                                .savedFilters,
                                                            style: TextStyle(
                                                              fontSize:
                                                                  subtitleTextSize,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color:
                                                                  StaticFunctions
                                                                      .getColor(
                                                                context,
                                                                ColorEnum
                                                                    .blueColor,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: Dimensions
                                                                .filterScreenSubtitleAndContentBetweenSpace
                                                                .h,
                                                          ),
                                                          ListView.builder(
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return SavedFilterWidget(
                                                                filter:
                                                                    savedFilterData
                                                                            .item1[
                                                                        index],
                                                                onDelete: () =>
                                                                    provider!
                                                                        .deleteFilter(
                                                                  context,
                                                                  savedFilterData
                                                                          .item1[
                                                                      index],
                                                                ),
                                                                onEdit: (isEdit) => provider!.onItemSelected(
                                                                    context,
                                                                    filter: savedFilterData
                                                                            .item1[
                                                                        index],
                                                                    isEditPressed:
                                                                        isEdit),
                                                                isLast: index ==
                                                                    savedFilterData
                                                                            .item1
                                                                            .length -
                                                                        1,
                                                              );
                                                            },
                                                            shrinkWrap: true,
                                                            itemCount:
                                                                savedFilterData
                                                                    .item1
                                                                    .length,
                                                            physics:
                                                                const BouncingScrollPhysics(),
                                                          ),
                                                          InkWell(
                                                            onTap: () =>
                                                                _showSavedFilterDialog(
                                                              context,
                                                              byPropertyType: widget
                                                                  .args
                                                                  ?.propertyType,
                                                            ),
                                                            child: Text(
                                                              localizationsContext
                                                                  .viewAllFilters,
                                                              style: TextStyle(
                                                                fontSize: Dimensions
                                                                    .savedFilterViewAllTextSize
                                                                    .sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color:
                                                                    StaticFunctions
                                                                        .getColor(
                                                                  context,
                                                                  ColorEnum
                                                                      .themeColor,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: Dimensions
                                                                .filterScreenSubtitleTextTopSpacing
                                                                .h,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              LightDivider(),
                                              SizedBox(
                                                height: Dimensions
                                                    .filterScreenSavedFilterBottomSpacing
                                                    .h,
                                              ),
                                            ],
                                          )
                                        : const SizedBox(),
                              );
                            },
                          ),*/
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: Dimensions.screenHorizontalMargin.w,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Selector<
                                      FilterProvider,
                                      Tuple3<List<DbSavedFilter>,
                                          List<DbSavedFilter>, DbSavedFilter?>>(
                                    shouldRebuild: (prev, next) => true,
                                    selector: (_, state) => Tuple3(
                                      state.filterListToDisplay,
                                      state.originalFilterList,
                                      state.filterToEdit,
                                    ),
                                    builder: (context, savedFilterData, child) {
                                      return AnimatedSwitcher(
                                        switchInCurve: Curves.easeIn,
                                        switchOutCurve: Curves.easeOut,
                                        duration: const Duration(
                                          milliseconds: 100,
                                        ),
                                        child: savedFilterData.item3 == null &&
                                                savedFilterData.item2.isNotEmpty
                                            ? Column(
                                                children: [
                                                  InkWell(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      Dimensions
                                                          .settingListItemBorderRadius
                                                          .r,
                                                    ),
                                                    onTap: () =>
                                                        _showSavedFilterDialog(
                                                      context,
                                                      byPropertyType: widget
                                                          .args?.propertyType,
                                                    ),
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        vertical: Dimensions
                                                            .settingListItemVerticalPadding
                                                            .h,
                                                        horizontal: Dimensions
                                                            .settingListItemHorizontalPadding
                                                            .w,
                                                      ),
                                                      margin: EdgeInsets.zero,
                                                      decoration: BoxDecoration(
                                                        color: StaticFunctions
                                                            .getColor(
                                                          context,
                                                          ColorEnum
                                                              .blueColorOpacity2Percentage,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          Dimensions
                                                              .settingListItemBorderRadius
                                                              .r,
                                                        ),
                                                        border: Border.all(
                                                          width: Dimensions
                                                              .settingListItemBorderWidth
                                                              .w,
                                                          color: StaticFunctions
                                                              .getColor(
                                                            context,
                                                            ColorEnum
                                                                .borderColorE0,
                                                          ),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            localizationsContext
                                                                .viewAllSavedFilters,
                                                            style: TextStyle(
                                                              fontSize: Dimensions
                                                                  .viewSavedFilterTitleFontSize
                                                                  .sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  StaticFunctions
                                                                      .getColor(
                                                                context,
                                                                ColorEnum
                                                                    .blackColor,
                                                              ),
                                                            ),
                                                          ),
                                                          SvgPicture.asset(
                                                            Strings
                                                                .iconDownArrow,
                                                            height: Dimensions
                                                                .viewSavedFilterTitleArrowSize
                                                                .h,
                                                            width: Dimensions
                                                                .viewSavedFilterTitleArrowSize
                                                                .w,
                                                            color:
                                                                StaticFunctions
                                                                    .getColor(
                                                              context,
                                                              ColorEnum
                                                                  .gray90Color,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: Dimensions
                                                        .addBuyerBasicDetailFieldsPadding
                                                        .h,
                                                  ),
                                                ],
                                              )
                                            : const SizedBox(),
                                      );
                                    },
                                  ),
                                  /*Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SizedBox(
                                          height: Dimensions
                                              .filterScreenSubtitleTextTopSpacing
                                              .h,
                                        ),
                                        Selector<FilterProvider,
                                            TextEditingController>(
                                          selector: (_, state) => state
                                              .filterQueryFieldController,
                                          shouldRebuild: (prev, next) => true,
                                          builder:
                                              (context, controller, child) {
                                            return TextFieldWidget(
                                              hint: localizationsContext
                                                  .filterSearchByTextHint,
                                              controller: controller,
                                              onValueChanged:
                                                  (index, value) {},
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: Dimensions
                                        .filterScreenSubtitleAndContentBetweenSpace
                                        .h,
                                  ),*/
                                  _searchPropertyOrInquiryWidget(context),
                                  _propertyForWidget(context),
                                  // Property type is available now. No need to show Filter properties | Bungalow
                                  // As we are not going to restrict user to change property type
                                  // if (widget.args?.propertyType == null)
                                  _propertyTypeWidget(context),
                                  Selector<FilterProvider,
                                      List<DbPropertyType>>(
                                    shouldRebuild: (prev, next) => true,
                                    selector: (_, state) =>
                                        state.propertyTypeList,
                                    builder: (_, _data, __) {
                                      final _selectedPropertyTypes = _data
                                          .where(
                                              (element) => element.isSelected)
                                          .map((e) => e.id)
                                          .toList();
                                      return Column(
                                        children: [
                                          _measureWidget(context),
                                          _priceRangeWidget(context),
                                          _locationWidget(context),
                                          if (_selectedPropertyTypes.isEmpty ||
                                              CommonPropertyDataProvider
                                                  .checkForBathRoom(
                                                      _selectedPropertyTypes))
                                            _bathRoomWidget(),
                                          if (_selectedPropertyTypes.isEmpty ||
                                              CommonPropertyDataProvider
                                                  .checkForRoom(
                                                      _selectedPropertyTypes))
                                            _roomsWidget(),
                                          if (_selectedPropertyTypes.isEmpty ||
                                              CommonPropertyDataProvider
                                                  .checkForFloor(
                                                      _selectedPropertyTypes))
                                            _floorWidget(),
                                          if (_selectedPropertyTypes.isEmpty ||
                                              CommonPropertyDataProvider
                                                  .checkForTotalFloor(
                                                      _selectedPropertyTypes))
                                            _totalFloorWidget(),
                                          if (_selectedPropertyTypes.isEmpty ||
                                              CommonPropertyDataProvider
                                                  .checkForFrontDepthSize(
                                                      _selectedPropertyTypes))
                                            _frontSizeWidget(),
                                          if (_selectedPropertyTypes.isEmpty ||
                                              CommonPropertyDataProvider
                                                  .checkForFrontDepthSize(
                                                      _selectedPropertyTypes))
                                            _depthSizeWidget(),
                                          if (_selectedPropertyTypes.isEmpty ||
                                              CommonPropertyDataProvider
                                                  .checkForBuildingType(
                                                      _selectedPropertyTypes))
                                            _buildingTypeWidget(context),
                                          if (_selectedPropertyTypes.isEmpty ||
                                              CommonPropertyDataProvider
                                                  .checkForBhk(
                                                      _selectedPropertyTypes))
                                            _bhkWidget(context),
                                          if (_selectedPropertyTypes.isEmpty ||
                                              CommonPropertyDataProvider
                                                  .checkForFacingType(
                                                      _selectedPropertyTypes))
                                            _facingWidget(context),
                                          if (_selectedPropertyTypes.isEmpty ||
                                              CommonPropertyDataProvider
                                                  .checkForConnectedRoad(
                                                      _selectedPropertyTypes))
                                            _connectedRoadsWidget(context),
                                          if (_selectedPropertyTypes.isEmpty ||
                                              CommonPropertyDataProvider
                                                  .checkForConstruction(
                                                      _selectedPropertyTypes))
                                            _constructionWidget(context),
                                          if (_selectedPropertyTypes.isEmpty ||
                                              CommonPropertyDataProvider
                                                  .checkForScheme(
                                                      _selectedPropertyTypes))
                                            _schemeWidget(context),
                                          if (_selectedPropertyTypes.isEmpty ||
                                              CommonPropertyDataProvider
                                                  .isNotPlotOrLandMark(
                                                      _selectedPropertyTypes))
                                            _furnishedWidget(context),
                                          /* TODO: Additional furnishing is hidden
                                          if (_selectedPropertyTypes.isEmpty ||
                                              CommonPropertyDataProvider
                                                  .isNotPlotOrLandMark(
                                                      _selectedPropertyTypes))
                                            _additionalFurnishingWidget(),*/
                                          if (_selectedPropertyTypes.isEmpty ||
                                              CommonPropertyDataProvider
                                                  .checkForWashRoomAvailable(
                                                      _selectedPropertyTypes))
                                            _washroomWidget(context),
                                          if (_selectedPropertyTypes.isEmpty ||
                                              CommonPropertyDataProvider
                                                  .isNotPlotOrLandMark(
                                                      _selectedPropertyTypes))
                                            _balconyWidget(context),
                                          if (_selectedPropertyTypes.isEmpty ||
                                              CommonPropertyDataProvider
                                                  .checkForCornerPiece(
                                                      _selectedPropertyTypes))
                                            _cornerPieceWidget(context),
                                          if (_selectedPropertyTypes.isEmpty ||
                                              CommonPropertyDataProvider
                                                  .checkForLightConnection(
                                                      _selectedPropertyTypes))
                                            _lightConnectionWidget(context),
                                          if (_selectedPropertyTypes.isEmpty ||
                                              CommonPropertyDataProvider
                                                  .checkForWellAvailable(
                                                      _selectedPropertyTypes))
                                            _wellWidget(context),
                                          if (_selectedPropertyTypes.isEmpty ||
                                              CommonPropertyDataProvider
                                                  .checkForAllottedParkingAvailable(
                                                      _selectedPropertyTypes))
                                            _allottedParkingWidget(context),
                                          if (_selectedPropertyTypes.isEmpty ||
                                              CommonPropertyDataProvider
                                                  .checkForParkingAvailable(
                                                      _selectedPropertyTypes))
                                            _parkingWidget(context),
                                          if (_selectedPropertyTypes.isEmpty ||
                                              CommonPropertyDataProvider
                                                  .checkForLiftAvailable(
                                                      _selectedPropertyTypes))
                                            _liftWidget(context),
                                          _preferredCastWidget(context),
                                          if (_selectedPropertyTypes.isEmpty ||
                                              CommonPropertyDataProvider
                                                  .isNotPlotOrLandMark(
                                                      _selectedPropertyTypes))
                                            _amenitiesWidget(context),
                                        ],
                                      );
                                    },
                                  ),
                                  if (widget.args?.viewAllType !=
                                          ViewAllFromType.buyers &&
                                      widget.args?.viewAllType !=
                                          ViewAllFromType.sellers)
                                    _inactiveAndClosedOptionWidget(),
                                  SizedBox(
                                    height:
                                        Dimensions.filterScreenBottomSpacing.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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

  Widget _headerTitleWidget(
    BuildContext context,
    String title,
  ) {
    return Text(
      title,
      style: TextStyle(
        fontSize: Dimensions.propertySubTitleTextSize.sp,
        fontWeight: FontWeight.w500,
        color: StaticFunctions.getColor(
          context,
          ColorEnum.blueColor,
        ),
      ),
    );
  }

  _searchPropertyOrInquiryWidget(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        _headerTitleWidget(
          context,
          '${localizationsContext.filterPropertySearch}',
        ),
        SizedBox(
          height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
        ),
        Selector<FilterProvider, List<FilterSearchBy>>(
          selector: (_, state) => state.filterSearchBy,
          shouldRebuild: (prev, next) => true,
          builder: (context, list, child) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: list.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Dimensions.facingCountPerLine,
                crossAxisSpacing: Dimensions.checkBoxRadioBoxBetweenSpacing.h,
                mainAxisSpacing: Dimensions.checkBoxRadioBoxBetweenSpacing.h,
                childAspectRatio: (Dimensions.checkBoxRadioBoxAspectRatioWidth /
                    Dimensions.facingAspectRatioHeight),
              ),
              itemBuilder: (context, index) {
                return CheckboxRadioItem(
                  id: list[index].id,
                  name: list[index].value,
                  isSelected: list[index].isSelected,
                  onSelect: (selectedId) {
                    provider?.selectFilterSearchBy(
                      selectedId: list[index].id,
                      isUserTapped: true,
                    );
                  },
                  isSingleSelection: false,
                );
              },
            );
          },
        ),
      ],
    );
  }

  _propertyForWidget(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailFieldsPadding.h,
        ),
        _headerTitleWidget(
          context,
          '${localizationsContext.filterPropertyFor}*',
        ),
        SizedBox(
          height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
        ),
        Selector<FilterProvider,
            Tuple2<List<DbPropertyFor>, List<FilterSearchBy>>>(
          selector: (_, state) =>
              Tuple2(state.propertyForList, state.filterSearchBy),
          shouldRebuild: (prev, next) => true,
          builder: (context, tuple, child) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: tuple.item1.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Dimensions.propertyForCountPerLine,
                crossAxisSpacing: Dimensions.checkBoxRadioBoxBetweenSpacing.h,
                mainAxisSpacing: Dimensions.checkBoxRadioBoxBetweenSpacing.h,
                childAspectRatio: (Dimensions.checkBoxRadioBoxAspectRatioWidth /
                    Dimensions.propertyForAspectRatioHeight),
              ),
              itemBuilder: (context, index) {
                final currentItem = tuple.item1[index];
                return CheckboxRadioItem(
                  id: currentItem.id,
                  name: currentItem.id == SaveDefaultData.propertyForSellId
                      ? (provider?.getPropertyForNameBasedOnSearchBy() ?? true)
                          ? localizationsContext.sell
                          : localizationsContext.buy
                      : currentItem.name,
                  isSelected: currentItem.isSelected,
                  onSelect: (selectedId) => provider?.selectPropertyFor(
                    selectedId,
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  _propertyTypeWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailFieldsPadding.h,
        ),
        _headerTitleWidget(
          context,
          '${localizationsContext.filterProperties}*',
        ),
        SizedBox(
          height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
        ),
        Selector<FilterProvider, List<DbPropertyType>>(
          selector: (_, state) => state.propertyTypeList,
          shouldRebuild: (prev, next) => true,
          builder: (context, list, child) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: list.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width < 700
                    ? Dimensions.propertyTypesCountPerLineInPhone
                    : Dimensions.propertyTypesCountPerLineInWeb,
                crossAxisSpacing: Dimensions.propertyTypesHorizontalSpacing.h,
                mainAxisSpacing: Dimensions.propertyTypesVerticalSpacing.h,
                childAspectRatio: (Dimensions.propertyTypeBoxAspectRatioWidth /
                    Dimensions.propertyTypeBoxAspectRatioHeight),
              ),
              itemBuilder: (BuildContext context, int index) {
                return PropertyTypeItem(
                  propertyType: list[index],
                  onSelect: (selectedModel) => provider?.selectPropertyType(
                    selection: [selectedModel],
                    isUserTapped: true,
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  _priceRangeWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailFieldsPadding.h,
        ),
        _headerTitleWidget(
          context,
          '${localizationsContext.priceRangeFilter}',
        ),
        SizedBox(
          height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Dimensions.priceRangeContainerBorderRadius.r,
            ),
            border: Border.all(
              color: StaticFunctions.getColor(
                context,
                ColorEnum.borderColorE0,
              ),
              width: Dimensions.priceRangeContainerBorderWidth.w,
            ),
            color: StaticFunctions.getColor(
              context,
              ColorEnum.themeColorOpacity3Percentage,
            ),
          ),
          padding: EdgeInsets.all(
            Dimensions.priceRangeContainerPadding.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    PriceRangeField(
                      isItMinRange: true,
                    ),
                    SizedBox(
                      width: Dimensions.priceRangeItemBetweenSpacing.w,
                    ),
                    PriceRangeField(
                      isItMinRange: false,
                    ),
                  ],
                ),
              ),
              Selector<FilterProvider, String>(
                shouldRebuild: (prev, next) => true,
                selector: (_, state) => state.priceRangeText,
                builder: (_, priceText, __) {
                  if (priceText.trim().isEmpty) {
                    return SizedBox();
                  }
                  return Column(
                    children: [
                      SizedBox(
                        height: Dimensions
                            .priceRangeDisplayTextAndFieldBetweenSpace.h,
                      ),
                      Text(
                        priceText,
                        style: TextStyle(
                          color: StaticFunctions.getColor(
                            context,
                            ColorEnum.themeColor,
                          ),
                          fontSize: Dimensions.priceRangeDisplayTextSize.sp,
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: Dimensions
                    .addBuyerFilterSubtitleAndDropdownFieldBetweenSpace.h,
              ),
              Container(
                child: Row(
                  children: [
                    _priceBySizeForWidget(
                      context,
                      isItMinRange: true,
                    ),
                    SizedBox(
                      width: Dimensions.priceRangeItemBetweenSpacing.w,
                    ),
                    _priceBySizeForWidget(
                      context,
                      isItMinRange: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _priceBySizeForWidget(
    BuildContext context, {
    bool isItMinRange = false,
  }) {
    return Expanded(
      child: SizedBox(
        height: Dimensions.measurementTextFieldHeight.h,
        child: Stack(
          children: [
            Selector<FilterProvider, Tuple2<FocusNode, TextEditingController>>(
              shouldRebuild: (prev, next) => true,
              selector: (_, state) => isItMinRange
                  ? Tuple2(
                      state.minPricePerSizeFocusNode,
                      state.minPricePerSizeController,
                    )
                  : Tuple2(
                      state.maxPricePerSizeFocusNode,
                      state.maxPricePerSizeController,
                    ),
              builder: (context, data, child) {
                String value = data.item2.text.toString();
                if (value.trim().isEmpty &&
                    provider!.measurementDropdownUnitList.isNotEmpty) {
                  final defaultUnitId = provider!.getDefaultPriceUnitId();
                  value = provider!.measurementDropdownUnitList
                      .firstWhere((element) => element.id == defaultUnitId)
                      .unit;
                }
                return TextFieldWidget(
                  label: localizationsContext.bySizeText,
                  focusNode: data.item1,
                  keyBoardType: TextInputType.number,
                  inputFormatter: [
                    FilteringTextInputFormatter.deny(RegExp("[,]")),
                    FilteringTextInputFormatter.deny(RegExp("[.]")),
                    PriceFormatter(),
                  ],
                  backgroundColor: StaticFunctions.getColor(
                    context,
                    ColorEnum.whiteColor,
                  ),
                  contentPadding: EdgeInsets.only(
                    left: Dimensions.fieldContentPaddingWidth.w,
                    right: Dimensions.fieldContentPaddingWidth.w / 2,
                    top: Dimensions.fieldContentPaddingHeight.h,
                  ),
                  keepLabelAlwaysOnTop: true,
                  inputAction: TextInputAction.done,
                  controller: data.item2,
                  maxLength: AppConfig.maxLengthForPrice,
                  /*pricePrefixValue: '${StaticFunctions.defaultPriceUnit} ',*/
                  onValueChanged: (int? currentIndex, String value) =>
                      provider!.onPriceBySizeChange(isItMinRange: isItMinRange),
                );
              },
            ),
            Positioned(
              right: Dimensions.measurementDropdownMenuContentPadding.w,
              top: 0,
              bottom: 0,
              child: Center(
                child: Selector<FilterProvider, TextEditingController>(
                  shouldRebuild: (prev, next) => true,
                  selector: (_, state) => state.measureUnitTextFieldController,
                  builder: (context, controller, child) {
                    return Row(
                      children: [
                        Text(
                          ' / ',
                          style: TextStyle(
                            fontSize: Dimensions.measurementDropdownTextSize.sp,
                            color: StaticFunctions.getColor(
                              context,
                              ColorEnum.dividerColor,
                            ),
                          ),
                        ),
                        Text(
                          controller.text,
                          style: TextStyle(
                            fontSize: Dimensions.measurementDropdownTextSize.sp,
                            color: StaticFunctions.getColor(
                              context,
                              ColorEnum.blackColor,
                            ),
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _locationWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailFieldsPadding.h,
        ),
        _headerTitleWidget(
          context,
          '${localizationsContext.location}',
        ),
        SizedBox(
          height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Dimensions.priceRangeContainerBorderRadius.r,
            ),
            border: Border.all(
              color: StaticFunctions.getColor(
                context,
                ColorEnum.borderColorE0,
              ),
              width: Dimensions.priceRangeContainerBorderWidth.w,
            ),
            color: StaticFunctions.getColor(
              context,
              ColorEnum.themeColorOpacity3Percentage,
            ),
          ),
          padding: EdgeInsets.all(
            Dimensions.priceRangeContainerPadding.w,
          ),
          child: Stack(
            children: [
              Selector<FilterProvider,
                  Tuple2<TextEditingController, RetrieveLocationArg?>>(
                shouldRebuild: (prev, next) => true,
                selector: (_, state) => Tuple2(
                  state.propertyLocationController,
                  state.locationArguments,
                ),
                builder: (context, tuple, child) {
                  return TextFieldWithDropdown(
                    getImmediateSuggestions: false,
                    hideOnEmpty: true,
                    hideKeyboardOnDrag: false,
                    hideSuggestionsOnKeyboardHide: false,
                    suggestionsBoxDecoration: SuggestionsBoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimensions.borderRadius.r,
                      ),
                    ),
                    textFieldConfiguration: SuggestionFieldConfiguration(
                      controller: tuple.item1,
                      placeholder: localizationsContext.enterAddress,
                      backgroundColor: StaticFunctions.getColor(
                        context,
                        ColorEnum.whiteColor,
                      ),
                      suffixIconPath: Strings.iconSelectLocation,
                      suffixIconColor: StaticFunctions.getColor(
                        context,
                        tuple.item2?.coordinates != null
                            ? ColorEnum.themeColor
                            : ColorEnum.gray99Color,
                      ),
                      onChanged: (value) {},
                    ),
                    suggestionsCallback: (pattern) {
                      return provider!.getFilteredLocation(pattern);
                    },
                    loadingBuilder: (context) => SizedBox(),
                    noItemsFoundBuilder: (context) => SizedBox(),
                    itemBuilder: (
                      context,
                      DbLocationTags suggestion,
                      bool showDivider,
                    ) {
                      return SuggestionItemWidget(
                        title: suggestion.tag!,
                        showDivider: showDivider,
                      );
                    },
                    onSuggestionSelected: (DbLocationTags suggestion) {
                      provider!.selectLocationSuggestion(
                        context,
                        suggestion,
                      );
                    },
                  );
                },
              ),
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: StaticFunctions.getColor(
                      context,
                      ColorEnum.touchSplashColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      Dimensions.fieldCornerRadius.r,
                    ),
                    onTap: () {
                      StaticFunctions.unFocusKeyboardIfAny(context);
                      Navigator.pushNamed(
                        context,
                        Routes.chooseLocation,
                        arguments: ChooseLocationFrom.addProperty,
                      ).then(
                        (result) async {
                          if (result != null && result is RetrieveLocationArg) {
                            provider!.updateLocationInfo(result);
                            if (result.placeId != null &&
                                result.placeId!.toString().trim().isNotEmpty) {
                              final response =
                                  await Provider.of<FetchLocationProvider>(
                                context,
                                listen: false,
                              ).callToRetrieveCoordinatesFromGooglePlaceId(
                                result,
                              );
                              provider!.updateLocationInfo(response);
                            }
                          }
                        },
                      );
                    },
                    child: SizedBox(
                      width: Dimensions.addPropertyChooseLocationWidth.w,
                      child: Text(''),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _measureWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailFieldsPadding.h,
        ),
        _headerTitleWidget(
          context,
          '${localizationsContext.totalSize}',
        ),
        SizedBox(
          height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Dimensions.priceRangeContainerBorderRadius.r,
            ),
            border: Border.all(
              color: StaticFunctions.getColor(
                context,
                ColorEnum.borderColorE0,
              ),
              width: Dimensions.priceRangeContainerBorderWidth.w,
            ),
            color: StaticFunctions.getColor(
              context,
              ColorEnum.themeColorOpacity3Percentage,
            ),
          ),
          padding: EdgeInsets.all(
            Dimensions.priceRangeContainerPadding.w,
          ),
          child: Selector<FilterProvider, int>(
            shouldRebuild: (prev, next) => true,
            selector: (_, state) => state.selectedMeasureUnit,
            builder: (context, selectedMeasureUnit, child) {
              return Row(
                children: [
                  MeasureField(
                    isItMinRange: true,
                  ),
                  SizedBox(
                    width: Dimensions.measurementTextFieldBetweenSpace.w,
                  ),
                  MeasureField(
                    isItMinRange: false,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  _buildingTypeWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailFieldsPadding.h,
        ),
        _headerTitleWidget(
          context,
          localizationsContext.buildingType,
        ),
        SizedBox(
          height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
        ),
        Selector<FilterProvider, List<DbPropertyBuildingType>>(
          selector: (_, state) => state.buildingTypeList,
          shouldRebuild: (prev, next) => true,
          builder: (context, list, child) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: list.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Dimensions.buildingTypeCountPerLine,
                crossAxisSpacing: Dimensions.buildingTypeBoxBetweenSpacing.h,
                mainAxisSpacing: Dimensions.buildingTypeBoxBetweenSpacing.h,
                childAspectRatio: (Dimensions.buildingTypeBoxAspectRatioWidth /
                    Dimensions.buildingTypeBoxAspectRatioHeight),
              ),
              itemBuilder: (context, index) {
                final currentItem = list[index];
                final selectedItem = list.firstWhereOrNull(
                  (element) => element.isSelected,
                );
                return CheckboxRadioItem(
                  id: currentItem.id,
                  name: currentItem.name,
                  isSelected: currentItem.isSelected,
                  selectedId: selectedItem?.id ?? -1,
                  isSingleSelection: true,
                  onSelect: (value) => provider?.selectBuildingType(
                    selection: [currentItem],
                    isUserTapped: true,
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  _constructionWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailFieldsPadding.h,
        ),
        _headerTitleWidget(
          context,
          localizationsContext.construction,
        ),
        SizedBox(
          height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
        ),
        Selector<FilterProvider, List<DbPropertyConstructionType>>(
          selector: (_, state) => state.constructionTypeList,
          shouldRebuild: (prev, next) => true,
          builder: (context, constructionList, child) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: constructionList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Dimensions.constructionTypeCountPerLine,
                crossAxisSpacing:
                    Dimensions.constructionTypeBoxBetweenSpacing.h,
                mainAxisSpacing: Dimensions.constructionTypeBoxBetweenSpacing.h,
                childAspectRatio:
                    (Dimensions.constructionTypeBoxAspectRatioWidth /
                        Dimensions.constructionTypeBoxAspectRatioHeight),
              ),
              itemBuilder: (context, index) {
                final currentItem = constructionList[index];
                final selectedItem = constructionList.firstWhereOrNull(
                  (element) => element.isSelected,
                );
                return CheckboxRadioItem(
                  id: currentItem.id,
                  name: currentItem.name,
                  isSelected: currentItem.isSelected,
                  selectedId: selectedItem?.id ?? -1,
                  isSingleSelection: true,
                  onSelect: (value) => provider?.selectConstructionType(
                    selection: [currentItem],
                    isUserTapped: true,
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  _schemeWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailFieldsPadding.h,
        ),
        _headerTitleWidget(
          context,
          localizationsContext.scheme,
        ),
        SizedBox(
          height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
        ),
        Selector<FilterProvider, List<DbPropertySchemeType>>(
          selector: (_, state) => state.schemeTypeList,
          shouldRebuild: (prev, next) => true,
          builder: (context, list, child) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: list.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Dimensions.schemeCountPerLine,
                crossAxisSpacing: Dimensions.schemeBoxBetweenSpacing.h,
                mainAxisSpacing: Dimensions.schemeBoxBetweenSpacing.h,
                childAspectRatio: (Dimensions.schemeBoxAspectRatioWidth /
                    Dimensions.schemeBoxAspectRatioHeight),
              ),
              itemBuilder: (context, index) {
                final currentItem = list[index];
                final selectedItem = list.firstWhereOrNull(
                  (element) => element.isSelected,
                );
                return CheckboxRadioItem(
                  id: currentItem.id,
                  name: currentItem.name,
                  isSelected: currentItem.isSelected,
                  selectedId: selectedItem?.id ?? -1,
                  isSingleSelection: true,
                  onSelect: (value) => provider?.selectSchemeType(
                    selection: [currentItem],
                    isUserTapped: true,
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  _washroomWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailFieldsPadding.h,
        ),
        _headerTitleWidget(
          context,
          localizationsContext.washroom,
        ),
        SizedBox(
          height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
        ),
        Selector<FilterProvider, Tuple2<List<Options>, bool?>>(
          selector: (_, state) => Tuple2(
            state.washRoomAvailableList,
            state.isWashroomAvailable,
          ),
          shouldRebuild: (prev, next) => true,
          builder: (context, data, child) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: data.item1.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Dimensions.washroomItemCountPerLine,
                crossAxisSpacing: Dimensions.washroomItemBoxBetweenSpacing.h,
                mainAxisSpacing: Dimensions.washroomItemBoxBetweenSpacing.h,
                childAspectRatio: (Dimensions.washroomItemBoxAspectRatioWidth /
                    Dimensions.washroomItemBoxAspectRatioHeight),
              ),
              itemBuilder: (context, index) {
                final currentItem = data.item1[index];
                final selectedItemId = data.item2 == true
                    ? provider!.optionsYesId
                    : data.item2 == false
                        ? provider!.optionsNoId
                        : -1;
                return CheckboxRadioItem(
                  id: currentItem.id,
                  name: currentItem.name,
                  isSelected: currentItem.id == selectedItemId,
                  selectedId: selectedItemId,
                  isSingleSelection: true,
                  onSelect: (id) => provider?.enableWashroom(
                    id == provider!.optionsYesId,
                    isUserTapped: true,
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  _bathRoomWidget() {
    return Column(
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailWithoutHeaderPadding.h,
        ),
        IncrementalItem(
          label: localizationsContext.bathRooms,
          hint: localizationsContext.addBathRooms,
          controller: provider!.bathroomsTextFieldController,
          ignoring: false,
          onValueChanged: (value) {
            if (value == 0) {
              provider!.bathroomsTextFieldController.text = '';
            } else {
              provider!.bathroomsTextFieldController.text = value.toString();
              StaticFunctions.fieldCursorPositionAtLast(
                provider!.bathroomsTextFieldController,
              );
            }
          },
        ),
      ],
    );
  }

  _roomsWidget() {
    return Column(
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailWithoutHeaderPadding.h,
        ),
        IncrementalItem(
          label: localizationsContext.rooms,
          hint: localizationsContext.enterRooms,
          controller: provider!.roomsTextFieldController,
          ignoring: false,
          onValueChanged: (value) {
            if (value == 0) {
              provider!.roomsTextFieldController.text = '';
            } else {
              provider!.roomsTextFieldController.text = value.toString();
              StaticFunctions.fieldCursorPositionAtLast(
                provider!.roomsTextFieldController,
              );
            }
          },
        ),
      ],
    );
  }

  _floorWidget() {
    return Column(
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailWithoutHeaderPadding.h,
        ),
        IncrementalItem(
          label: localizationsContext.floors,
          hint: localizationsContext.enterFloors,
          controller: provider!.floorsTextFieldController,
          ignoring: false,
          onValueChanged: (value) {
            if (value == 0) {
              provider!.floorsTextFieldController.text = '';
            } else {
              provider!.floorsTextFieldController.text = value.toString();
              StaticFunctions.fieldCursorPositionAtLast(
                provider!.floorsTextFieldController,
              );
            }
          },
        ),
      ],
    );
  }

  _totalFloorWidget() {
    return Column(
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailWithoutHeaderPadding.h,
        ),
        IncrementalItem(
          label: localizationsContext.totalFloors,
          hint: localizationsContext.enterTotalFloors,
          controller: provider!.totalFloorsTextFieldController,
          ignoring: false,
          onValueChanged: (value) {
            if (value == 0) {
              provider!.totalFloorsTextFieldController.text = '';
            } else {
              provider!.totalFloorsTextFieldController.text = value.toString();
              StaticFunctions.fieldCursorPositionAtLast(
                provider!.totalFloorsTextFieldController,
              );
            }
          },
        ),
      ],
    );
  }

  _frontSizeWidget() {
    final label = localizationsContext.frontSize;
    return Column(
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailWithoutHeaderPadding.h,
        ),
        SizedBox(
          height: Dimensions.addPropertyFieldsDefaultHeight.h,
          child: Stack(
            children: [
              Selector<FilterProvider, TextEditingController>(
                shouldRebuild: (prev, next) => true,
                selector: (_, state) => state.frontSizeTextFieldController,
                builder: (context, controller, child) {
                  return TextFieldWidget(
                    label: label,
                    hint: localizationsContext.enterSize,
                    keyBoardType: TextInputType.number,
                    inputFormatter: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    backgroundColor: StaticFunctions.getColor(
                      context,
                      ColorEnum.whiteColor,
                    ),
                    contentPadding: EdgeInsets.only(
                      left: Dimensions.fieldContentPaddingWidth.w,
                      right: Dimensions.fieldContentPaddingWidth.w / 2,
                      top: Dimensions.fieldContentPaddingHeight.h,
                      bottom: Dimensions.fieldContentPaddingHeight.h,
                    ),
                    keepLabelAlwaysOnTop: true,
                    inputAction: TextInputAction.done,
                    controller: controller,
                    maxLength: AppConfig.maxFrontDepthLength,
                    onValueChanged: (int? currentIndex, String value) {},
                  );
                },
              ),
              Positioned(
                right: Dimensions.measurementDropdownMenuContentPadding.w,
                top: 0,
                bottom: 0,
                child: Center(
                  child: Text(
                    localizationsContext.feet,
                    style: TextStyle(
                      fontSize: Dimensions.measurementDropdownTextSize.sp,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.blackColor,
                      ),
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _depthSizeWidget() {
    final label = localizationsContext.depthSize;
    return Column(
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailWithoutHeaderPadding.h,
        ),
        SizedBox(
          height: Dimensions.addPropertyFieldsDefaultHeight.h,
          child: Stack(
            children: [
              Selector<FilterProvider, TextEditingController>(
                shouldRebuild: (prev, next) => true,
                selector: (_, state) => state.depthSizeTextFieldController,
                builder: (context, controller, child) {
                  return TextFieldWidget(
                    label: label,
                    hint: localizationsContext.enterSize,
                    keyBoardType: TextInputType.number,
                    inputFormatter: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    backgroundColor: StaticFunctions.getColor(
                      context,
                      ColorEnum.whiteColor,
                    ),
                    contentPadding: EdgeInsets.only(
                      left: Dimensions.fieldContentPaddingWidth.w,
                      right: Dimensions.fieldContentPaddingWidth.w / 2,
                      top: Dimensions.fieldContentPaddingHeight.h,
                      bottom: Dimensions.fieldContentPaddingHeight.h,
                    ),
                    keepLabelAlwaysOnTop: true,
                    inputAction: TextInputAction.done,
                    controller: controller,
                    maxLength: AppConfig.maxFrontDepthLength,
                    onValueChanged: (int? currentIndex, String value) {},
                  );
                },
              ),
              Positioned(
                right: Dimensions.measurementDropdownMenuContentPadding.w,
                top: 0,
                bottom: 0,
                child: Center(
                  child: Text(
                    localizationsContext.feet,
                    style: TextStyle(
                      fontSize: Dimensions.measurementDropdownTextSize.sp,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.blackColor,
                      ),
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _bhkWidget(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailFieldsPadding.h,
        ),
        _headerTitleWidget(
          context,
          localizationsContext.selectBhk,
        ),
        SizedBox(
          height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
        ),
        Selector<FilterProvider, List<DbPropertyBhkType>>(
          selector: (_, state) => state.bhkTypeList,
          shouldRebuild: (prev, next) => true,
          builder: (context, list, child) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: list.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Dimensions.bhkCountPerLine,
                crossAxisSpacing: Dimensions.checkBoxRadioBoxBetweenSpacing.h,
                mainAxisSpacing: Dimensions.checkBoxRadioBoxBetweenSpacing.h,
                childAspectRatio: (Dimensions.checkBoxRadioBoxAspectRatioWidth /
                    Dimensions.bhkAspectRatioHeight),
              ),
              itemBuilder: (context, index) {
                return CheckboxRadioItem(
                  id: list[index].id,
                  name: list[index].name,
                  isSelected: list[index].isSelected,
                  onSelect: (selectedId) => provider?.selectBhkType(
                    selection: [list[index]],
                    isUserTapped: true,
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  _facingWidget(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailFieldsPadding.h,
        ),
        _headerTitleWidget(
          context,
          localizationsContext.facingType,
        ),
        SizedBox(
          height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
        ),
        Selector<FilterProvider, List<DbPropertyFacingType>>(
          selector: (_, state) => state.facingTypeList,
          shouldRebuild: (prev, next) => true,
          builder: (context, list, child) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: list.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Dimensions.facingCountPerLine,
                crossAxisSpacing: Dimensions.checkBoxRadioBoxBetweenSpacing.h,
                mainAxisSpacing: Dimensions.checkBoxRadioBoxBetweenSpacing.h,
                childAspectRatio: (Dimensions.checkBoxRadioBoxAspectRatioWidth /
                    Dimensions.facingAspectRatioHeight),
              ),
              itemBuilder: (context, index) {
                return CheckboxRadioItem(
                  id: list[index].id,
                  name: list[index].name,
                  isSelected: list[index].isSelected,
                  onSelect: (selectedId) => provider?.selectFacingType(
                    selection: [list[index]],
                    isUserTapped: true,
                  ),
                  isSingleSelection: false,
                );
              },
            );
          },
        ),
      ],
    );
  }

  _balconyWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailFieldsPadding.h,
        ),
        _headerTitleWidget(
          context,
          localizationsContext.balcony,
        ),
        SizedBox(
          height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
        ),
        Selector<FilterProvider, Tuple2<List<Options>, bool?>>(
          selector: (_, state) => Tuple2(
            state.balconyAvailableList,
            state.isBalconyAvailable,
          ),
          shouldRebuild: (prev, next) => true,
          builder: (context, data, child) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: data.item1.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Dimensions.balconyItemCountPerLine,
                crossAxisSpacing: Dimensions.balconyItemBoxBetweenSpacing.h,
                mainAxisSpacing: Dimensions.balconyItemBoxBetweenSpacing.h,
                childAspectRatio: (Dimensions.balconyItemBoxAspectRatioWidth /
                    Dimensions.balconyItemBoxAspectRatioHeight),
              ),
              itemBuilder: (context, index) {
                final currentItem = data.item1[index];
                final selectedItemId = data.item2 == true
                    ? provider!.optionsYesId
                    : data.item2 == false
                        ? provider!.optionsNoId
                        : -1;
                return CheckboxRadioItem(
                  id: currentItem.id,
                  name: currentItem.name,
                  isSelected: currentItem.id == selectedItemId,
                  selectedId: selectedItemId,
                  isSingleSelection: true,
                  onSelect: (id) => provider?.enableBalcony(
                    id == provider!.optionsYesId,
                    isUserTapped: true,
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  _cornerPieceWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailFieldsPadding.h,
        ),
        _headerTitleWidget(
          context,
          localizationsContext.cornerPiece,
        ),
        SizedBox(
          height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
        ),
        Selector<FilterProvider, Tuple2<List<Options>, bool?>>(
          selector: (_, state) => Tuple2(
            state.cornerPieceList,
            state.isCornerPiece,
          ),
          shouldRebuild: (prev, next) => true,
          builder: (context, data, child) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: data.item1.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Dimensions.cornerPieceItemCountPerLine,
                crossAxisSpacing: Dimensions.cornerPieceItemBoxBetweenSpacing.h,
                mainAxisSpacing: Dimensions.cornerPieceItemBoxBetweenSpacing.h,
                childAspectRatio:
                    (Dimensions.cornerPieceItemBoxAspectRatioWidth /
                        Dimensions.cornerPieceItemBoxAspectRatioHeight),
              ),
              itemBuilder: (context, index) {
                final currentItem = data.item1[index];
                final selectedItemId = data.item2 == true
                    ? provider!.optionsYesId
                    : data.item2 == false
                        ? provider!.optionsNoId
                        : -1;
                return CheckboxRadioItem(
                  id: currentItem.id,
                  name: currentItem.name,
                  isSelected: currentItem.id == selectedItemId,
                  selectedId: selectedItemId,
                  isSingleSelection: true,
                  onSelect: (id) => provider?.enableCornerPiece(
                    id == provider!.optionsYesId,
                    isUserTapped: true,
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  _lightConnectionWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailFieldsPadding.h,
        ),
        _headerTitleWidget(
          context,
          localizationsContext.lightConnection,
        ),
        SizedBox(
          height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
        ),
        Selector<FilterProvider, Tuple2<List<Options>, bool?>>(
          selector: (_, state) => Tuple2(
            state.lightConnectionList,
            state.isLightConnectionAvailable,
          ),
          shouldRebuild: (prev, next) => true,
          builder: (context, data, child) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: data.item1.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Dimensions.lightConnectionItemCountPerLine,
                crossAxisSpacing:
                    Dimensions.lightConnectionItemBoxBetweenSpacing.h,
                mainAxisSpacing:
                    Dimensions.lightConnectionItemBoxBetweenSpacing.h,
                childAspectRatio:
                    (Dimensions.lightConnectionItemBoxAspectRatioWidth /
                        Dimensions.lightConnectionItemBoxAspectRatioHeight),
              ),
              itemBuilder: (context, index) {
                final currentItem = data.item1[index];
                final selectedItemId = data.item2 == true
                    ? provider!.optionsYesId
                    : data.item2 == false
                        ? provider!.optionsNoId
                        : -1;
                return CheckboxRadioItem(
                  id: currentItem.id,
                  name: currentItem.name,
                  isSelected: currentItem.id == selectedItemId,
                  selectedId: selectedItemId,
                  isSingleSelection: true,
                  onSelect: (id) => provider?.enableLightConnection(
                    id == provider!.optionsYesId,
                    isUserTapped: true,
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  _wellWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailFieldsPadding.h,
        ),
        _headerTitleWidget(
          context,
          localizationsContext.wellAvailable,
        ),
        SizedBox(
          height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
        ),
        Selector<FilterProvider, Tuple2<List<Options>, bool?>>(
          selector: (_, state) => Tuple2(
            state.wellAvailableList,
            state.isWellAvailable,
          ),
          shouldRebuild: (prev, next) => true,
          builder: (context, data, child) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: data.item1.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Dimensions.wellItemCountPerLine,
                crossAxisSpacing: Dimensions.wellItemBoxBetweenSpacing.h,
                mainAxisSpacing: Dimensions.wellItemBoxBetweenSpacing.h,
                childAspectRatio: (Dimensions.wellItemBoxAspectRatioWidth /
                    Dimensions.wellItemBoxAspectRatioHeight),
              ),
              itemBuilder: (context, index) {
                final currentItem = data.item1[index];
                final selectedItemId = data.item2 == true
                    ? provider!.optionsYesId
                    : data.item2 == false
                        ? provider!.optionsNoId
                        : -1;
                return CheckboxRadioItem(
                  id: currentItem.id,
                  name: currentItem.name,
                  isSelected: currentItem.id == selectedItemId,
                  selectedId: selectedItemId,
                  isSingleSelection: true,
                  onSelect: (id) => provider?.enableWell(
                    id == provider!.optionsYesId,
                    isUserTapped: true,
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  _allottedParkingWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailFieldsPadding.h,
        ),
        _headerTitleWidget(
          context,
          localizationsContext.allottedParking,
        ),
        SizedBox(
          height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
        ),
        Selector<FilterProvider, Tuple2<List<Options>, bool?>>(
          selector: (_, state) => Tuple2(
            state.allottedParkingList,
            state.isAllottedParkingAvailable,
          ),
          shouldRebuild: (prev, next) => true,
          builder: (context, data, child) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: data.item1.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Dimensions.optionItemCountPerLine,
                crossAxisSpacing: Dimensions.optionItemBoxBetweenSpacing.h,
                mainAxisSpacing: Dimensions.optionItemBoxBetweenSpacing.h,
                childAspectRatio: (Dimensions.optionItemBoxAspectRatioWidth /
                    Dimensions.optionItemBoxAspectRatioHeight),
              ),
              itemBuilder: (context, index) {
                final currentItem = data.item1[index];
                final selectedItemId = data.item2 == true
                    ? provider!.optionsYesId
                    : data.item2 == false
                        ? provider!.optionsNoId
                        : -1;
                return CheckboxRadioItem(
                  id: currentItem.id,
                  name: currentItem.name,
                  isSelected: currentItem.id == selectedItemId,
                  selectedId: selectedItemId,
                  isSingleSelection: true,
                  onSelect: (id) => provider?.enableAllottedParking(
                    id == provider!.optionsYesId,
                    isUserTapped: true,
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  _parkingWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailFieldsPadding.h,
        ),
        _headerTitleWidget(
          context,
          localizationsContext.parkingAvailable,
        ),
        SizedBox(
          height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
        ),
        Selector<FilterProvider, Tuple2<List<Options>, bool?>>(
          selector: (_, state) => Tuple2(
            state.parkingAvailableList,
            state.isParkingAvailable,
          ),
          shouldRebuild: (prev, next) => true,
          builder: (context, data, child) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: data.item1.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Dimensions.optionItemCountPerLine,
                crossAxisSpacing: Dimensions.optionItemBoxBetweenSpacing.h,
                mainAxisSpacing: Dimensions.optionItemBoxBetweenSpacing.h,
                childAspectRatio: (Dimensions.optionItemBoxAspectRatioWidth /
                    Dimensions.optionItemBoxAspectRatioHeight),
              ),
              itemBuilder: (context, index) {
                final currentItem = data.item1[index];
                final selectedItemId = data.item2 == true
                    ? provider!.optionsYesId
                    : data.item2 == false
                        ? provider!.optionsNoId
                        : -1;
                return CheckboxRadioItem(
                  id: currentItem.id,
                  name: currentItem.name,
                  isSelected: currentItem.id == selectedItemId,
                  selectedId: selectedItemId,
                  isSingleSelection: true,
                  onSelect: (id) => provider?.enableParking(
                    id == provider!.optionsYesId,
                    isUserTapped: true,
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  _liftWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailFieldsPadding.h,
        ),
        _headerTitleWidget(
          context,
          localizationsContext.liftAvailable,
        ),
        SizedBox(
          height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
        ),
        Selector<FilterProvider, Tuple2<List<Options>, bool?>>(
          selector: (_, state) => Tuple2(
            state.liftAvailableList,
            state.isLiftAvailable,
          ),
          shouldRebuild: (prev, next) => true,
          builder: (context, data, child) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: data.item1.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Dimensions.optionItemCountPerLine,
                crossAxisSpacing: Dimensions.optionItemBoxBetweenSpacing.h,
                mainAxisSpacing: Dimensions.optionItemBoxBetweenSpacing.h,
                childAspectRatio: (Dimensions.optionItemBoxAspectRatioWidth /
                    Dimensions.optionItemBoxAspectRatioHeight),
              ),
              itemBuilder: (context, index) {
                final currentItem = data.item1[index];
                final selectedItemId = data.item2 == true
                    ? provider!.optionsYesId
                    : data.item2 == false
                        ? provider!.optionsNoId
                        : -1;
                return CheckboxRadioItem(
                  id: currentItem.id,
                  name: currentItem.name,
                  isSelected: currentItem.id == selectedItemId,
                  selectedId: selectedItemId,
                  isSingleSelection: true,
                  onSelect: (id) => provider?.enableLift(
                    id == provider!.optionsYesId,
                    isUserTapped: true,
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  _amenitiesWidget(BuildContext context) {
    return Selector<FilterProvider, List<DbPropertyAmenity>>(
      selector: (_, state) => state.propertyAmenityList,
      shouldRebuild: (prev, next) => true,
      builder: (context, list, child) {
        if (list.isEmpty) {
          return const SizedBox();
        }
        final isAllSelected = list.every((element) => element.isSelected);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: Dimensions.addBuyerBasicDetailFieldsPadding.h,
            ),
            _headerTitleWidget(
              context,
              localizationsContext.amenities,
            ),
            SizedBox(
              height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
            ),
            InkWell(
              onTap: () => provider?.selectPropertyAmenity(
                selection: isAllSelected ? [] : list,
              ),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: Dimensions.amenitiesSelectAllVerticalPadding.h,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IgnorePointer(
                      child: CustomCheckbox(
                        checkBoxSize: Dimensions.amenitiesBoxCheckboxSize.h,
                        value: isAllSelected,
                        onChanged: (bool value) {},
                        borderRadius:
                            Dimensions.amenitiesBoxCheckboxBorderRadius.r,
                        innerPadding:
                            Dimensions.amenitiesBoxCheckboxInnerPadding.h,
                        checkedFillColor: StaticFunctions.getColor(
                          context,
                          ColorEnum.themeColor,
                        ),
                        borderWidth:
                            Dimensions.amenitiesBoxCheckboxBorderWidth.w,
                        borderColor: StaticFunctions.getColor(
                          context,
                          ColorEnum.borderColorE0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Dimensions
                          .amenitiesBoxTextAndCheckboxBetweenSpacing.w,
                    ),
                    Expanded(
                      child: Text(
                        localizationsContext.selectAllText,
                        style: TextStyle(
                          color: StaticFunctions.getColor(
                            context,
                            ColorEnum.blackColor,
                          ),
                          fontSize: Dimensions.amenitiesTextSize.sp,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: (list.length / 2).ceil(),
              itemBuilder: (context, index) {
                final firstIndex = index * 2;
                final secondIndex = (index * 2) + 1;
                return Padding(
                  padding: EdgeInsets.only(
                    top: Dimensions.gridContentTopPadding.h,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (firstIndex < list.length)
                        Expanded(
                          child: AmenityItem(
                            propertyAmenityModel: list[firstIndex],
                            onSelect: (selectedModel) =>
                                provider?.selectPropertyAmenity(
                              selection: [selectedModel],
                              isUserTapped: true,
                            ),
                          ),
                        ),
                      if (secondIndex < list.length)
                        SizedBox(
                          width: Dimensions.gridContentItemHorizontalPadding.w,
                        ),
                      if (secondIndex < list.length)
                        Expanded(
                          child: AmenityItem(
                            propertyAmenityModel: list[secondIndex],
                            onSelect: (selectedModel) =>
                                provider?.selectPropertyAmenity(
                              selection: [selectedModel],
                              isUserTapped: true,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  _furnishedWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailFieldsPadding.h,
        ),
        _headerTitleWidget(
          context,
          localizationsContext.furnishStatus,
        ),
        SizedBox(
          height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
        ),
        Selector<FilterProvider, List<DbPropertyFurnishedStatus>>(
          selector: (_, state) => state.furnishedList,
          shouldRebuild: (prev, next) => true,
          builder: (context, list, child) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: list.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Dimensions.furnishedCountPerLine,
                crossAxisSpacing: Dimensions.furnishedBoxBetweenSpacing.h,
                mainAxisSpacing: Dimensions.furnishedBoxBetweenSpacing.h,
                childAspectRatio: (Dimensions.furnishedBoxAspectRatioWidth /
                    Dimensions.furnishedBoxAspectRatioHeight),
              ),
              itemBuilder: (context, index) {
                final currentItem = list[index];
                return CheckboxRadioItem(
                  id: currentItem.id,
                  name: currentItem.name,
                  isSelected: currentItem.isSelected,
                  onSelect: (value) => provider?.selectFurnished(
                    selection: [currentItem],
                    isUserTapped: true,
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  _preferredCastWidget(BuildContext context) {
    return Selector<FilterProvider, List<DbPropertyPreferredCast>>(
      selector: (_, state) => state.preferredCastList,
      shouldRebuild: (prev, next) => true,
      builder: (context, list, child) {
        if (list.isEmpty) {
          return const SizedBox();
        }
        final isAllSelected = list.every((element) => element.isSelected);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: Dimensions.addBuyerBasicDetailFieldsPadding.h,
            ),
            _headerTitleWidget(
              context,
              localizationsContext.preferredCast,
            ),
            SizedBox(
              height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
            ),
            InkWell(
              onTap: () => provider?.selectPreferredCaste(
                selection: isAllSelected ? [] : list,
              ),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: Dimensions.amenitiesSelectAllVerticalPadding.h,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IgnorePointer(
                      child: CustomCheckbox(
                        checkBoxSize: Dimensions.preferredCastBoxCheckboxSize.h,
                        value: isAllSelected,
                        onChanged: (bool value) {},
                        borderRadius:
                            Dimensions.preferredCastBoxCheckboxBorderRadius.r,
                        innerPadding:
                            Dimensions.preferredCastBoxCheckboxInnerPadding.h,
                        checkedFillColor: StaticFunctions.getColor(
                          context,
                          ColorEnum.themeColor,
                        ),
                        borderWidth:
                            Dimensions.preferredCastBoxCheckboxBorderWidth.w,
                        borderColor: StaticFunctions.getColor(
                          context,
                          ColorEnum.borderColorE0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Dimensions
                          .preferredCastBoxTextAndCheckboxBetweenSpacing.w,
                    ),
                    Expanded(
                      child: Text(
                        localizationsContext.selectAllText,
                        style: TextStyle(
                          color: StaticFunctions.getColor(
                            context,
                            ColorEnum.blackColor,
                          ),
                          fontSize: Dimensions.preferredCastTextSize.sp,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: (list.length / 2).ceil(),
              itemBuilder: (context, index) {
                final firstIndex = index * 2;
                final secondIndex = (index * 2) + 1;
                return Padding(
                  padding: EdgeInsets.only(
                    top: Dimensions.gridContentTopPadding.h,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (firstIndex < list.length)
                        Expanded(
                          child: PreferredCastItem(
                            caste: list[firstIndex],
                            onSelect: (selectedModel) =>
                                provider?.selectPreferredCaste(
                              selection: [selectedModel],
                              isUserTapped: true,
                            ),
                          ),
                        ),
                      if (secondIndex < list.length)
                        SizedBox(
                          width: Dimensions.gridContentItemHorizontalPadding.w,
                        ),
                      if (secondIndex < list.length)
                        Expanded(
                          child: PreferredCastItem(
                            caste: list[secondIndex],
                            onSelect: (selectedModel) =>
                                provider?.selectPreferredCaste(
                              selection: [selectedModel],
                              isUserTapped: true,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  /*_additionalFurnishingWidget() {
    return Selector<FilterProvider, List<DbAdditionalFurnish>>(
      selector: (_, state) => state.additionalFurnishList,
      shouldRebuild: (_, __) => true,
      builder: (context, list, child) {
        if (list.isEmpty) {
          return const SizedBox();
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Dimensions.addBuyerBasicDetailFieldsPadding.h,
            ),
            _headerTitleWidget(
              context,
              localizationsContext.additionalFurnishing,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: (list.length / 2).ceil(),
              itemBuilder: (context, index) {
                final firstIndex = index * 2;
                final secondIndex = (index * 2) + 1;
                return Padding(
                  padding: EdgeInsets.only(
                    top: Dimensions.gridContentTopPadding.h,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (firstIndex < list.length)
                        Expanded(
                          child: AdditionalFurnishItem(
                            furnishModel: list[firstIndex],
                            onSelect: (selectedModel) =>
                                provider?.selectAdditionalFurnish(
                              selection: [selectedModel],
                              isUserTapped: true,
                            ),
                          ),
                        ),
                      if (secondIndex < list.length)
                        SizedBox(
                          width: Dimensions.gridContentItemHorizontalPadding.w,
                        ),
                      if (secondIndex < list.length)
                        Expanded(
                          child: AdditionalFurnishItem(
                            furnishModel: list[secondIndex],
                            onSelect: (selectedModel) =>
                                provider?.selectAdditionalFurnish(
                              selection: [selectedModel],
                              isUserTapped: true,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }*/

  @override
  void dispose() {
    provider!.onDispose();
    super.dispose();
  }

  _showSavedFilterDialog(
    BuildContext context, {
    int? byPropertyType,
  }) {
    var filterScreenProvider =
        Provider.of<FilterProvider>(context, listen: false);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (dialogContext) {
        return ChangeNotifierProvider(
          create: (_) => SavedFilterDialogProvider(),
          builder: (context, _) {
            SavedFilterDialogProvider provider =
                Provider.of<SavedFilterDialogProvider>(context, listen: false);
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              provider.init(context, byPropertyType: byPropertyType);
            });
            return Padding(
              padding: MediaQuery.of(dialogContext).viewInsets,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ColoredBox(
                    color: StaticFunctions.getColor(
                      dialogContext,
                      ColorEnum.themeColorOpacity6Percentage,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: Dimensions.screenHorizontalMargin.w,
                        right: (Dimensions.screenHorizontalMargin / 2).w,
                        top: Dimensions.bottomSheetTitleVerticalPadding.h,
                        bottom: Dimensions.bottomSheetTitleVerticalPadding.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            localizationsContext.savedFilters,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Dimensions.bottomSheetTitleTextSize.sp,
                              color: StaticFunctions.getColor(
                                dialogContext,
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
                                  Navigator.pop(dialogContext);
                                },
                                borderRadius: BorderRadius.circular(
                                  Dimensions.closeIconRippleRadius.r,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(
                                    Dimensions.closeIconPadding.w,
                                  ),
                                  child: SvgPicture.asset(
                                    Strings.iconBottomSheetClose,
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
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.screenHorizontalMargin.w,
                    ),
                    child: Selector<SavedFilterDialogProvider,
                        List<DbSavedFilter>>(
                      shouldRebuild: (prev, next) => true,
                      selector: (_, state) => state.filterList,
                      builder: (context, list, child) {
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            return SavedFilterWidget(
                              filter: list[index],
                              onDelete: () => provider.deleteFilter(
                                context,
                                list[index],
                              ),
                              onEdit: (isEdit) => {
                                Navigator.pop(dialogContext),
                                filterScreenProvider.onItemSelected(
                                  context,
                                  filter: list[index],
                                  isEditPressed: isEdit,
                                )
                              },
                              isLast: index == list.length - 1,
                            );
                          },
                          shrinkWrap: true,
                          itemCount: list.length,
                          physics: const BouncingScrollPhysics(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      isDismissible: true,
      backgroundColor: StaticFunctions.getColor(
        context,
        ColorEnum.whiteColor,
      ),
      barrierColor: StaticFunctions.getColor(
        context,
        ColorEnum.bottomSheetBarrierColor,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
    );
  }

  _inactiveAndClosedOptionWidget() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Dimensions.addBuyerBasicDetailFieldsPadding.h,
          ),
          _headerTitleWidget(
            context,
            localizationsContext.propertyStatus,
          ),
          SizedBox(
            height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
          ),
          Selector<FilterProvider, bool>(
            shouldRebuild: (prev, next) => prev != next,
            selector: (_, state) => state.includeInactiveProperty,
            builder: (_, includeInactiveProperty, __) {
              final selectedId = includeInactiveProperty
                  ? provider!.optionsYesId
                  : provider!.optionsNoId;
              return InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => provider!.enableInactiveProperty(),
                child: Container(
                  height: Dimensions.filterPropertyStatusContentHeight.h,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IgnorePointer(
                        child: CustomCheckbox(
                          checkBoxSize:
                              Dimensions.checkBoxRadioBoxCheckboxSize.h,
                          value: selectedId == provider!.optionsYesId,
                          onChanged: (bool value) {},
                          borderRadius:
                              Dimensions.checkBoxRadioBoxCheckboxBorderRadius.r,
                          innerPadding:
                              Dimensions.checkBoxRadioBoxCheckboxInnerPadding.h,
                          checkedFillColor: StaticFunctions.getColor(
                            context,
                            ColorEnum.themeColor,
                          ),
                          borderWidth:
                              Dimensions.checkBoxRadioBoxCheckboxBorderWidth.w,
                          borderColor: StaticFunctions.getColor(
                            context,
                            ColorEnum.borderColorE0,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Dimensions
                            .checkBoxRadioBoxTextAndCheckboxBetweenSpacing.w,
                      ),
                      Expanded(
                        child: Text(
                          localizationsContext.filterIncludeInactiveProperty,
                          style: TextStyle(
                            color: StaticFunctions.getColor(
                              context,
                              ColorEnum.blackColor,
                            ),
                            fontSize: Dimensions.checkBoxRadioBoxTextSize.sp,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          Selector<FilterProvider, bool>(
            shouldRebuild: (prev, next) => prev != next,
            selector: (_, state) => state.includeClosedProperty,
            builder: (_, includeClosedProperty, __) {
              final selectedId = includeClosedProperty
                  ? provider!.optionsYesId
                  : provider!.optionsNoId;
              return InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => provider!.enableClosedProperty(),
                child: Container(
                  height: Dimensions.addPropertyFieldsDefaultHeight.h,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IgnorePointer(
                        child: CustomCheckbox(
                          checkBoxSize:
                              Dimensions.checkBoxRadioBoxCheckboxSize.h,
                          value: selectedId == provider!.optionsYesId,
                          onChanged: (bool value) {},
                          borderRadius:
                              Dimensions.checkBoxRadioBoxCheckboxBorderRadius.r,
                          innerPadding:
                              Dimensions.checkBoxRadioBoxCheckboxInnerPadding.h,
                          checkedFillColor: StaticFunctions.getColor(
                            context,
                            ColorEnum.themeColor,
                          ),
                          borderWidth:
                              Dimensions.checkBoxRadioBoxCheckboxBorderWidth.w,
                          borderColor: StaticFunctions.getColor(
                            context,
                            ColorEnum.borderColorE0,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Dimensions
                            .checkBoxRadioBoxTextAndCheckboxBetweenSpacing.w,
                      ),
                      Expanded(
                        child: Text(
                          localizationsContext.filterIncludeClosedProperty,
                          style: TextStyle(
                            color: StaticFunctions.getColor(
                              context,
                              ColorEnum.blackColor,
                            ),
                            fontSize: Dimensions.checkBoxRadioBoxTextSize.sp,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  _connectedRoadsWidget(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailFieldsPadding.h,
        ),
        _headerTitleWidget(
          context,
          '${localizationsContext.connectedRoad} (${localizationsContext.ft})',
        ),
        SizedBox(
          height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
        ),
        Container(
          height: Dimensions.addPropertyFieldsDefaultHeight.h,
          child: Row(
            children: [
              Expanded(
                child: TextFieldWidget(
                  keepLabelAlwaysOnTop: true,
                  controller: provider!.firstConnectedRoadController,
                  keyBoardType: TextInputType.number,
                  maxLength: 3,
                  backgroundColor: StaticFunctions.getColor(
                    context,
                    ColorEnum.whiteColor,
                  ),
                  inputFormatter: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onValueChanged: (int? currentIndex, String value) {},
                ),
              ),
              SizedBox(
                width: Dimensions.connectedRoadItemBetweenSpacing.w,
              ),
              Text(
                '/',
                style: TextStyle(
                  fontSize: Dimensions.connectedRoadBetweenSlashTextSize.sp,
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.grayColor,
                  ),
                ),
              ),
              SizedBox(
                width: Dimensions.connectedRoadItemBetweenSpacing.w,
              ),
              Expanded(
                child: TextFieldWidget(
                  keepLabelAlwaysOnTop: true,
                  controller: provider!.secondConnectedRoadController,
                  keyBoardType: TextInputType.number,
                  maxLength: 3,
                  backgroundColor: StaticFunctions.getColor(
                    context,
                    ColorEnum.whiteColor,
                  ),
                  inputFormatter: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onValueChanged: (int? currentIndex, String value) {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
