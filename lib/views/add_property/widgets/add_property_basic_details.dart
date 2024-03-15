import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import './price_range_field_widget.dart';
import './space_between_fields.dart';
import '../../../const/dimen_const.dart';
import '../../../const/routes.dart';
import '../../../const/string_const.dart';
import '../../../localdb/helpers/db_locations_tags.dart';
import '../../../localdb/properties/db_property_area_unit.dart';
import '../../../localdb/properties/db_property_for.dart';
import '../../../localdb/properties/db_property_type.dart';
import '../../../localdb/save_default_data.dart';
import '../../../utils/app_config.dart';
import '../../../utils/choose_location_from_enum.dart';
import '../../../utils/enums.dart';
import '../../../utils/price_formatter.dart';
import '../../../utils/static_functions.dart';
import '../../../widgets/checkbox_widget.dart';
import '../../../widgets/dropdown/custom_drop_down_list.dart';
import '../../../widgets/measure_size_widget.dart';
import '../../../widgets/suggestion_field/suggestion_field_configuration.dart';
import '../../../widgets/suggestion_field/suggestions_box/suggestions_box_decoration.dart';
import '../../../widgets/suggestion_field/text_field_with_dropdown.dart';
import '../../../widgets/suggestion_field_item.dart';
import '../../../widgets/text_field_widget.dart';
import '../../choose_location/fetch_location_provider.dart';
import '../../choose_location/model/retrieve_location_arg.dart';
import '../../common_widget/checkbox_radio_item.dart';
import '../../filter/widget/property_type_item_widget.dart';
import '../add_property_provider.dart';
import '../add_upload_images.dart';
import '../model/price_enum.dart';

class AddPropertyBasicDetails extends StatelessWidget {
  final AppLocalizations localizationsContext;
  final AddPropertyProvider addPropertyProvider;

