import 'package:flutter/material.dart';

import '../../localdb/isar_service.dart';
import '../../localdb/properties/db_property_amenity.dart';
import '../../utils/static_functions.dart';

class AmenitiesManagementProvider extends ChangeNotifier {
  String searchValue = '';
  List<DbPropertyAmenity> listToDisplay = [];
  List<DbPropertyAmenity> amenityList = [];
  final isarService = IsarService();

  init(BuildContext context) async {
    amenityList = await isarService.getAmenities();
    listToDisplay = amenityList;
    searchValue = "";
    notifyListeners();
  }

  saveAmenity(DbPropertyAmenity amenity) async {
    amenity.userId = StaticFunctions.userId;
    await isarService.savePropertyAmenity(amenity);
    amenityList = await isarService.getAmenities();
    searchQuery();
    notifyListeners();
  }

  deleteAmenity(int id) async {
    await isarService.deletePropertyAmenity(id);
    amenityList = await isarService.getAmenities();
    searchQuery();
    notifyListeners();
  }

  onSearch(String value) {
    searchValue = value;
    searchQuery();
  }

  searchQuery() {
    if (searchValue.trim().isNotEmpty) {
      listToDisplay = amenityList
          .where((element) =>
              element.name.toLowerCase().contains(searchValue.toLowerCase()))
          .toList();
    } else {
      listToDisplay = amenityList;
    }
    notifyListeners();
  }
}
