import 'package:flutter/material.dart';

import '../../localdb/isar_service.dart';
import '../../localdb/properties/db_property_preferred_cast.dart';
import '../../utils/static_functions.dart';

class CastManagementProvider extends ChangeNotifier {
  String searchValue = '';
  List<DbPropertyPreferredCast> listToDisplay = [];
  List<DbPropertyPreferredCast> castList = [];
  final isarService = IsarService();

  Future<void> init(BuildContext context) async {
    castList = await isarService.getPreferredCasts();
    listToDisplay = castList;
    searchValue = "";
    notifyListeners();
  }

  Future<void> saveCast(DbPropertyPreferredCast cast) async {
    cast.userId = StaticFunctions.userId;
    await isarService.savePreferredCast(cast);
    castList = await isarService.getPreferredCasts();
    searchQuery();
    notifyListeners();
  }

  Future<void> deleteCast(int id) async {
    await isarService.deletePreferredCast(id);
    castList = await isarService.getPreferredCasts();
    searchQuery();
    notifyListeners();
  }

  void onSearch(String value) {
    searchValue = value;
    searchQuery();
  }

  void searchQuery() {
    if (searchValue.trim().isNotEmpty) {
      listToDisplay = castList
          .where((element) =>
              element.name.toLowerCase().contains(searchValue.toLowerCase()))
          .toList();
    } else {
      listToDisplay = castList;
    }
    notifyListeners();
  }
}
