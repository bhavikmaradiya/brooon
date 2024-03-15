import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/dimen_const.dart';
import '../utils/enums.dart';
import '../utils/static_functions.dart';

class CircularIndicator extends StatelessWidget {
  final double? progressStrokeWidth;
  final bool isLoading;

  const CircularIndicator({
    Key? key,
    this.progressStrokeWidth,
    this.isLoading = true,
  }) : super(key: key);

  Widget _circularWidget(BuildContext context) {
    return CircularProgressIndicator(
      color: StaticFunctions.getColor(
        context,
        ColorEnum.themeColor,
      ),
      strokeWidth:
          progressStrokeWidth ?? Dimensions.circularProgressStrokeWidth.w,
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? AbsorbPointer(
            child: _circularWidget(context),
          )
        : const SizedBox();
  }
}
