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
import '../../add_buyer/add_buyer_provider.dart';
import '../../add_property/model/price_enum.dart';

class PriceRangeField extends StatelessWidget {
  final bool isItMinRange;
  final PriceEnum priceFor;

  PriceRangeField({
    Key? key,
    required this.priceFor,
    required this.isItMinRange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddBuyerProvider>(context, listen: false);
    final AppLocalizations localizationsContext = AppLocalizations.of(context)!;
    return Expanded(
      child: Selector<AddBuyerProvider, Tuple2<int, TextEditingController>>(
        shouldRebuild: (prev, next) => true,
        selector: (_, state) => Tuple2(
          isItMinRange
              ? priceFor == PriceEnum.sell
                  ? state.selectedSellMinPriceUnit
                  : priceFor == PriceEnum.rent
                      ? state.selectedRentMinPriceUnit
                      : state.selectedLeaseMinPriceUnit
              : priceFor == PriceEnum.sell
                  ? state.selectedSellMaxPriceUnit
                  : priceFor == PriceEnum.rent
                      ? state.selectedRentMaxPriceUnit
                      : state.selectedLeaseMaxPriceUnit,
          isItMinRange
              ? priceFor == PriceEnum.sell
                  ? state.sellMinPriceRangeController
                  : priceFor == PriceEnum.rent
                      ? state.rentMinPriceRangeController
                      : state.leaseMinPriceRangeController
              : priceFor == PriceEnum.sell
                  ? state.sellMaxPriceRangeController
                  : priceFor == PriceEnum.rent
                      ? state.rentMaxPriceRangeController
                      : state.leaseMaxPriceRangeController,
        ),
        builder: (context, controller, child) {
          return Container(
            height: Dimensions.priceRangeTextFieldHeight.h,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: IgnorePointer(
                            ignoring: true,
                            child: TextFieldWidget(
                              label: isItMinRange
                                  ? localizationsContext.minPriceRangeHint
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
                                  child: Container(
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
                                            .fieldContentPaddingWithPrefixWidth
                                            .w,
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
                                        PriceFormatter(),
                                      ],
                                      maxLines: 1,
                                      maxLength:
                                          AppConfig.priceRangeFieldMaxLength,
                                      textSize:
                                          Dimensions.priceRangeTextSize.sp,
                                      onValueChanged: (int? currentIndex,
                                              String value) =>
                                          provider.setPriceRangeText(priceFor),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: (Dimensions.fieldHeight * 0.25).h,
                                  ),
                                  child: VerticalDivider(
                                    width: Dimensions
                                        .priceRangeUnitDropdownDividerThickness
                                        .w,
                                    thickness: Dimensions
                                        .priceRangeUnitDropdownDividerThickness
                                        .w,
                                    color: StaticFunctions.getColor(
                                      context,
                                      ColorEnum.dividerColor,
                                    ),
                                  ),
                                ),
                                MeasureSize(
                                  onChange: (newSize) =>
                                      provider.onPriceRangeDropdownSizeChange(
                                    isMin: isItMinRange,
                                    newSize: newSize,
                                    priceFor: priceFor,
                                  ),
                                  child: Selector<AddBuyerProvider,
                                      TextEditingController>(
                                    shouldRebuild: (prev, next) => true,
                                    selector: (_, state) => isItMinRange
                                        ? (priceFor == PriceEnum.sell
                                            ? state
                                                .sellMinPriceUnitTextFieldController
                                            : priceFor == PriceEnum.rent
                                                ? state
                                                    .rentMinPriceUnitTextFieldController
                                                : state
                                                    .leaseMinPriceUnitTextFieldController)
                                        : (priceFor == PriceEnum.sell
                                            ? state
                                                .sellMaxPriceUnitTextFieldController
                                            : priceFor == PriceEnum.rent
                                                ? state
                                                    .rentMaxPriceUnitTextFieldController
                                                : state
                                                    .leaseMaxPriceUnitTextFieldController),
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
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  child: Selector<AddBuyerProvider, Size>(
                    shouldRebuild: (prev, next) => true,
                    selector: (_, state) => isItMinRange
                        ? priceFor == PriceEnum.sell
                            ? state.sellMinPriceDropdownSize
                            : priceFor == PriceEnum.rent
                                ? state.rentMinPriceDropdownSize
                                : state.leaseMinPriceDropdownSize
                        : priceFor == PriceEnum.sell
                            ? state.sellMaxPriceDropdownSize
                            : priceFor == PriceEnum.rent
                                ? state.rentMaxPriceDropdownSize
                                : state.leaseMaxPriceDropdownSize,
                    builder: (_, size, __) {
                      return Container(
                        width: size.width,
                        child: Selector<AddBuyerProvider,
                            List<DbPropertyPriceUnit>>(
                          shouldRebuild: (prev, next) => true,
                          selector: (_, state) =>
                              state.priceRangeDropdownUnitList,
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
                                    ? priceFor == PriceEnum.sell
                                        ? provider.selectedSellMinPriceUnit
                                        : priceFor == PriceEnum.rent
                                            ? provider.selectedRentMinPriceUnit
                                            : provider.selectedLeaseMinPriceUnit
                                    : priceFor == PriceEnum.sell
                                        ? provider.selectedSellMaxPriceUnit
                                        : priceFor == PriceEnum.rent
                                            ? provider.selectedRentMaxPriceUnit
                                            : provider
                                                .selectedLeaseMaxPriceUnit,
                                onDropDownSelectionChanged: (id, value) =>
                                    provider.selectPriceUnit(
                                  id: id,
                                  isMin: isItMinRange,
                                  priceFor: priceFor,
                                ),
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
