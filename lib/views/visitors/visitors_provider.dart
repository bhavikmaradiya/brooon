import 'package:flutter/material.dart';

import '../../localdb/isar_service.dart';
import '../../localdb/properties/db_property_visitors.dart';
import '../../utils/static_functions.dart';

class VisitorsProvider extends ChangeNotifier {
  final _isarService = IsarService();
  final List<DbPropertyVisitors> _propertyVisitors = [];
  final List<DbPropertyVisitors> _filterPropertyVisitors = [];

  List<DbPropertyVisitors> get propertyVisitors => _filterPropertyVisitors;

  init(String propertyId) async {
    _propertyVisitors.addAll(await _isarService.getVisitors(propertyId: propertyId));
    _filterPropertyVisitors.addAll(_propertyVisitors);
    notifyListeners();
  }

  notifyVisitorChange(String propertyId) async {
    _propertyVisitors.clear();
    _filterPropertyVisitors.clear();
    _propertyVisitors.addAll(await _isarService.getVisitors(propertyId: propertyId));
    _filterPropertyVisitors.addAll(_propertyVisitors);
  }

  searchBy(String value) {
    _filterPropertyVisitors.clear();
    if (value.toString().trim().isNotEmpty) {
      _filterPropertyVisitors.addAll(
        _propertyVisitors.where((element) => ((element.name != null &&
                element.name!
                    .toLowerCase()
                    .contains(value.trim().toLowerCase())) ||
            (element.mobileNo != null &&
                element.mobileNo!
                    .toLowerCase()
                    .contains(value.trim().toLowerCase())))),
      );
    } else {
      _filterPropertyVisitors.addAll(_propertyVisitors);
    }
    notifyListeners();
  }

  openDialerToMakeACall(String phoneNumber) {
    StaticFunctions.openDialer(phoneNumber);
  }
}
