import 'package:flutter/material.dart';

import './enums.dart';
import './static_functions.dart';
import '../widgets/circular_indicator.dart';

class FullScreenProgress {
  static bool _isDialogShowing = false;

  static showFullScreenProgress(BuildContext context, bool isLoading) {
    if (isLoading && !_isDialogShowing) {
      _isDialogShowing = true;
      showGeneralDialog(
        context: context,
        barrierColor: StaticFunctions.getColor(
          context,
          ColorEnum.transparent,
        ),
        barrierDismissible: false,
        pageBuilder: (_, __, ___) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Center(
              child: CircularIndicator(),
            ),
          );
        },
      );
    } else {
      if (_isDialogShowing) {
        _isDialogShowing = false;
        Navigator.pop(context);
      }
    }
  }
}
