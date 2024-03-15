import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../const/dimen_const.dart';
import '../../../const/string_const.dart';
import '../../../localdb/properties/db_property_area_unit.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';
import '../../../widgets/dropdown/custom_drop_down_list.dart';
import '../../../widgets/measure_size_widget.dart';
import '../../../widgets/text_field_widget.dart';
import '../add_buyer_provider.dart';

class MeasureField extends StatelessWidget {
  final bool isItMinRange;

  MeasureField({
    Key? key,
    required this.isItMinRange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddBuyerProvider>(context, listen: false);
    final AppLocalizations localizationsContext = AppLocalizations.of(context)!;
    return Expanded(
      child: Container(
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
                          label: isItMinRange
                              ? localizationsContext.minFilterAreaUnit
                              : localizationsContext.maxFilterAreaUnit,
                          keepLabelAlwaysOnTop: true,
                          backgroundColor: StaticFunctions.getColor(
                            context,
                            ColorEnum.whiteColor,
                          ),
                          onValueChanged: (int? currentIndex, String value) {},
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
                                child: Selector<AddBuyerProvider,
                                    TextEditingController>(
                                  shouldRebuild: (prev, next) => true,
                                  selector: (_, state) => isItMinRange
                                      ? state.minMeasureRangeController
                                      : state.maxMeasureRangeController,
                                  builder: (context, controller, child) {
                                    return TextFieldWidget(
                                      controller: controller,
                                      keepLabelAlwaysOnTop: true,
                                      inputAction: TextInputAction.done,
                                      isOutlineBorderRequired: false,
                                      contentPadding: EdgeInsets.only(
                                        left: Dimensions
                                            .fieldContentPaddingWidth.w,
                                        right: Dimensions
                                                .fieldContentPaddingWidth.w /
                                            2,
                                        top: Dimensions
                                            .fieldContentPaddingHeight.h,
                                      ),
                                      inputFormatter: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp("[0-9]"),
                                        ),
                                      ],
                                      keyBoardType: TextInputType.number,
                                      maxLines: 1,
                                      textSize:
                                          Dimensions.measurementTextSize.sp,
                                      onValueChanged:
                                          (int? currentIndex, String value) =>
                                              provider.calculatePriceBySize(
                                                  isItMinRange: isItMinRange),
                                    );
                                  },
                                ),
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
                              onChange: (Size size) => provider
                                  .onMeasureUnitDropdownSizeChange(size),
                              child: Selector<AddBuyerProvider,
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
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Center(
                                          child: Text(
                                            controller.text,
                                            style: TextStyle(
                                              fontSize: Dimensions
                                                  .measurementDropdownTextSize
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
                                                .measurementDropdownArrowSize.h,
                                            width: Dimensions
                                                .measurementDropdownArrowSize.h,
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
                selector: (_, state) => state.measureDropdownSize,
                builder: (_, size, __) {
                  return Container(
                    width: size.width,
                    child: Selector<AddBuyerProvider, List<DbPropertyAreaUnit>>(
                      shouldRebuild: (prev, next) => true,
                      selector: (_, state) => state.measurementDropdownUnitList,
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
                            selectedId: provider.selectedMeasureUnit,
                            onDropDownSelectionChanged: (id, value) =>
                                provider.selectMeasureUnit(id),
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
    );
  }
}
