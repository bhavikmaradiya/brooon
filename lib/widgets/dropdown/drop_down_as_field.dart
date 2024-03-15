import 'package:flutter/material.dart';

import '../../const/string_const.dart';
import '../text_field_widget.dart';

class DropDownAsField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool ignoring;
  final String field2ndSuffixPath;

  const DropDownAsField({
    Key? key,
    required this.label,
    required this.hint,
    required this.controller,
    this.ignoring = true,
    this.field2ndSuffixPath = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: ignoring,
      child: TextFieldWidget(
        label: label,
        hint: hint,
        keepLabelAlwaysOnTop: true,
        controller: controller,
        suffixIconAssetPath: Strings.iconDropdownArrow,
        suffixSecondIconAssetPath: field2ndSuffixPath,
        onValueChanged: (int? currentIndex, String value) => {},
      ),
    );
  }
}
