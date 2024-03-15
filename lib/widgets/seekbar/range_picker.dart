import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/dimen_const.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';

class RangePicker extends StatefulWidget {
  final double minValue;
  final double maxValue;
  final double defaultMinValue;
  final double defaultMaxValue;
  final int gap;
  bool isDefaultValue;
  final Function(RangeValues)? onRangeChange;

  RangePicker({
    Key? key,
    required this.minValue,
    required this.maxValue,
    required this.defaultMinValue,
    required this.defaultMaxValue,
    required this.gap,
    this.isDefaultValue = true,
    this.onRangeChange,
  }) : super(key: key);

  @override
  State<RangePicker> createState() => _RangePickerState();
}

class _RangePickerState extends State<RangePicker> {
  late AppLocalizations localizationsContext;
  late RangeValues _currentRangeValues;
  late String minSelectedPrice, maxSelectedPrice;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    localizationsContext = AppLocalizations.of(context)!;
    if (widget.isDefaultValue) {
      _currentRangeValues =
          RangeValues(widget.defaultMinValue, widget.defaultMaxValue);
      widget.isDefaultValue = false;
    }

    final startValue = _currentRangeValues.start.round();
    final endValue = _currentRangeValues.end.round();

    if (startValue >= 100) {
      minSelectedPrice =
          '\u{20B9} ${(startValue / 100).toStringAsFixed(1).toString().replaceAll('.0', '')} ${localizationsContext.crore}';
    } else {
      minSelectedPrice = '\u{20B9} $startValue ${localizationsContext.lakh}';
    }

    if (endValue >= 100) {
      maxSelectedPrice =
          '\u{20B9} ${(endValue / 100).toStringAsFixed(1).toString().replaceAll('.0', '')} ${localizationsContext.crore}';
    } else {
      maxSelectedPrice = '\u{20B9} $endValue ${localizationsContext.lakh}';
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: Dimensions.priceRangeSliderTrackHeight.h,
            activeTrackColor: StaticFunctions.getColor(
              context,
              ColorEnum.disableThemeColor,
            ),
            overlayShape: SliderComponentShape.noOverlay,
            inactiveTrackColor: StaticFunctions.getColor(
              context,
              ColorEnum.themeColorOpacity8Percentage,
            ),
            rangeThumbShape: RoundRangeSliderThumbShape(
              enabledThumbRadius: Dimensions.priceRangeSliderThumbRadius.r,
              elevation: 0,
              pressedElevation: 0,
            ),
            thumbColor: StaticFunctions.getColor(
              context,
              ColorEnum.themeColor,
            ),
          ),
          child: RangeSlider(
            values: _currentRangeValues,
            min: widget.minValue,
            max: widget.maxValue,
            divisions: ((widget.maxValue / widget.gap) - 1).toInt(),
            // steps = (maxValue / gap) - 1
            onChanged: (RangeValues values) {
              int diff = values.end.round() - values.start.round();
              if (diff >= widget.gap) {
                setState(() {
                  _currentRangeValues = values;
                  if (widget.onRangeChange != null) {
                    widget.onRangeChange!(values);
                  }
                });
              }
            },
          ),
        ),
        SizedBox(
          height: Dimensions
              .priceRangeSliderAndTextBetweenSpace
              .h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              minSelectedPrice,
              style: TextStyle(
                color: StaticFunctions.getColor(
                  context,
                  ColorEnum.blackColor,
                ),
                fontWeight: FontWeight.w400,
                fontSize: Dimensions.priceRangeMinMaxTextSize.sp,
              ),
            ),
            Text(
              maxSelectedPrice,
            ),
          ],
        ),
      ],
    );
  }
}
