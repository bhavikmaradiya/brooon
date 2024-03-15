import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import './measurement_field_widget.dart';
import './price_range_field_widget.dart';
import '../../../const/dimen_const.dart';
import '../../../const/routes.dart';
import '../../../const/string_const.dart';
import '../../../localdb/helpers/db_locations_tags.dart';
import '../../../localdb/properties/db_property_for.dart';
import '../../../localdb/properties/db_property_type.dart';
import '../../../localdb/save_default_data.dart';
import '../../../utils/app_config.dart';
import '../../../utils/choose_location_from_enum.dart';
import '../../../utils/enums.dart';
import '../../../utils/price_formatter.dart';
import '../../../utils/static_functions.dart';
import '../../../widgets/checkbox_widget.dart';
import '../../../widgets/suggestion_field/suggestion_field_configuration.dart';
import '../../../widgets/suggestion_field/suggestions_box/suggestions_box_decoration.dart';
import '../../../widgets/suggestion_field/text_field_with_dropdown.dart';
import '../../../widgets/suggestion_field_item.dart';
import '../../../widgets/text_field_widget.dart';
import '../../add_property/model/price_enum.dart';
import '../../choose_location/fetch_location_provider.dart';
import '../../choose_location/model/retrieve_location_arg.dart';
import '../../common_widget/checkbox_radio_item.dart';
import '../../filter/widget/property_type_item_widget.dart';
import '../add_buyer_provider.dart';

class AddBuyerBasicDetails extends StatelessWidget {
  final AppLocalizations localizationsContext;
  final AddBuyerProvider provider;

