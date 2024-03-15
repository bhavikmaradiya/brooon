import 'package:flutter/material.dart';

import '../../network/dio_client.dart';
import '../../utils/full_screen_progress.dart';
import '../../utils/static_functions.dart';
import '../../widgets/snack_bar_view.dart';

class AppFeedbackProvider extends ChangeNotifier {
  final TextEditingController descriptionFieldController =
      TextEditingController();
  bool isValid = false;

  validateData() {
    isValid = descriptionFieldController.text.trim().isNotEmpty;
    notifyListeners();
  }

  onSubmitFeedback(
    BuildContext context,
    String successMessage,
    String failureMessage,
  ) async {
    StaticFunctions.unFocusKeyboardIfAny(context);
    FullScreenProgress.showFullScreenProgress(context, true);
    final feedbackMessage = descriptionFieldController.text.toString().trim();
    final response = await DioClient().submitFeedback(feedbackMessage);
    FullScreenProgress.showFullScreenProgress(context, false);
    if (response != null) {
      SnackBarView.showSnackBar(context, successMessage);
      Navigator.pop(context);
    } else {
      SnackBarView.showSnackBar(context, failureMessage);
    }
  }
}
