import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../const/dimen_const.dart';
import '../../../localdb/properties/db_property_preferred_cast.dart';
import '../../../localdb/save_default_data.dart';
import '../../../utils/app_config.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';
import '../../../views/add_property/widgets/space_between_fields.dart';
import '../../../widgets/checkbox_widget.dart';
import '../../../widgets/custom_chip.dart';
import '../../../widgets/radio_button.dart';
import '../../../widgets/text_field_widget.dart';
import '../../common_widget/preferred_cast_item_widget.dart';
import '../../common_widget/public_property_confirmation/public_property_confirmation.dart';
import '../../property_details/model/property_visibility_option.dart';
import '../add_property_provider.dart';

class PropertyOtherDetails extends StatelessWidget {
  final AddPropertyProvider provider;
  final AppLocalizations localizationsContext;

  const PropertyOtherDetails({
    Key? key,
    required this.provider,
    required this.localizationsContext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _preferredCastWidget(context),
        SizedBox(
          height: Dimensions.addBuyerBasicDetailWithoutHeaderPadding.h,
        ),
        TextFieldWidget(
          label: localizationsContext.chainOfBrokers,
          hint: localizationsContext.chainOfBrokersHint,
          keyBoardType: TextInputType.number,
          maxLength: 1,
          keepLabelAlwaysOnTop: true,
          inputAction: TextInputAction.done,
          controller: provider.chainOfBrokersController,
          inputFormatter: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          onValueChanged: (int? currentIndex, String value) {
            provider.updatePropertyDetails(
              localizationsContext.chainOfBrokers,
              value,
            );
          },
        ),
        SpaceBetweenFields(),
        _propertyVisibilityWidget(context),
        SpaceBetweenFields(),
        _exchangeAllowedWidget(context),
        SizedBox(
          height: Dimensions.addBuyerBasicDetailWithoutHeaderPadding.h,
        ),
        _propertyTagsWidget(),
      ],
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

  Widget _propertyTagsWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldWidget(
          label: localizationsContext.tags,
          hint: localizationsContext.tagsHint,
          keepLabelAlwaysOnTop: true,
          inputAction: TextInputAction.done,
          controller: provider.propertyTagsController,
          onValueChanged: (int? currentIndex, String value) {
            if (value.contains(',')) {
              List<String> tags = value.split(',');
              if (tags.isNotEmpty) {
                tags.forEach(
                  (element) {
                    if (element.trim().isNotEmpty) {
                      provider.addOrDeleteTagList(
                        false,
                        element.trim(),
                      );
                    }
                  },
                );
              }
            }
          },
        ),
        Selector<AddPropertyProvider, List<String>>(
          shouldRebuild: (prev, next) => true,
          selector: (_, state) => state.tagList,
          builder: (context, list, child) {
            if (list.isEmpty) {
              return const SizedBox();
            } else {
              Map<int, String> map = {};
              for (int i = 0; i < list.length; i++) {
                map[i] = list[i];
              }
              return Column(
                children: [
                  SizedBox(
                    height: Dimensions
                        .addBuyerFilterSubtitleAndContentBetweenSpace.h,
                  ),
                  CustomChip(
                    chipList: map,
                    onChipDeleted: (int id) {
                      provider.addOrDeleteTagList(
                        true,
                        map[id]!,
                      );
                    },
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }

  _preferredCastWidget(BuildContext context) {
    provider.updateBasicPropertyDetailsKeys(localizationsContext.preferredCast);
    return Selector<AddPropertyProvider, List<DbPropertyPreferredCast>>(
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
            _headerTitleWidget(
              context,
              localizationsContext.preferredCast,
            ),
            SizedBox(
              height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
            ),
            InkWell(
              onTap: () => provider.selectPropertyCast(
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
                          child: PreferredCastItem(
                            caste: list[firstIndex],
                            onSelect: (selectedModel) =>
                                provider.selectPropertyCast(
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
                                provider.selectPropertyCast(
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

  _propertyVisibilityWidget(BuildContext context) {
    return Selector<AddPropertyProvider, List<PropertyVisibility>>(
      selector: (_, state) => state.propertyVisibilityList,
      shouldRebuild: (prev, next) => true,
      builder: (context, list, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            _headerTitleWidget(
              context,
              localizationsContext.propertyMarkAsVisibility,
            ),
            SizedBox(
              height: Dimensions.addBuyerFilterSubtitleAndContentBetweenSpace.h,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: list.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Dimensions.addPropertyVisibilityCountPerLine,
                crossAxisSpacing:
                    Dimensions.addPropertyVisibilityBoxHorizontalSpacing.h,
                mainAxisSpacing:
                    Dimensions.addPropertyVisibilityBoxVerticalSpacing.h,
                childAspectRatio:
                    (Dimensions.addPropertyVisibilityBoxAspectRatioWidth /
                        Dimensions.addPropertyVisibilityBoxAspectRatioHeight),
              ),
              itemBuilder: (BuildContext context, int index) {
                final currentItem = list[index];
                final selectedItemId =
                    list.firstWhereOrNull((e) => e.isSelected)?.id ?? -1;
                return Container(
                  decoration: BoxDecoration(
                    color: StaticFunctions.getColor(
                      context,
                      ColorEnum.themeColorOpacity3Percentage,
                    ),
                    borderRadius: BorderRadius.circular(
                      Dimensions.addPropertyVisibilityBoxBorderRadius.r,
                    ),
                    border: Border.all(
                      color: StaticFunctions.getColor(
                        context,
                        currentItem.isSelected
                            ? ColorEnum.themeColor
                            : ColorEnum.borderColorE0,
                      ),
                      width: Dimensions.addPropertyVisibilityBoxBorderWidth.w,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(
                        Dimensions.addPropertyVisibilityBoxBorderRadius.r,
                      ),
                      onTap: () async {
                        if (selectedItemId !=
                                SaveDefaultData.propertyVisibilityPublicId &&
                            currentItem.id ==
                                SaveDefaultData.propertyVisibilityPublicId) {
                          final markAsPublic = await PublicPropertyConfirmation
                              .showConfirmationPicker(
                            context,
                            localizationsContext,
                          );
                          if (markAsPublic) {
                            provider.selectPropertyVisibility(currentItem.id);
                          }
                        } else {
                          provider.selectPropertyVisibility(currentItem.id);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          left: Dimensions
                              .addPropertyVisibilityBoxHorizontalSpacing.w,
                          right:
                              Dimensions.addPropertyVisibilityBoxInnerPadding.w,
                          top:
                              Dimensions.addPropertyVisibilityBoxInnerPadding.h,
                          bottom:
                              Dimensions.addPropertyVisibilityBoxInnerPadding.h,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                if (AppConfig.showRadioOrCheckbox)
                                  CustomRadio(
                                    value: currentItem.id,
                                    groupValue: selectedItemId,
                                    selectedColor: StaticFunctions.getColor(
                                      context,
                                      ColorEnum.themeColor,
                                    ),
                                    borderColor: StaticFunctions.getColor(
                                      context,
                                      currentItem.id == currentItem.id
                                          ? ColorEnum.themeColor
                                          : ColorEnum.borderColorE0,
                                    ),
                                    onChanged: (value) {},
                                  ),
                                if (AppConfig.showRadioOrCheckbox)
                                  SizedBox(
                                    width: Dimensions
                                        .addPropertyVisibilityBoxRadioAndContentPadding
                                        .w,
                                  ),
                                Text(
                                  currentItem.title,
                                  style: TextStyle(
                                    fontSize: Dimensions
                                        .addPropertyVisibilityTitleTextSize.sp,
                                    color: StaticFunctions.getColor(
                                      context,
                                      ColorEnum.blackColor,
                                    ),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Dimensions
                                  .addPropertyVisibilityBoxTitleAndSubtitlePadding
                                  .h,
                            ),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (AppConfig.showRadioOrCheckbox)
                                    Visibility(
                                      visible: false,
                                      maintainAnimation: true,
                                      maintainState: true,
                                      maintainSize: true,
                                      child: CustomRadio(
                                        value: currentItem.id,
                                        groupValue: selectedItemId,
                                        selectedColor: StaticFunctions.getColor(
                                          context,
                                          ColorEnum.themeColor,
                                        ),
                                        borderColor: StaticFunctions.getColor(
                                          context,
                                          currentItem.id == currentItem.id
                                              ? ColorEnum.themeColor
                                              : ColorEnum.borderColorE0,
                                        ),
                                        onChanged: (value) {},
                                      ),
                                    ),
                                  if (AppConfig.showRadioOrCheckbox)
                                    SizedBox(
                                      width: Dimensions
                                          .addPropertyVisibilityBoxRadioAndContentPadding
                                          .w,
                                    ),
                                  Expanded(
                                    child: Text(
                                      currentItem.subtitle,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: Dimensions
                                            .addPropertyVisibilitySubtitleTextSize
                                            .sp,
                                        color: StaticFunctions.getColor(
                                          context,
                                          ColorEnum.gray90Color,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _exchangeAllowedWidget(BuildContext context) {
    return Row(
      children: [
        Selector<AddPropertyProvider, bool>(
          shouldRebuild: (prev, next) => prev != next,
          selector: (_, state) => state.exchangedAllowed,
          builder: (context, isEnabled, child) {
            return InkWell(
              onTap: () {
                provider.updateAllowExchangeOption(
                  !provider.exchangedAllowed,
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
                    localizationsContext.allowExchange,
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
}
