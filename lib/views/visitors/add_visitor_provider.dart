import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../const/string_const.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/properties/db_property.dart';
import '../../localdb/properties/db_property_visitors.dart';
import '../../utils/app_config.dart';
import '../../utils/contacts_helper.dart';
import '../../utils/static_functions.dart';

class AddVisitorProvider extends ChangeNotifier {
  final _isarService = IsarService();
  final visitorNameFieldController = TextEditingController();
  final visitorPhoneFieldController = TextEditingController();
  bool _validVisitorDetail = false;
  List<DbPropertyVisitors> _savedVisitorList = [];

  bool get validVisitorDetails => _validVisitorDetail;

  init() async {
    await _isarService.getVisitors(excludeEmptyBuyerName: true).then(
      (value) {
        _savedVisitorList.clear();
        value.forEach(
          (element) {
            final doesExist = _savedVisitorList.firstWhereOrNull((e) =>
                    e.name == element.name && e.mobileNo == element.mobileNo) !=
                null;
            if (!doesExist) {
              _savedVisitorList.add(element);
            }
          },
        );
      },
    );
    validateVisitorData();
  }

  Iterable<DbPropertyVisitors> getFilteredVisitors(String query) {
    Iterable<DbPropertyVisitors> filteredData = [];
    if (_savedVisitorList.isNotEmpty &&
        visitorNameFieldController.text.trim().isNotEmpty) {
      filteredData = _savedVisitorList.where((element) =>
          (element.name != null &&
              element.name!.toLowerCase().contains(query.toLowerCase())) ||
          (element.mobileNo != null &&
              element.mobileNo!.startsWith(query.trim())));
    }
    return filteredData;
  }

  void selectVisitorSuggestion(
      BuildContext context, DbPropertyVisitors selected) {
    visitorNameFieldController.text = selected.name ?? '';
    visitorPhoneFieldController.text = selected.mobileNo ?? '';
    FocusScope.of(context).requestFocus(FocusNode());
    validateVisitorData();
  }

  Future<int> addVisitor(DbProperty? property) async {
    if (property?.propertyId != null) {
      await _isarService.savePropertyVisitors(
        DbPropertyVisitors()
          ..propertyId = property!.propertyId
          ..name =
              visitorNameFieldController.text.trim().toLowerCase().toTitleCase()
          ..mobileNo = visitorPhoneFieldController.text.trim()
          ..userId = StaticFunctions.userId
          ..addedAt = DateTime.now(),
      );
      final data = await _isarService.getPropertyById(property.id);
      if (data != null) {
        final count = await getVisitorsCount(property);
        _isarService.saveProperty(property..visitorCount = count);
        return count;
      }
    }
    return property?.visitorCount ?? 0;
  }

  Future<int> getVisitorsCount(DbProperty? property) async {
    if (property?.propertyId != null) {
      return await _isarService.getVisitorsCount(property!.propertyId!);
    }
    return 0;
  }

  validateVisitorData() {
    _validVisitorDetail = (visitorPhoneFieldController.text.trim().isEmpty ||
        visitorPhoneFieldController.text.length ==
            AppConfig.mobileNoFieldLength);
    notifyListeners();
  }

  openContactsToPickPhone() async {
    final contactInfo = await ContactHelper.chooseFromContacts();
    if (contactInfo != null) {
      if (contactInfo.name.trim().isNotEmpty) {
        visitorNameFieldController.text = contactInfo.name.toString().trim();
        StaticFunctions.fieldCursorPositionAtLast(visitorNameFieldController);
      }
      if (contactInfo.phoneNo.trim().isNotEmpty) {
        visitorPhoneFieldController.text =
            contactInfo.phoneNo.toString().trim();
        StaticFunctions.fieldCursorPositionAtLast(visitorPhoneFieldController);
      }
      validateVisitorData();
    }
  }
}
