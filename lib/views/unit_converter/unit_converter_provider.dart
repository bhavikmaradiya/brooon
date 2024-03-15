import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../localdb/isar_service.dart';
import '../../localdb/properties/db_property_area_unit.dart';
import '../../localdb/save_default_data.dart';
import '../../utils/app_config.dart';
import '../../utils/static_functions.dart';

class UnitConverterProvider extends ChangeNotifier {
  final isarService = IsarService();
  List<DbPropertyAreaUnit> areaUnitList = [];
  List<LinkedHashMap<String, String>> convertedValues = [];
  int selectedFromUnit = -1;
  bool isDetailsValid = false;
  String unitEquation = '';

  final fromTextFieldController = TextEditingController();

  final fromUnitFieldController = TextEditingController();

  int get getSelectedFromUnit {
    return selectedFromUnit;
  }

  bool get isValidDetails {
    return selectedFromUnit != -1 &&
        fromUnitFieldController.text.trim().isNotEmpty &&
        double.parse(fromUnitFieldController.text.trim()) > 0;
  }

  init(BuildContext context) async {
    areaUnitList = await isarService.getPropertyAreaUnits();
    selectFromUnit(SaveDefaultData.areaUnitSqFtId);
    notifyListeners();
  }

  Future<LinkedHashMap<String, String>?> calculateAllValuesOf(
    int unitId,
  ) async {
    DbPropertyAreaUnit? selectedToUnit =
        areaUnitList.firstWhereOrNull((element) => element.id == unitId);
    debugPrint('${selectedToUnit?.id} ${selectedToUnit?.unit}');
    LinkedHashMap<String, String>? values = null;
    if (isValidDetails && selectedToUnit != null) {
      values = LinkedHashMap();
      values['selected_from_unit_id'] = selectedFromUnit.toString();
      values['id'] = selectedToUnit.id.toString();
      values['unit'] = selectedToUnit.unit;
      String fromUnit = fromTextFieldController.text;
      String toUnit = selectedToUnit.unit;

      double baseUnitValue = selectedFromUnit != selectedToUnit.id
          ? await isarService.getUnitValueOf(
              selectedFromUnit, selectedToUnit.id)
          : 0;
      values['baseValue'] =
          '*1 $fromUnit = ${convertDoubleToFixed(baseUnitValue > 0 ? baseUnitValue : 1)} $toUnit';

      double fromValue = double.parse(fromUnitFieldController.text);
      double convertedValue =
          baseUnitValue > 0 ? (fromValue * baseUnitValue) : fromValue;
      values['convertedValue'] = convertDoubleToFixed(convertedValue);
    }
    debugPrint('${values.toString()}');
    return values;
  }

  convertUnits() async {
    if (isValidDetails) {
      convertedValues.clear();
      for (int i = 0; i < areaUnitList.length; i++) {
        LinkedHashMap<String, String>? value = await calculateAllValuesOf(
          areaUnitList[i].id,
        );
        if (value != null) {
          convertedValues.add(value);
        }
      }
      notifyListeners();
    }
  }

  String convertDoubleToFixed(double value) {
    return value.toString().length > AppConfig.unitCalculationMaxDecimal
        ? value.toStringAsFixed(AppConfig.unitCalculationMaxDecimal)
        : value.toString();
  }

  void selectFromUnit(int id) {
    var unitToSelect =
        areaUnitList.firstWhereOrNull((element) => element.id == id);
    if (unitToSelect != null) {
      selectedFromUnit = id;
      fromTextFieldController.text = unitToSelect.unit;
      StaticFunctions.fieldCursorPositionAtLast(fromTextFieldController);
    }
    notifyListeners();
  }

  validateDetails() {
    isDetailsValid = isValidDetails;
    notifyListeners();
  }
}