  AddBuyerBasicDetails({
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
      child: Column(
        children: [
          _propertyForWidget(context),
          _propertyTypeWidget(context),
          Selector<AddBuyerProvider, List<DbPropertyType>>(
            shouldRebuild: (prev, next) => true,
            selector: (_, state) => state.propertyTypeList,
            builder: (_, _data, __) {
              return Column(
                children: [
                  _measureWidget(context),
                  _priceRangeWidget(context),
                  _locationWidget(context),
                  _noteWidget(context),
                ],
              );
            },
          ),
        ],
      ),
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
          child: Selector<AddBuyerProvider, int>(
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
              Selector<AddBuyerProvider,
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
                      return provider.getFilteredLocation(pattern);
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
                      provider.selectLocationSuggestion(
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
                            provider.updateLocationInfo(result);
                            if (result.placeId != null &&
                                result.placeId!.toString().trim().isNotEmpty) {
                              final response = await Provider.of<
                                          FetchLocationProvider>(context,
                                      listen: false)
                                  .callToRetrieveCoordinatesFromGooglePlaceId(
                                result,
                              );
                              provider.updateLocationInfo(response);
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

  _priceRangeWidget(BuildContext context) {
    return Selector<AddBuyerProvider, List<DbPropertyFor>>(
      shouldRebuild: (prev, next) => true,
      selector: (_, state) => state.propertyForList,
      builder: (_, propertyForList, __) {
        final sell = propertyForList
                .firstWhereOrNull(
                  (element) => element.id == SaveDefaultData.propertyForSellId,
                )
                ?.isSelected ??
            false;
        final rent = propertyForList
                .firstWhereOrNull(
                  (element) => element.id == SaveDefaultData.propertyForRentId,
                )
                ?.isSelected ??
            false;
        final lease = propertyForList
                .firstWhereOrNull(
                  (element) => element.id == SaveDefaultData.propertyForLeaseId,
                )
                ?.isSelected ??
            false;
        if (sell || rent || lease) {
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
                height:
                    Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
              ),
              if (sell)
                _priceRangeForWidget(
                  context,
                  priceFor: PriceEnum.sell,
                ),
              if (sell && rent)
                SizedBox(
                  height: Dimensions.priceRangeForContentSpacing.h,
                ),
              if (rent)
                _priceRangeForWidget(
                  context,
                  priceFor: PriceEnum.rent,
                ),
              if ((sell || rent) && lease)
                SizedBox(
                  height: Dimensions.priceRangeForContentSpacing.h,
                ),
              if (lease)
                _priceRangeForWidget(
                  context,
                  priceFor: PriceEnum.lease,
                ),
              SizedBox(
                height: Dimensions
                    .addBuyerFilterSubtitleAndDropdownFieldBetweenSpace.h,
              ),
              _negotiationWidget(context),
            ],
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  _priceRangeForWidget(
    BuildContext context, {
    required PriceEnum priceFor,
  }) {
    return Container(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _priceForText(
                context,
                priceFor == PriceEnum.sell
                    ? localizationsContext.forBuy
                    : priceFor == PriceEnum.rent
                        ? localizationsContext.forRent
                        : priceFor == PriceEnum.lease
                            ? localizationsContext.forLease
                            : '',
              ),
              SizedBox(
                height: Dimensions
                    .addBuyerFilterSubtitleAndDropdownFieldBetweenSpace.h,
              ),
            ],
          ),
          Container(
            child: Row(
              children: [
                PriceRangeField(
                  isItMinRange: true,
                  priceFor: priceFor,
                ),
                SizedBox(
                  width: Dimensions.priceRangeItemBetweenSpacing.w,
                ),
                PriceRangeField(
                  isItMinRange: false,
                  priceFor: priceFor,
                ),
              ],
            ),
          ),
          Selector<AddBuyerProvider, String>(
            shouldRebuild: (prev, next) => true,
            selector: (_, state) => priceFor == PriceEnum.sell
                ? state.sellPriceRangeText
                : priceFor == PriceEnum.rent
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
          Container(
            child: Row(
              children: [
                _priceBySizeForWidget(
                  context,
                  isItMinRange: true,
                  priceFor: priceFor,
                ),
                SizedBox(
                  width: Dimensions.priceRangeItemBetweenSpacing.w,
                ),
                _priceBySizeForWidget(
                  context,
                  isItMinRange: false,
                  priceFor: priceFor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _negotiationWidget(BuildContext context) {
    return Row(
      children: [
        Selector<AddBuyerProvider, bool>(
          shouldRebuild: (prev, next) => prev != next,
          selector: (_, state) => state.isNegotiable,
          builder: (context, isEnabled, child) {
            return InkWell(
              onTap: () {
                provider.updateNegotiationOption(
                  !provider.isNegotiable,
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

  Widget _priceBySizeForWidget(
    BuildContext context, {
    bool isItMinRange = false,
    required PriceEnum priceFor,
  }) {
    return Expanded(
      child: SizedBox(
        height: Dimensions.measurementTextFieldHeight.h,
        child: Stack(
          children: [
            Selector<AddBuyerProvider,
                Tuple2<FocusNode, TextEditingController>>(
              shouldRebuild: (prev, next) => true,
              selector: (_, state) => isItMinRange
                  ? (priceFor == PriceEnum.sell
                      ? Tuple2(
                          state.sellMinPricePerSizeFocusNode,
                          state.sellMinPricePerSizeController,
                        )
                      : priceFor == PriceEnum.rent
                          ? Tuple2(
                              state.rentMinPricePerSizeFocusNode,
                              state.rentMinPricePerSizeController,
                            )
                          : Tuple2(
                              state.leaseMinPricePerSizeFocusNode,
                              state.leaseMinPricePerSizeController,
                            ))
                  : (priceFor == PriceEnum.sell
                      ? Tuple2(
                          state.sellMaxPricePerSizeFocusNode,
                          state.sellMaxPricePerSizeController,
                        )
                      : priceFor == PriceEnum.rent
                          ? Tuple2(
                              state.rentMaxPricePerSizeFocusNode,
                              state.rentMaxPricePerSizeController,
                            )
                          : Tuple2(
                              state.leaseMaxPricePerSizeFocusNode,
                              state.leaseMaxPricePerSizeController,
                            )),
              builder: (context, data, child) {
                String value = data.item2.text.toString();
                if (value.trim().isEmpty &&
                    provider.measurementDropdownUnitList.isNotEmpty) {
                  final defaultUnitId = provider.getDefaultPriceUnitId();
                  value = provider.measurementDropdownUnitList
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
                      provider.onPriceBySizeChange(
                    isItMinRange: isItMinRange,
                    priceFor: priceFor,
                  ),
                );
              },
            ),
            Positioned(
              right: Dimensions.measurementDropdownMenuContentPadding.w,
              top: 0,
              bottom: 0,
              child: Center(
                child: Selector<AddBuyerProvider, TextEditingController>(
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

  _noteWidget(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Dimensions.addBuyerBasicDetailFieldsPadding.h,
        ),
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
          controller: provider.ownerCommentsController,
          onValueChanged: (int? currentIndex, String value) {},
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
        Selector<AddBuyerProvider, List<DbPropertyFor>>(
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
                final currentItem = list[index];
                return CheckboxRadioItem(
                  id: currentItem.id,
                  name: currentItem.id == SaveDefaultData.propertyForSellId
                      ? localizationsContext.buy
                      : currentItem.name,
                  isSelected: currentItem.isSelected,
                  onSelect: (selectedId) => provider.selectPropertyFor(
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
        Selector<AddBuyerProvider, List<DbPropertyType>>(
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
                  onSelect: (selectedModel) => provider.selectPropertyType(
                    selectedModel.id,
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
