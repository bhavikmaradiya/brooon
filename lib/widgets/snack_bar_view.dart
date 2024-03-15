import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/dimen_const.dart';
import '../main.dart';
import '../utils/app_config.dart';
import '../utils/enums.dart';
import '../utils/static_functions.dart';

class SnackBarView {
  static showSnackBar(
    BuildContext context,
    String message, {
    String? action,
    Function()? onActionClicked,
    bool keepSnackBar = false,
    int? durationInSec,
  }) {
    ScaffoldMessenger.of(navigatorKey.currentContext ?? context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: StaticFunctions.getColor(
              context,
              ColorEnum.whiteColor,
            ),
            fontWeight: FontWeight.w400,
            fontSize: Dimensions.snackBarTextSize.sp,
          ),
        ),
        backgroundColor: StaticFunctions.getColor(
          context,
          ColorEnum.blueColor,
        ),
        action: action != null && onActionClicked != null
            ? SnackBarAction(
                label: action,
                onPressed: () {
                  ScaffoldMessenger.of(navigatorKey.currentContext ?? context)
                      .hideCurrentSnackBar();
                  onActionClicked();
                },
              )
            : null,
        duration: keepSnackBar
            ? const Duration(days: 365)
            : Duration(
                seconds: durationInSec ??= AppConfig.snackBarDuration,
              ),
      ),
    );
  }
}
