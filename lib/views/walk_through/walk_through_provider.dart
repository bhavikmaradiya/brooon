import 'package:flutter/material.dart';
import '../../utils/app_config.dart';

class WalkThroughProvider with ChangeNotifier {
  final controller = PageController();

  int currentPage = 0;


  set setCurrentPage(int index) {
    if (currentPage != index) {
      currentPage = index;
      notifyListeners();
    }
  }

  bool nextPageClick() {
    if (currentPage < (AppConfig.walkThroughScreensLength - 1)) {
      controller.nextPage(
        duration: const Duration(milliseconds: 1),
        curve: Curves.bounceIn,
      );
      return true;
    }
    return false;
  }
}
