import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../const/string_const.dart';

class CustomCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color checkedIconColor;
  final Color checkedFillColor;
  final String checkedIcon;
  final Color uncheckedIconColor;
  final Color uncheckedFillColor;
  final String uncheckedIcon;
  final double? borderWidth;
  final double checkBoxSize;
  final bool shouldShowBorder;
  final Color? borderColor;
  final double borderRadius;
  final double? splashRadius;
  final Color? splashColor;
  final String? tooltip;
  final MouseCursor? mouseCursors;
  final double iconSize;
  final double innerPadding;

  const CustomCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
    this.checkedIconColor = Colors.white,
    this.checkedFillColor = Colors.blue,
    this.iconSize = 12,
    this.checkedIcon = Strings.iconCheckboxChecked,
    this.uncheckedIconColor = Colors.white,
    this.uncheckedFillColor = Colors.white,
    this.uncheckedIcon = '',
    this.borderWidth,
    this.checkBoxSize = 24,
    this.shouldShowBorder = false,
    this.borderColor,
    required this.borderRadius,
    this.splashRadius,
    this.splashColor,
    this.tooltip,
    this.mouseCursors,
    required this.innerPadding,
  }) : super(key: key);

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool _checked;
  late CheckStatus _status;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(CustomCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    _init();
  }

  void _init() {
    _checked = widget.value;
    if (_checked) {
      _status = CheckStatus.checked;
    } else {
      _status = CheckStatus.unchecked;
    }
  }

  Widget _buildIcon() {
    late Color fillColor;
    late Color iconColor;
    late String iconData;

    switch (_status) {
      case CheckStatus.checked:
        fillColor = widget.checkedFillColor;
        iconColor = widget.checkedIconColor;
        iconData = widget.checkedIcon;
        break;
      case CheckStatus.unchecked:
        fillColor = widget.uncheckedFillColor;
        iconColor = widget.uncheckedIconColor;
        iconData = widget.uncheckedIcon;
        break;
    }
    return Container(
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            widget.borderRadius,
          ),
        ),
        border: Border.all(
          color: widget.shouldShowBorder
              ? (widget.borderColor ?? Colors.teal.withOpacity(0.6))
              : (!widget.value
                  ? (widget.borderColor ?? Colors.teal.withOpacity(0.6))
                  : Colors.transparent),
          width: widget.shouldShowBorder ? widget.borderWidth ?? 2.0 : 1.0,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => widget.onChanged(!_checked),
          borderRadius: BorderRadius.all(
            Radius.circular(
              widget.borderRadius,
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(
              widget.innerPadding,
            ),
            height: widget.checkBoxSize,
            width: widget.checkBoxSize,
            child: iconData.isNotEmpty
                ? SvgPicture.asset(
                    iconData,
                    color: iconColor,
                    width: widget.iconSize,
                    height: widget.iconSize,
                  )
                : SizedBox(
                    height: widget.iconSize,
                    width: widget.iconSize,
                  ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildIcon();
  }
}

enum CheckStatus {
  checked,
  unchecked,
}
