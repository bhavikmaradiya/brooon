import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../../common_property_data_provider.dart';
import '../../../const/dimen_const.dart';
import '../../../localdb/properties/db_additional_furnish.dart';
import '../../../localdb/properties/db_property_amenity.dart';
import '../../../localdb/properties/db_property_bhk_type.dart';
import '../../../localdb/properties/db_property_building_type.dart';
import '../../../localdb/properties/db_property_connected_road.dart';
import '../../../localdb/properties/db_property_construction_type.dart';
import '../../../localdb/properties/db_property_facing_type.dart';
import '../../../localdb/properties/db_property_furnished_status.dart';
import '../../../localdb/properties/db_property_preferred_cast.dart';
import '../../../localdb/properties/db_property_scheme_type.dart';
import '../../../localdb/properties/db_property_type.dart';
import '../../../utils/app_config.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';
import '../../../widgets/checkbox_widget.dart';
import '../../../widgets/text_field_widget.dart';
import '../../add_property/model/options.dart';
import '../../common_widget/additional_furnish_item.dart';
import '../../common_widget/amenity_item_widget.dart';
import '../../common_widget/checkbox_radio_item.dart';
import '../../common_widget/incremental_item.dart';
import '../../common_widget/preferred_cast_item_widget.dart';
import '../add_buyer_provider.dart';

class AddBuyerOtherDetails extends StatelessWidget {
  final AppLocalizations localizationsContext;
  final AddBuyerProvider provider;

