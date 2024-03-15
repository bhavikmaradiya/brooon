import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../../const/dimen_const.dart';
import '../../../const/string_const.dart';
import '../../../localdb/properties/db_property_price_unit.dart';
import '../../../utils/app_config.dart';
import '../../../utils/enums.dart';
import '../../../utils/price_formatter.dart';
import '../../../utils/static_functions.dart';
import '../../../widgets/dropdown/custom_drop_down_list.dart';
import '../../../widgets/measure_size_widget.dart';
import '../../../widgets/text_field_widget.dart';
import '../add_property_provider.dart';
import '../model/price_enum.dart';

class PriceRangeField extends StatelessWidget {
  final bool isItMinRange;
  final PriceEnum priceEnum;

  PriceRangeField({
    Key? key,
    required this.isItMinRange,
    required this.priceEnum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AddPropertyProvider>(context, listen: false);
    AppLocalizations localizationsContext = AppLocalizations.of(context)!;
    return Expanded(
      child: Selector<AddPropertyProvider, Tuple2<int, TextEditingController>>(
        shouldRebuild: (prev, next) => true,
        selector: (_, state) => Tuple2(
          isItMinRange
              ? priceEnum == PriceEnum.sell
                  ? state.selectedMinSellPriceUnit
                  : priceEnum == PriceEnum.rent
                      ? state.selectedMinRentPriceUnit
                      : state.selectedMinLeasePriceUnit
              : priceEnum == PriceEnum.sell
                  ? state.selectedMaxSellPriceUnit
                  : priceEnum == PriceEnum.rent
                      ? state.selectedMaxRentPriceUnit
                      : state.selectedMaxLeasePriceUnit,
          isItMinRange
              ? priceEnum == PriceEnum.sell
                  ? state.minSellPriceRangeController
                  : priceEnum == PriceEnum.rent
                      ? state.minRentPriceRangeController
                      : state.minLeasePriceRangeController
              : priceEnum == PriceEnum.sell
                  ? state.maxSellPriceRangeController
                  : priceEnum == PriceEnum.rent
                      ? state.maxRentPriceRangeController
                      : state.maxLeasePriceRangeController,
        ),
        builder: (context, controller, child) {
          return Container(
            height: Dimensions.priceRangeTextFieldHeight.h,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: IgnorePointer(
                          ignoring: true,
                          child: TextFieldWidget(
                            label: isItMinRange
                                ? localizationsContext.total
                                : localizationsContext.maxPriceRangeHint,
                            backgroundColor: StaticFunctions.getColor(
                              context,
                              ColorEnum.whiteColor,
                            ),
                            keepLabelAlwaysOnTop: true,
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
                                  controller: controller.item2,
                                  keepLabelAlwaysOnTop: true,
                                  inputAction: TextInputAction.done,
                                  isOutlineBorderRequired: false,
                                  keyBoardType: TextInputType.number,
                                  /*pricePrefixValue:
                                      StaticFunctions.defaultPriceUnit,*/
                                  contentPadding: EdgeInsets.only(
                                    left: Dimensions
                                        .fieldContentPaddingWithPrefixWidth.w,
                                    right:
                                        Dimensions.fieldContentPaddingWidth.w /
                                            2,
                                    top: Dimensions.fieldContentPaddingHeight.h,
                                  ),
                                  inputFormatter: [
                                    FilteringTextInputFormatter.deny(
                                      RegExp('[,]'),
                                    ),
                                    PriceFormatter(),
                                  ],
                                  maxLines: 1,
                                  maxLength: AppConfig.priceRangeFieldMaxLength,
                                  textSize: Dimensions.priceRangeTextSize.sp,
                                  onValueChanged:
                                      (int? currentIndex, String value) {
                                    if (priceEnum == PriceEnum.sell) {
                                      provider.setSellPriceRangeText();
                                      provider.calculateSellPriceBySize();
                                    } else if (priceEnum == PriceEnum.rent) {
                                      provider.setRentPriceRangeText();
                                      provider.calculateRentPriceBySize();
                                    } else {
                                      provider.setLeasePriceRangeText();
                                      provider.calculateLeasePriceBySize();
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: (Dimensions.fieldHeight * 0.25).h,
                                ),
                                child: VerticalDivider(
                                  width: Dimensions
                                      .priceRangeUnitDropdownDividerThickness.w,
                                  thickness: Dimensions
                                      .priceRangeUnitDropdownDividerThickness.w,
                                  color: StaticFunctions.getColor(
                                    context,
                                    ColorEnum.dividerColor,
                                  ),
                                ),
                              ),
                              MeasureSize(
                                onChange: (newSize) {
                                  if (priceEnum == PriceEnum.sell) {
                                    provider.onSellPriceRangeDropdownSizeChange(
                                      isItMinRange,
                                      newSize,
                                    );
                                  } else if (priceEnum == PriceEnum.rent) {
                                    provider.onRentPriceRangeDropdownSizeChange(
                                      isItMinRange,
                                      newSize,
                                    );
                                  } else {
                                    provider
                                        .onLeasePriceRangeDropdownSizeChange(
                                      isItMinRange,
                                      newSize,
                                    );
                                  }
                                },
                                child: Selector<AddPropertyProvider,
                                    TextEditingController>(
                                  shouldRebuild: (prev, next) => true,
                                  selector: (_, state) => isItMinRange
                                      ? priceEnum == PriceEnum.sell
                                          ? state
                                              .minSellPriceUnitTextFieldController
                                          : priceEnum == PriceEnum.rent
                                              ? state
                                                  .minRentPriceUnitTextFieldController
                                              : state
                                                  .minLeasePriceUnitTextFieldController
                                      : priceEnum == PriceEnum.sell
                                          ? state
                                              .maxSellPriceUnitTextFieldController
                                          : priceEnum == PriceEnum.rent
                                              ? state
                                                  .maxRentPriceUnitTextFieldController
                                              : state
                                                  .maxLeasePriceUnitTextFieldController,
                                  builder: (context, controller, child) {
                                    return Container(
                                      alignment: Alignment.centerRight,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: Dimensions
                                            .priceRangeDropdownMenuContentPadding
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
                                                    .priceRangeUnitDropdownTextSize
                                                    .sp,
                                                color: StaticFunctions.getColor(
                                                  context,
                                                  ColorEnum.blackColor,
                                                ),
                                              ),
                                              textAlign: TextAlign.end,
                                            ),
                                          ),
                                          SizedBox(
                                            width: Dimensions
                                                .priceRangeDropdownMenuContentPadding
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
                                                  .priceRangeUnitDropdownArrowSize
                                                  .h,
                                              width: Dimensions
                                                  .priceRangeUnitDropdownArrowSize
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
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  child: Selector<AddPropertyProvider, Size>(
                    shouldRebuild: (prev, next) => true,
                    selector: (_, state) => isItMinRange
                        ? priceEnum == PriceEnum.sell
                            ? state.minSellPriceDropdownSize
                            : priceEnum == PriceEnum.rent
                                ? state.minRentPriceDropdownSize
                                : state.minLeasePriceDropdownSize
                        : priceEnum == PriceEnum.sell
                            ? state.maxSellPriceDropdownSize
                            : priceEnum == PriceEnum.rent
                                ? state.maxRentPriceDropdownSize
                                : state.maxLeasePriceDropdownSize,
                    builder: (_, size, __) {
                      return SizedBox(
                        width: size.width,
                        child: Selector<AddPropertyProvider,
                            List<DbPropertyPriceUnit>>(
                          shouldRebuild: (prev, next) => true,
                          selector: (_, state) => priceEnum == PriceEnum.sell
                              ? state.sellPriceRangeDropdownUnitList
                              : priceEnum == PriceEnum.sell
                                  ? state.rentPriceRangeDropdownUnitList
                                  : state.leasePriceRangeDropdownUnitList,
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
                                    Dimensions.priceRangeDropdownWidth.w,
                                selectedId: isItMinRange
                                    ? priceEnum == PriceEnum.sell
                                        ? provider.selectedMinSellPriceUnit
                                        : priceEnum == PriceEnum.rent
                                            ? provider.selectedMinRentPriceUnit
                                            : provider.selectedMinLeasePriceUnit
                                    : priceEnum == PriceEnum.sell
                                        ? provider.selectedMaxSellPriceUnit
                                        : priceEnum == PriceEnum.rent
                                            ? provider.selectedMaxRentPriceUnit
                                            : provider
                                                .selectedMaxLeasePriceUnit,
                                onDropDownSelectionChanged: (id, value) {
                                  if (priceEnum == PriceEnum.sell) {
                                    provider.selectSellPriceUnit(
                                      id: id,
                                      isMin: isItMinRange,
                                    );
                                    provider.calculateSellPriceBySize();
                                  } else if (priceEnum == PriceEnum.rent) {
                                    provider.selectRentPriceUnit(
                                      id: id,
                                      isMin: isItMinRange,
                                    );
                                    provider.calculateRentPriceBySize();
                                  } else {
                                    provider.selectLeasePriceUnit(
                                      id: id,
                                      isMin: isItMinRange,
                                    );
                                    provider.calculateLeasePriceBySize();
                                  }
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
          );
        },
      ),
    );
  }
}
