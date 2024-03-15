import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/dimen_const.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';

class Countdown extends AnimatedWidget {
  final Animation<int> animation;

  Countdown({required this.animation}) : super(listenable: animation);

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString().padLeft(2, '0')}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';
    return Text(
      animation.status != AnimationStatus.forward ? "00:00" : timerText,
      style: TextStyle(
        color: StaticFunctions.getColor(
          context,
          ColorEnum.blueColor,
        ),
        fontWeight: FontWeight.w600,
        fontSize: Dimensions.countdownTextSize.sp,
      ),
    );
  }
}
