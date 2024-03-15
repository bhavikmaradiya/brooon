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
import '../filter_provider.dart';

class PriceRangeField extends StatelessWidget {
  final bool isItMinRange;

  PriceRangeField({
    Key? key,
    required this.isItMinRange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FilterProvider>(context, listen: false);
    final AppLocalizations localizationsContext = AppLocalizations.of(context)!;
    return Expanded(
      child: Selector<FilterProvider, Tuple2<int, TextEditingController>>(
        shouldRebuild: (prev, next) => true,
        selector: (_, state) => Tuple2(
          isItMinRange
              ? state.selectedMinPriceUnit
              : state.selectedMaxPriceUnit,
          isItMinRange
              ? state.minPriceRangeController
              : state.maxPriceRangeController,
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
                                      onValueChanged:
                                          (int? currentIndex, String value) =>
                                              provider.setPriceRangeText(),
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
                                    isItMinRange,
                                    newSize,
                                  ),
                                  child: Selector<FilterProvider,
                                      TextEditingController>(
                                    shouldRebuild: (prev, next) => true,
                                    selector: (_, state) => isItMinRange
                                        ? state.minPriceUnitTextFieldController
                                        : state.maxPriceUnitTextFieldController,
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
                  child: Selector<FilterProvider, Size>(
                    shouldRebuild: (prev, next) => true,
                    selector: (_, state) => isItMinRange
                        ? state.minPriceDropdownSize
                        : state.maxPriceDropdownSize,
                    builder: (_, size, __) {
                      return Container(
                        width: size.width,
                        child:
                            Selector<FilterProvider, List<DbPropertyPriceUnit>>(
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
                                    ? provider.selectedMinPriceUnit
                                    : provider.selectedMaxPriceUnit,
                                onDropDownSelectionChanged: (id, value) =>
                                    provider.selectPriceUnit(
                                  id: id,
                                  isMin: isItMinRange,
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
