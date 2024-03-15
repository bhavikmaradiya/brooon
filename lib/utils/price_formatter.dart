import 'package:flutter/services.dart';

import '../../utils/app_config.dart';

class PriceFormatter extends TextInputFormatter {
  bool disableDecimal = false;

  PriceFormatter({
    this.disableDecimal = false,
  });

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      final int selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.end;
      var value = newValue.text;
      if (!disableDecimal &&
          value.contains(".") &&
          value.substring(value.indexOf(".") + 1).length >
              AppConfig.pricingDecimalLimit) {
        return TextEditingValue(
          text: oldValue.text,
          selection: TextSelection.collapsed(
            offset: oldValue.text.length - selectionIndexFromTheRight,
          ),
        );
      }
      if (newValue.text.length > 2) {
        value = value.replaceAll(RegExp(r'\D'), disableDecimal ? '' : '.');
        value = value.replaceAll(
            RegExp(r'\B(?=(?:(\d\d)+(\d)(?!\d))+(?!\d))'), ',');
      }
      return TextEditingValue(
        text: value,
        selection: TextSelection.collapsed(
          offset: value.length - selectionIndexFromTheRight,
        ),
      );
    } else {
      return newValue;
    }
  }
}