  AddBuyerOtherDetails({
    Key? key,
    required this.localizationsContext,
    required this.provider,
  }) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Selector<AddBuyerProvider, List<DbPropertyType>>(
        shouldRebuild: (prev, next) => true,
        selector: (_, state) => state.propertyTypeList,
        builder: (_, _data, __) {
          final _selectedPropertyType =
              _data.firstWhereOrNull((element) => element.isSelected);
          return Column(
            children: [
              if (_selectedPropertyType == null ||
                  CommonPropertyDataProvider.checkForBuildingType(
                      [_selectedPropertyType.id]))
                _buildingTypeWidget(context),
              if (_selectedPropertyType == null ||
                  CommonPropertyDataProvider.checkForConstruction(
                      [_selectedPropertyType.id]))
                _constructionWidget(context),
              if (_selectedPropertyType == null ||
                  CommonPropertyDataProvider.checkForScheme(
                      [_selectedPropertyType.id]))
                _schemeWidget(context),
              if (_selectedPropertyType == null ||
                  CommonPropertyDataProvider.isNotPlotOrLandMark(
                      [_selectedPropertyType.id]))
                _furnishedWidget(context),
              /* TODO: Additional furnishing is hidden
              if (_selectedPropertyType == null ||
                  CommonPropertyDataProvider.isNotPlotOrLandMark(
                      [_selectedPropertyType.id]))
                _additionalFurnishingWidget(context),*/
              if (_selectedPropertyType == null ||
                  CommonPropertyDataProvider.checkForBhk(
                      [_selectedPropertyType.id]))
                _bhkWidget(context),
              if (_selectedPropertyType == null ||
                  CommonPropertyDataProvider.checkForConnectedRoad(
                      [_selectedPropertyType.id]))
                _connectedRoadsWidget(context),
              if (_selectedPropertyType == null ||
                  CommonPropertyDataProvider.checkForBathRoom(
                      [_selectedPropertyType.id]))
                _bathRoomWidget(),
              if (_selectedPropertyType == null ||
                  CommonPropertyDataProvider.checkForRoom(
                      [_selectedPropertyType.id]))
                _roomsWidget(),
              if (_selectedPropertyType == null ||
                  CommonPropertyDataProvider.checkForFloor(
                      [_selectedPropertyType.id]))
                _floorWidget(),
              if (_selectedPropertyType == null ||
                  CommonPropertyDataProvider.checkForTotalFloor(
                      [_selectedPropertyType.id]))
                _totalFloorWidget(),
              if (_selectedPropertyType == null ||
                  CommonPropertyDataProvider.checkForFrontDepthSize(
                      [_selectedPropertyType.id]))
                _frontSizeWidget(context),
              if (_selectedPropertyType == null ||
                  CommonPropertyDataProvider.checkForFrontDepthSize(
                      [_selectedPropertyType.id]))
                _depthSizeWidget(context),
              if (_selectedPropertyType == null ||
                  CommonPropertyDataProvider.checkForWashRoomAvailable(
                      [_selectedPropertyType.id]))
                _washroomWidget(context),
              if (_selectedPropertyType == null ||
                  CommonPropertyDataProvider.isNotPlotOrLandMark(
                      [_selectedPropertyType.id]))
                _balconyWidget(context),
              if (_selectedPropertyType == null ||
                  CommonPropertyDataProvider.checkForCornerPiece(
                      [_selectedPropertyType.id]))
                _cornerPieceWidget(context),
              if (_selectedPropertyType == null ||
                  CommonPropertyDataProvider.checkForLightConnection(
                      [_selectedPropertyType.id]))
                _lightConnectionWidget(context),
              if (_selectedPropertyType == null ||
                  CommonPropertyDataProvider.checkForWellAvailable(
                      [_selectedPropertyType.id]))
                _wellWidget(context),
              if (_selectedPropertyType == null ||
                  CommonPropertyDataProvider.checkForAllottedParkingAvailable(
                      [_selectedPropertyType.id]))
                _allottedParkingWidget(context),
              if (_selectedPropertyType == null ||
                  CommonPropertyDataProvider.checkForParkingAvailable(
                      [_selectedPropertyType.id]))
                _parkingWidget(context),
              if (_selectedPropertyType == null ||
                  CommonPropertyDataProvider.checkForLiftAvailable(
                      [_selectedPropertyType.id]))
                _liftWidget(context),
              if (_selectedPropertyType == null ||
                  CommonPropertyDataProvider.checkForFacingType(
                      [_selectedPropertyType.id]))
                _facingWidget(context),
              _preferredCastWidget(context),
              if (_selectedPropertyType == null ||
                  CommonPropertyDataProvider.isNotPlotOrLandMark(
                      [_selectedPropertyType.id]))
                _amenitiesWidget(context),
            ],
          );
        },
      ),
    );
  }

  _amenitiesWidget(BuildContext context) {
    return Selector<AddBuyerProvider, List<DbPropertyAmenity>>(
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
              onTap: () => provider.selectPropertyAmenity(
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
                                provider.selectPropertyAmenity(
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
                                provider.selectPropertyAmenity(
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
        Selector<AddBuyerProvider, Tuple2<List<Options>, bool?>>(
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
                    ? provider.optionsYesId
                    : data.item2 == false
                        ? provider.optionsNoId
                        : -1;
                return CheckboxRadioItem(
                  id: currentItem.id,
                  name: currentItem.name,
                  isSelected: currentItem.id == selectedItemId,
                  selectedId: selectedItemId,
                  isSingleSelection: true,
                  onSelect: (id) => provider.enableWashroom(
                    id == provider.optionsYesId,
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
        Selector<AddBuyerProvider, Tuple2<List<Options>, bool?>>(
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
                    ? provider.optionsYesId
                    : data.item2 == false
                        ? provider.optionsNoId
                        : -1;
                return CheckboxRadioItem(
                  id: currentItem.id,
                  name: currentItem.name,
                  isSelected: currentItem.id == selectedItemId,
                  selectedId: selectedItemId,
                  isSingleSelection: true,
                  onSelect: (id) => provider.enableBalcony(
                    id == provider.optionsYesId,
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
        Selector<AddBuyerProvider, Tuple2<List<Options>, bool?>>(
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
                    ? provider.optionsYesId
                    : data.item2 == false
                        ? provider.optionsNoId
                        : -1;
                return CheckboxRadioItem(
                  id: currentItem.id,
                  name: currentItem.name,
                  isSelected: currentItem.id == selectedItemId,
                  selectedId: selectedItemId,
                  isSingleSelection: true,
                  onSelect: (id) => provider.enableCornerPiece(
                    id == provider.optionsYesId,
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
        Selector<AddBuyerProvider, Tuple2<List<Options>, bool?>>(
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
                    ? provider.optionsYesId
                    : data.item2 == false
                        ? provider.optionsNoId
                        : -1;
                return CheckboxRadioItem(
                  id: currentItem.id,
                  name: currentItem.name,
                  isSelected: currentItem.id == selectedItemId,
                  selectedId: selectedItemId,
                  isSingleSelection: true,
                  onSelect: (id) => provider.enableLightConnection(
                    id == provider.optionsYesId,
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
        Selector<AddBuyerProvider, Tuple2<List<Options>, bool?>>(
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
                    ? provider.optionsYesId
                    : data.item2 == false
                        ? provider.optionsNoId
                        : -1;
                return CheckboxRadioItem(
                  id: currentItem.id,
                  name: currentItem.name,
                  isSelected: currentItem.id == selectedItemId,
                  selectedId: selectedItemId,
                  isSingleSelection: true,
                  onSelect: (id) => provider.enableWell(
                    id == provider.optionsYesId,
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
        Selector<AddBuyerProvider, Tuple2<List<Options>, bool?>>(
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
                    ? provider.optionsYesId
                    : data.item2 == false
                        ? provider.optionsNoId
                        : -1;
                return CheckboxRadioItem(
                  id: currentItem.id,
                  name: currentItem.name,
                  isSelected: currentItem.id == selectedItemId,
                  selectedId: selectedItemId,
                  isSingleSelection: true,
                  onSelect: (id) => provider.enableAllottedParking(
                    id == provider.optionsYesId,
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
        Selector<AddBuyerProvider, Tuple2<List<Options>, bool?>>(
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
                    ? provider.optionsYesId
                    : data.item2 == false
                        ? provider.optionsNoId
                        : -1;
                return CheckboxRadioItem(
                  id: currentItem.id,
                  name: currentItem.name,
                  isSelected: currentItem.id == selectedItemId,
                  selectedId: selectedItemId,
                  isSingleSelection: true,
                  onSelect: (id) => provider.enableParking(
                    id == provider.optionsYesId,
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
        Selector<AddBuyerProvider, Tuple2<List<Options>, bool?>>(
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
                    ? provider.optionsYesId
                    : data.item2 == false
                        ? provider.optionsNoId
                        : -1;
                return CheckboxRadioItem(
                  id: currentItem.id,
                  name: currentItem.name,
                  isSelected: currentItem.id == selectedItemId,
                  selectedId: selectedItemId,
                  isSingleSelection: true,
                  onSelect: (id) => provider.enableLift(
                    id == provider.optionsYesId,
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
        Selector<AddBuyerProvider, List<DbPropertyFurnishedStatus>>(
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
                  onSelect: (value) => provider.selectFurnished(
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
        Selector<AddBuyerProvider, List<DbPropertyBuildingType>>(
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
                  onSelect: (value) => provider.selectBuildingType(
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
      mainAxisSize: MainAxisSize.max,
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
        Selector<AddBuyerProvider, List<DbPropertyConstructionType>>(
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
                  onSelect: (value) => provider.selectConstructionType(
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
        Selector<AddBuyerProvider, List<DbPropertySchemeType>>(
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
                  onSelect: (value) => provider.selectSchemeType(
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

  _additionalFurnishingWidget(BuildContext context) {
    return Selector<AddBuyerProvider, List<DbAdditionalFurnish>>(
      selector: (_, state) => state.additionalFurnishList,
      shouldRebuild: (_, __) => true,
      builder: (context, list, child) {
        if (list.isEmpty) {
          return const SizedBox();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
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
                                provider.selectAdditionalFurnish(
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
                                provider.selectAdditionalFurnish(
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

  _preferredCastWidget(BuildContext context) {
    return Selector<AddBuyerProvider, List<DbPropertyPreferredCast>>(
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
              onTap: () => provider.selectPreferredCaste(
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
                    ),
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
                                provider.selectPreferredCaste(
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
                                provider.selectPreferredCaste(
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

  _facingWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
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
        Selector<AddBuyerProvider, List<DbPropertyFacingType>>(
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
                  onSelect: (selectedId) => provider.selectFacingType(
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

  _bhkWidget(BuildContext context) {
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
        Selector<AddBuyerProvider, List<DbPropertyBhkType>>(
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
                  onSelect: (selectedId) => provider.selectBhkType(
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
                  controller: provider.firstConnectedRoadFieldController,
                  keyBoardType: TextInputType.number,
                  maxLength: 3,
                  backgroundColor: StaticFunctions.getColor(
                    context,
                    ColorEnum.whiteColor,
                  ),
                  inputFormatter: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onValueChanged: (int? currentIndex, String value){},
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
                  controller: provider.secondConnectedRoadFieldController,
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

  _bathRoomWidget() {
    return Column(
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailWithoutHeaderPadding.h,
        ),
        IncrementalItem(
          label: localizationsContext.bathRooms,
          hint: localizationsContext.addBathRooms,
          controller: provider.bathroomsTextFieldController,
          ignoring: false,
          onValueChanged: (value) {
            if (value == 0) {
              provider.bathroomsTextFieldController.text = '';
            } else {
              provider.bathroomsTextFieldController.text = value.toString();
              StaticFunctions.fieldCursorPositionAtLast(
                provider.bathroomsTextFieldController,
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
          controller: provider.roomsTextFieldController,
          ignoring: false,
          onValueChanged: (value) {
            if (value == 0) {
              provider.roomsTextFieldController.text = '';
            } else {
              provider.roomsTextFieldController.text = value.toString();
              StaticFunctions.fieldCursorPositionAtLast(
                provider.roomsTextFieldController,
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
          controller: provider.floorsTextFieldController,
          ignoring: false,
          onValueChanged: (value) {
            if (value == 0) {
              provider.floorsTextFieldController.text = '';
            } else {
              provider.floorsTextFieldController.text = value.toString();
              StaticFunctions.fieldCursorPositionAtLast(
                provider.floorsTextFieldController,
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
          controller: provider.totalFloorsTextFieldController,
          ignoring: false,
          onValueChanged: (value) {
            if (value == 0) {
              provider.totalFloorsTextFieldController.text = '';
            } else {
              provider.totalFloorsTextFieldController.text = value.toString();
              StaticFunctions.fieldCursorPositionAtLast(
                provider.totalFloorsTextFieldController,
              );
            }
          },
        ),
      ],
    );
  }

  _frontSizeWidget(context) {
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
              Selector<AddBuyerProvider, TextEditingController>(
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

  _depthSizeWidget(context) {
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
              Selector<AddBuyerProvider, TextEditingController>(
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
}
