import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../const/dimen_const.dart';
import '../../localdb/properties/db_property_area_unit.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../views/unit_converter/unit_converter_provider.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/dropdown/drop_down_as_field.dart';
import '../../widgets/dropdown/drop_down_list.dart';
import '../../widgets/text_field_widget.dart';
import '../../widgets/toolbar.dart';

class UnitConverter extends StatelessWidget {
  const UnitConverter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UnitConverterProvider(),
      child: _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late AppLocalizations localizationsContext;

  UnitConverterProvider? provider;

  @override
  void didChangeDependencies() {
    localizationsContext = AppLocalizations.of(context)!;
    if (provider == null) {
      provider = Provider.of<UnitConverterProvider>(context, listen: false);
      provider!.init(context);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeConfig.appBar(context),
      body: SafeArea(
        child: Column(
          children: [
            ToolBar(
              enableBackground: true,
              title: localizationsContext.drawerItemUnitConverter,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  left: Dimensions.screenHorizontalMargin.w,
                  right: Dimensions.screenHorizontalMargin.w,
                  top: Dimensions.screenVerticalMarginBottom.h,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Selector<UnitConverterProvider,
                              Tuple2<TextEditingController, int>>(
                            shouldRebuild: (prev, next) => true,
                            selector: (_, state) => Tuple2(
                                state.fromUnitFieldController,
                                state.selectedFromUnit),
                            builder: (context, tuple, child) {
                              return IgnorePointer(
                                ignoring: tuple.item2 == -1,
                                child: TextFieldWidget(
                                  label: localizationsContext.hintArea,
                                  hint: localizationsContext.enterUnitHint,
                                  fontWeight: FontWeight.w600,
                                  controller: tuple.item1,
                                  backgroundColor: StaticFunctions.getColor(
                                    context,
                                    ColorEnum.whiteColor,
                                  ),
                                  inputFormatter: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^[0-9]+.?[0-9]*'),
                                    )
                                  ],
                                  keyBoardType: TextInputType.number,
                                  onValueChanged:
                                      (int? currentIndex, String value) =>
                                          provider?.validateDetails(),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: Dimensions
                              .unitConverterFieldsHorizontalBetweenSpace.w,
                        ),
                        Flexible(
                          child: Stack(
                            children: [
                              Selector<UnitConverterProvider,
                                  TextEditingController>(
                                shouldRebuild: (prev, next) => true,
                                selector: (_, state) =>
                                    state.fromTextFieldController,
                                builder: (context, controller, child) {
                                  return DropDownAsField(
                                    label: localizationsContext.fromUnitLabel,
                                    controller: controller,
                                    hint: localizationsContext.selectUnitHint,
                                  );
                                },
                              ),
                              Selector<UnitConverterProvider,
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
                                  return DropDownList(
                                    ids: ids,
                                    values: values,
                                    selectedId: provider!.getSelectedFromUnit,
                                    onDropDownSelectionChanged: (id, value) =>
                                        provider?.selectFromUnit(id),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height:
                          Dimensions.unitConverterFieldsVerticalBetweenSpace.h,
                    ),
                    Selector<UnitConverterProvider, bool>(
                      shouldRebuild: (prev, next) => true,
                      selector: (_, state) => state.isDetailsValid,
                      builder: (context, isValid, child) {
                        return ButtonWidget(
                          text: localizationsContext.enterUnitBtnConvert,
                          onClick: () {
                            StaticFunctions.unFocusKeyboardIfAny(context);
                            provider?.convertUnits();
                          },
                          textColor: StaticFunctions.getColor(
                            context,
                            isValid
                                ? ColorEnum.whiteColor
                                : ColorEnum.gray90Color,
                          ),
                          borderColor: StaticFunctions.getColor(
                            context,
                            isValid
                                ? ColorEnum.themeColor
                                : ColorEnum.borderColorE0,
                          ),
                          bgColor: StaticFunctions.getColor(
                            context,
                            isValid
                                ? ColorEnum.themeColor
                                : ColorEnum.themeColorOpacity3Percentage,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height:
                          Dimensions.unitConverterFieldsVerticalBetweenSpace.h,
                    ),
                    Selector<UnitConverterProvider,
                        List<LinkedHashMap<String, String>>>(
                      shouldRebuild: (prev, next) => true,
                      selector: (_, state) => state.convertedValues,
                      builder: (_, data, __) {
                        List<LinkedHashMap<String, String>> list = [];
                        if (data.isNotEmpty) {
                          int id = int.parse(data[0]['selected_from_unit_id']!);
                          int index = data.indexWhere(
                              (element) => int.parse(element['id']!) == id);
                          if (index != -1) {
                            list.add(data[index]);
                          }
                          for (int i = 0; i < data.length; i++) {
                            if (i != index) {
                              list.add(data[i]);
                            }
                          }
                        }
                        return Expanded(
                          child: ListView.builder(
                            itemCount: list.length,
                            padding: EdgeInsets.zero,
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              LinkedHashMap<String, String> currentUnitData =
                                  list[index];
                              String unit = currentUnitData['unit']!;
                              // String baseValue = currentUnitData['baseValue']!;
                              String convertedValue =
                                  currentUnitData['convertedValue']!;
                              return Container(
                                margin: EdgeInsets.only(
                                  top: Dimensions.unitConverterValuesMargin.h,
                                  bottom: index == list.length - 1
                                      ? Dimensions.screenVerticalMarginBottom.h
                                      : Dimensions.unitConverterValuesMargin.h,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          StaticFunctions.removeTrailingZeros(
                                            convertedValue,
                                          ),
                                          style: TextStyle(
                                            color: StaticFunctions.getColor(
                                              context,
                                              ColorEnum.blackColor,
                                            ),
                                            fontSize: index == 0
                                                ? Dimensions
                                                    .unitConverterText16Size.sp
                                                : Dimensions
                                                    .unitConverterDigitTextSize
                                                    .sp,
                                            fontWeight: index == 0
                                                ? FontWeight.w400
                                                : FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          ' $unit${index == 0 ? ' = ' : ''}',
                                          style: TextStyle(
                                            color: StaticFunctions.getColor(
                                              context,
                                              ColorEnum.blackColor,
                                            ),
                                            fontSize: index == 0
                                                ? Dimensions
                                                    .unitConverterText16Size.sp
                                                : Dimensions
                                                    .unitConverterText18Size.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