  const AddPropertyBasicDetails({
    Key? key,
    required this.localizationsContext,
    required this.addPropertyProvider,
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

  _propertyTypeWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SpaceBetweenFields(),
        _headerTitleWidget(
          context,
          '${localizationsContext.filterProperties}*',
        ),
        SizedBox(
          height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
        ),
        Selector<AddPropertyProvider, List<DbPropertyType>>(
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
                final selected = list.firstWhereOrNull(
                  (element) => element.isSelected,
                );
                int selectedIndex = -1;
                if (selected != null) {
                  selectedIndex = selected.id;
                }
                return PropertyTypeItem(
                  propertyType: list[index],
                  isSingleSelection: true,
                  selectedId: selectedIndex,
                  onSelect: (selectedModel) {
                    addPropertyProvider.selectPropertyType(
                      selectedModel.id,
                    );
                  },
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
        _headerTitleWidget(
          context,
          '${localizationsContext.filterPropertyFor}*',
        ),
        SizedBox(
          height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
        ),
        Selector<AddPropertyProvider, List<DbPropertyFor>>(
          selector: (_, state) => state.propertyForList,
          shouldRebuild: (prev, next) => true,
          builder: (context, list, child) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: list.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Dimensions.propertyForCountPerLine,
                crossAxisSpacing: Dimensions.checkBoxRadioBoxBetweenSpacing.h,
                mainAxisSpacing: Dimensions.checkBoxRadioBoxBetweenSpacing.h,
                childAspectRatio: (Dimensions.checkBoxRadioBoxAspectRatioWidth /
                    Dimensions.propertyForAspectRatioHeight),
              ),
              itemBuilder: (context, index) {
                return CheckboxRadioItem(
                  id: list[index].id,
                  name: list[index].name,
                  isSelected: list[index].isSelected,
                  onSelect: (selectedId) {
                    addPropertyProvider.selectPropertyFor(
                      selectedId,
                    );
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget _negotiationWidget(BuildContext context) {
    return Row(
      children: [
        Selector<AddPropertyProvider, bool>(
          shouldRebuild: (prev, next) => prev != next,
          selector: (_, state) => state.isNegotiable,
          builder: (context, isEnabled, child) {
            return InkWell(
              onTap: () {
                addPropertyProvider.updateNegotiationOption(
                  !addPropertyProvider.isNegotiable,
                );
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IgnorePointer(
                    child: CustomCheckbox(
                      checkBoxSize: Dimensions.checkBoxRadioBoxCheckboxSize.h,
                      value: isEnabled,
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
                    width: Dimensions.checkboxAndTextSpacing.w,
                  ),
                  Text(
                    localizationsContext.allowNegotiation,
                    style: TextStyle(
                      fontSize: Dimensions.checkboxLabelSize.sp,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.blackColor,
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
  }

  _priceRangeWidget(BuildContext context) {
    return Selector<AddPropertyProvider, List<DbPropertyFor>>(
      selector: (_, state) => state.propertyForList,
      shouldRebuild: (prev, next) => true,
      builder: (context, list, child) {
        final sell = list
                .firstWhereOrNull(
                  (element) => element.id == SaveDefaultData.propertyForSellId,
                )
                ?.isSelected ??
            false;
        final rent = list
                .firstWhereOrNull(
                  (element) => element.id == SaveDefaultData.propertyForRentId,
                )
                ?.isSelected ??
            false;
        final lease = list
                .firstWhereOrNull(
                  (element) => element.id == SaveDefaultData.propertyForLeaseId,
                )
                ?.isSelected ??
            false;
        if (sell || rent || lease) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SpaceBetweenFields(),
              _headerTitleWidget(
                context,
                '${localizationsContext.priceRangeFilter}',
              ),
              SizedBox(
                height:
                    Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
              ),
              if (sell)
                _priceRangeForWidget(
                  context,
                  forEnum: PriceEnum.sell,
                ),
              if (sell && rent)
                SizedBox(
                  height: Dimensions.priceRangeForContentSpacing.h,
                ),
              if (rent)
                _priceRangeForWidget(
                  context,
                  forEnum: PriceEnum.rent,
                ),
              if ((sell || rent) && lease)
                SizedBox(
                  height: Dimensions.priceRangeForContentSpacing.h,
                ),
              if (lease)
                _priceRangeForWidget(
                  context,
                  forEnum: PriceEnum.lease,
                ),
              SizedBox(
                height: Dimensions
                    .addBuyerFilterSubtitleAndDropdownFieldBetweenSpace.h,
              ),
              _negotiationWidget(context),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  _priceForText(BuildContext context, String priceFor) {
    return Text(
      priceFor,
      style: TextStyle(
        color: StaticFunctions.getColor(
          context,
          ColorEnum.blackColor,
        ),
        fontSize: Dimensions.priceRangeForTextSize.sp,
      ),
    );
  }

  BoxDecoration _priceForContainerDecoration(BuildContext context) {
    return BoxDecoration(
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
    );
  }

  _priceRangeForWidget(
    BuildContext context, {
    required PriceEnum forEnum,
  }) {
    return Container(
      decoration: _priceForContainerDecoration(context),
      padding: EdgeInsets.all(
        Dimensions.priceRangeContainerPadding.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          _priceForText(
              context,
              forEnum == PriceEnum.sell
                  ? localizationsContext.forSell
                  : forEnum == PriceEnum.rent
                      ? localizationsContext.forRent
                      : forEnum == PriceEnum.lease
                          ? localizationsContext.forLease
                          : ''),
          SizedBox(
            height:
                Dimensions.addBuyerFilterSubtitleAndDropdownFieldBetweenSpace.h,
          ),
          Row(
            children: [
              PriceRangeField(
                isItMinRange: true,
                priceEnum: forEnum,
              ),
              /*SizedBox(
                width: Dimensions.priceRangeItemBetweenSpacing.w,
              ),
              PriceRangeField(
                isItMinRange: false,
                priceEnum: forEnum,
              ),*/
            ],
          ),
          Selector<AddPropertyProvider, String>(
            shouldRebuild: (prev, next) => true,
            selector: (_, state) => forEnum == PriceEnum.sell
                ? state.sellPriceRangeText
                : forEnum == PriceEnum.rent
                    ? state.rentPriceRangeText
                    : state.leasePriceRangeText,
            builder: (_, priceText, __) {
              if (priceText.trim().isEmpty) {
                return SizedBox();
              }
              return Column(
                children: [
                  SizedBox(
                    height:
                        Dimensions.priceRangeDisplayTextAndFieldBetweenSpace.h,
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
            height:
                Dimensions.addBuyerFilterSubtitleAndDropdownFieldBetweenSpace.h,
          ),
          _priceBySizeForWidget(
            context,
            forEnum,
          ),
        ],
      ),
    );
  }

  _totalSizeWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SpaceBetweenFields(),
        _headerTitleWidget(
          context,
          '${localizationsContext.totalSize}',
        ),
        SizedBox(
          height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
        ),
        Container(
          decoration: _priceForContainerDecoration(context),
          padding: EdgeInsets.all(
            Dimensions.priceRangeContainerPadding.w,
          ),
          child: SizedBox(
            height: Dimensions.measurementTextFieldHeight.h,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: IgnorePointer(
                            child: TextFieldWidget(
                              keepLabelAlwaysOnTop: true,
                              backgroundColor: StaticFunctions.getColor(
                                context,
                                ColorEnum.whiteColor,
                              ),
                              onValueChanged:
                                  (int? currentIndex, String value) {},
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: IntrinsicHeight(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: TextFieldWidget(
                                    keyBoardType: TextInputType.number,
                                    keepLabelAlwaysOnTop: true,
                                    inputAction: TextInputAction.done,
                                    isOutlineBorderRequired: false,
                                    maxLength: AppConfig.maxLengthForAreaSize,
                                    contentPadding: EdgeInsets.only(
                                      left:
                                          Dimensions.fieldContentPaddingWidth.w,
                                      right: Dimensions
                                              .fieldContentPaddingWidth.w /
                                          2,
                                      top: Dimensions
                                          .fieldContentPaddingHeight.h,
                                    ),
                                    inputFormatter: [
                                      FilteringTextInputFormatter.deny(
                                        RegExp('[,]'),
                                      ),
                                    ],
                                    controller:
                                        addPropertyProvider.totalSizeController,
                                    onValueChanged:
                                        (int? currentIndex, String value) {
                                      addPropertyProvider
                                          .calculateSellPriceBySize();
                                      addPropertyProvider
                                          .calculateRentPriceBySize();
                                      addPropertyProvider
                                          .calculateLeasePriceBySize();
                                      return addPropertyProvider
                                          .updatePropertyDetails(
                                        localizationsContext.totalSize,
                                        value,
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: (Dimensions.fieldHeight * 0.25).h,
                                  ),
                                  child: VerticalDivider(
                                    width: Dimensions
                                        .measurementDropdownDividerThickness.w,
                                    thickness: Dimensions
                                        .measurementDropdownDividerThickness.w,
                                    color: StaticFunctions.getColor(
                                      context,
                                      ColorEnum.dividerColor,
                                    ),
                                  ),
                                ),
                                MeasureSize(
                                  onChange: (Size size) {
                                    addPropertyProvider
                                        .onMeasureUnitDropdownSizeChange(
                                      size,
                                    );
                                  },
                                  child: Selector<AddPropertyProvider,
                                      TextEditingController>(
                                    shouldRebuild: (prev, next) => true,
                                    selector: (_, state) =>
                                        state.measureUnitTextFieldController,
                                    builder: (context, controller, child) {
                                      return Container(
                                        alignment: Alignment.centerRight,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: Dimensions
                                              .measurementDropdownMenuContentPadding
                                              .w,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Center(
                                              child: Text(
                                                controller.text,
                                                style: TextStyle(
                                                  fontSize: Dimensions
                                                      .measurementDropdownTextSize
                                                      .sp,
                                                  color:
                                                      StaticFunctions.getColor(
                                                    context,
                                                    ColorEnum.blackColor,
                                                  ),
                                                ),
                                                textAlign: TextAlign.end,
                                              ),
                                            ),
                                            SizedBox(
                                              width: Dimensions
                                                  .measurementDropdownMenuContentPadding
                                                  .w,
                                            ),
                                            Center(
                                              child: SvgPicture.asset(
                                                Strings.iconDropdownArrow,
                                                color: StaticFunctions.getColor(
                                                  context,
                                                  ColorEnum.gray90Color,
                                                ),
                                                height: Dimensions
                                                    .measurementDropdownArrowSize
                                                    .h,
                                                width: Dimensions
                                                    .measurementDropdownArrowSize
                                                    .h,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  child: Selector<AddPropertyProvider, Size>(
                    shouldRebuild: (prev, next) => true,
                    selector: (_, state) => state.measureDropdownSize,
                    builder: (_, size, __) {
                      return SizedBox(
                        width: size.width,
                        child: Selector<AddPropertyProvider,
                            List<DbPropertyAreaUnit>>(
                          shouldRebuild: (prev, next) => true,
                          selector: (_, state) => state.areaUnitList,
                          builder: (context, list, child) {
                            final List<int> ids = [];
                            final List<String> values = [];
                            for (int i = 0; i < list.length; i++) {
                              ids.add(list[i].id);
                              values.add(list[i].unit);
                            }
                            return Theme(
                              data: Theme.of(context).copyWith(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                              ),
                              child: CustomDropDownList(
                                ids: ids,
                                values: values,
                                widthOfDropdown:
                                    Dimensions.measurementDropdownWidth.w,
                                selectedId:
                                    addPropertyProvider.selectedMeasureUnit,
                                onDropDownSelectionChanged: (id, value) {
                                  addPropertyProvider.selectMeasureUnit(id);
                                  addPropertyProvider.updatePropertyDetails(
                                    localizationsContext.totalSizeUnit,
                                    id,
                                    dropDownValue: value,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _noteWidget(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SpaceBetweenFields(),
        _headerTitleWidget(
          context,
          localizationsContext.propertyNote,
        ),
        SizedBox(
          height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
        ),
        TextFieldWidget(
          maxLines: Dimensions.addOwnerCommentsFieldMaxLine,
          fieldHeight: Dimensions.addOwnerCommentsFieldHeight.h,
          keyBoardType: TextInputType.multiline,
          inputAction: Platform.isAndroid
              ? TextInputAction.newline
              : TextInputAction.done,
          keepLabelAlwaysOnTop: true,
          controller: addPropertyProvider.ownerCommentsController,
          onValueChanged: (int? currentIndex, String value) {
            return addPropertyProvider.updatePropertyDetails(
              localizationsContext.propertyNote,
              value,
            );
          },
        ),
      ],
    );
  }

  _locationWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SpaceBetweenFields(),
        _headerTitleWidget(
          context,
          '${localizationsContext.location}',
        ),
        SizedBox(
          height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
        ),
        Container(
          decoration: _priceForContainerDecoration(context),
          padding: EdgeInsets.all(
            Dimensions.priceRangeContainerPadding.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _privateLocationWidget(context),
              SizedBox(
                height: Dimensions
                    .addBuyerFilterSubtitleAndDropdownFieldBetweenSpace.h,
              ),
              _publicLocationWidget(context),
            ],
          ),
        ),
      ],
    );
  }

  _privateLocationWidget(BuildContext context) {
    return Stack(
      children: [
        Selector<AddPropertyProvider,
            Tuple2<TextEditingController, RetrieveLocationArg?>>(
          shouldRebuild: (prev, next) => true,
          selector: (_, state) => Tuple2(
            state.propertyPrivateLocationController,
            state.privateLocationArguments,
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
                label: localizationsContext.privateLocationHint,
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
                onChanged: (value) {
                  addPropertyProvider.updatePropertyDetails(
                    localizationsContext.addressLandmark,
                    value,
                  );
                },
              ),
              suggestionsCallback: (pattern) {
                return addPropertyProvider.getFilteredLocation(
                  pattern,
                  false,
                );
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
                addPropertyProvider.selectLocationSuggestion(
                  context,
                  suggestion,
                  false,
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
                      addPropertyProvider.updateLocationInfo(result);
                      addPropertyProvider.updatePropertyDetails(
                        localizationsContext.location,
                        result.areaName,
                      );
                      if (result.placeId != null &&
                          result.placeId!.toString().trim().isNotEmpty) {
                        final response =
                            await Provider.of<FetchLocationProvider>(
                          context,
                          listen: false,
                        ).callToRetrieveCoordinatesFromGooglePlaceId(
                          result,
                        );
                        addPropertyProvider.updateLocationInfo(response);
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
    );
  }

  _publicLocationWidget(BuildContext context) {
    return Stack(
      children: [
        Selector<AddPropertyProvider,
            Tuple2<TextEditingController, RetrieveLocationArg?>>(
          shouldRebuild: (prev, next) => true,
          selector: (_, state) => Tuple2(
            state.propertyPublicLocationController,
            state.publicLocationArguments,
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
                label: localizationsContext.publicLocationHint,
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
                onChanged: (value) {
                  addPropertyProvider.updatePropertyDetails(
                    localizationsContext.publicAddressLandmark,
                    value,
                  );
                },
              ),
              suggestionsCallback: (pattern) {
                return addPropertyProvider.getFilteredLocation(
                  pattern,
                  true,
                );
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
                addPropertyProvider.selectLocationSuggestion(
                  context,
                  suggestion,
                  true,
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
                      addPropertyProvider.updatePublicLocationInfo(result);
                      addPropertyProvider.updatePropertyDetails(
                        localizationsContext.publicLocation,
                        result.areaName,
                      );
                      if (result.placeId != null &&
                          result.placeId!.toString().trim().isNotEmpty) {
                        final response =
                            await Provider.of<FetchLocationProvider>(
                          context,
                          listen: false,
                        ).callToRetrieveCoordinatesFromGooglePlaceId(
                          result,
                        );
                        addPropertyProvider.updatePublicLocationInfo(response);
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
    );
  }

  Widget _priceBySizeForWidget(BuildContext context, PriceEnum forEnum) {
    return SizedBox(
      height: Dimensions.measurementTextFieldHeight.h,
      child: Stack(
        children: [
          Selector<AddPropertyProvider,
              Tuple2<FocusNode, TextEditingController>>(
            shouldRebuild: (prev, next) => true,
            selector: (_, state) => forEnum == PriceEnum.sell
                ? Tuple2(
                    state.sellPricePerSizeFocusNode,
                    state.sellPricePerSizeController,
                  )
                : forEnum == PriceEnum.rent
                    ? Tuple2(
                        state.rentPricePerSizeFocusNode,
                        state.rentPricePerSizeController,
                      )
                    : Tuple2(
                        state.leasePricePerSizeFocusNode,
                        state.leasePricePerSizeController,
                      ),
            builder: (context, data, child) {
              String value = data.item2.text.toString();
              if (value.trim().isEmpty &&
                  addPropertyProvider.areaUnitList.isNotEmpty) {
                final defaultUnitId =
                    addPropertyProvider.getDefaultPriceUnitId();
                value = addPropertyProvider.areaUnitList
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
                onValueChanged: (int? currentIndex, String value) {
                  addPropertyProvider.onPriceBySizeChange(priceEnum: forEnum);
                  return addPropertyProvider.updatePropertyDetails(
                    forEnum == PriceEnum.sell
                        ? localizationsContext.sellPriceBySizeTag
                        : forEnum == PriceEnum.rent
                            ? localizationsContext.rentPriceBySizeTag
                            : forEnum == PriceEnum.lease
                                ? localizationsContext.leasePriceBySizeTag
                                : '',
                    value,
                  );
                },
              );
            },
          ),
          Positioned(
            right: Dimensions.measurementDropdownMenuContentPadding.w,
            top: 0,
            bottom: 0,
            child: Center(
              child: Selector<AddPropertyProvider, TextEditingController>(
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
                        '${controller.text}',
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _propertyForWidget(context),
        _propertyTypeWidget(context),
        _totalSizeWidget(context),
        _priceRangeWidget(context),
        _locationWidget(context),
        SpaceBetweenFields(),
        Selector<AddPropertyProvider, List<File>>(
          shouldRebuild: (prev, next) => true,
          selector: (_, state) => state.imagePaths,
          builder: (context, list, child) {
            return _headerTitleWidget(
              context,
              '${localizationsContext.uploadImages} (${list.length}/${AppConfig.maxImagesAllowed})',
            );
          },
        ),
        SizedBox(
          height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
        ),
        AddUploadImages(
          localizationsContext: localizationsContext,
          addPropertyProvider: addPropertyProvider,
        ),
        _noteWidget(context),
      ],
    );
  }
}
