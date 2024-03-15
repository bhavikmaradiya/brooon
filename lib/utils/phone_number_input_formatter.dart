import 'package:flutter/services.dart';

import './app_config.dart';

class PhoneNumberTextInputFormatter extends TextInputFormatter {
  static StringBuffer phoneFormatter(String newValue) {
    final int newTextLength = newValue.length;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();
    if (newTextLength > AppConfig.mobileFormatterLength) {
      newText.write('${newValue.substring(
        0,
        usedSubstringIndex = AppConfig.mobileFormatterLength,
      )} ');
    }
    if (newTextLength >= usedSubstringIndex) {
      newText.write(
        newValue.substring(usedSubstringIndex),
      );
    }
    return newText;
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = phoneFormatter(newValue.text);
    int offset = newValue.selection.baseOffset;
    if (offset > AppConfig.mobileFormatterLength) {
      offset += 1;
    }
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(
        offset: offset,
      ),
    );
  }
}
