import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/static_functions.dart';
import '../const/dimen_const.dart';
import '../utils/enums.dart';

class CustomRadio extends StatefulWidget {
  final int value;
  final int groupValue;
  final void Function(int) onChanged;
  final Color? borderColor;
  final Color? selectedColor;

  const CustomRadio({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.borderColor,
    this.selectedColor,
  }) : super(key: key);

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: widget.borderColor ?? Colors.grey,
          width: Dimensions.radioButtonOutlineBorderWidth.w,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => widget.onChanged(widget.value),
          child: Container(
            padding: EdgeInsets.all(
              Dimensions.radioButtonPadding.w,
            ),
            child: Container(
              width: Dimensions.radioButtonDotSize.w,
              height: Dimensions.radioButtonDotSize.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected && widget.selectedColor != null
                    ? widget.selectedColor
                    : StaticFunctions.getColor(
                        context,
                        ColorEnum.whiteColor,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
