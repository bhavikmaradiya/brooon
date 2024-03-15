import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../widgets/text_field_widget.dart';

class IncrementalItem extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool ignoring;
  final Function(int) onValueChanged;
  final Function(String)? onValueChangedByTyping;

  const IncrementalItem({
    Key? key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.onValueChanged,
    this.onValueChangedByTyping,
    this.ignoring = true,
  }) : super(key: key);

  _actionButton(
    BuildContext context,
    String assetPath,
    int increment,
  ) {
    return Container(
      width: Dimensions.incrementalViewContainerSize.w,
      height: Dimensions.incrementalViewContainerSize.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Dimensions.incrementalViewContainerRadius.r,
        ),
        border: Border.all(
          width: Dimensions.incrementalViewContainerBorderWidth.w,
          color: StaticFunctions.getColor(
            context,
            ColorEnum.borderColorE0,
          ),
        ),
        color: StaticFunctions.getColor(
          context,
          ColorEnum.themeColorOpacity5Percentage,
        ),
      ),
      padding: EdgeInsets.all(
        Dimensions.incrementalViewContainerBorderWidth.w,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            String value = controller.text.toString();
            int updatedValue = 0;
            if (value.isNotEmpty) {
              updatedValue = int.parse(value) + increment;
            } else {
              if (increment > 0) {
                updatedValue = 1;
              }
            }
            if (updatedValue < 1) {
              updatedValue = 0;
            }
            onValueChanged(updatedValue);
          },
          splashColor: StaticFunctions.getColor(
            context,
            ColorEnum.touchSplashColor,
          ),
          borderRadius: BorderRadius.circular(
            Dimensions.incrementalViewContainerRadius.r,
          ),
          child: Center(
            child: SvgPicture.asset(assetPath),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        IgnorePointer(
          ignoring: ignoring,
          child: TextFieldWidget(
            label: label,
            hint: hint,
            keepLabelAlwaysOnTop: true,
            controller: controller,
            keyBoardType: TextInputType.number,
            maxLength: 3,
            inputFormatter: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            onValueChanged: (int? currentIndex, String value) {
              if (onValueChangedByTyping != null) {
                String value = controller.text.toString();
                onValueChangedByTyping!(value);
              }
            },
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _actionButton(context, Strings.iconFieldMinus, -1),
            SizedBox(
              width: Dimensions.incrementalViewActionButtonSpacing.w,
            ),
            _actionButton(context, Strings.iconFieldPlus, 1),
            SizedBox(
              width: Dimensions.incrementalViewActionButtonSpacing.w,
            ),
          ],
        )
      ],
    );
  }
}
