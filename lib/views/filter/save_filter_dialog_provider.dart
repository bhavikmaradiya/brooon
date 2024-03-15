import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common_property_data_provider.dart';
import '../../const/string_const.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/properties/db_saved_filter.dart';
import '../../utils/app_config.dart';
import '../../utils/contacts_helper.dart';
import '../../utils/static_functions.dart';
import '../../widgets/snack_bar_view.dart';
import '../buyers_sellers/model/buyer_seller_info.dart';

class SaveFilterDialogProvider extends ChangeNotifier {
  AppLocalizations? localizationsContext;
  final _isarService = IsarService();
  final TextEditingController filterNameFieldController =
      TextEditingController();
  final TextEditingController customerNameFieldController =
      TextEditingController();
  final TextEditingController mobileNoFieldController = TextEditingController();
  bool isValid = false;
  bool isEdit = false;
  bool isNameTaken = false;
  late DbSavedFilter filterToEdit;
  List<BuyerSellerInfo> _savedBuyersList = [];

  init(
    BuildContext context,
    DbSavedFilter filterToEdit, {
    bool isEdit = false,
  }) async {
    localizationsContext = AppLocalizations.of(context)!;
    this.filterToEdit = filterToEdit;
    this.isEdit = isEdit;
    _savedBuyersList =
        await CommonPropertyDataProvider.getAllBuyersWithInquiries();
    if (!filterToEdit.isFromBuyer) {
      if (filterToEdit.filterName.trim().isNotEmpty) {
        filterNameFieldController.text = filterToEdit.filterName;
        StaticFunctions.fieldCursorPositionAtLast(filterNameFieldController);
      } else {
        final currentDate = DateTime.now();
        String name = '';
        if (filterToEdit.propertyFor != null &&
            filterToEdit.propertyFor!.isNotEmpty) {
          name = '';
          await Future.forEach(
            filterToEdit.propertyFor!,
            (element) async {
              final propertyFor =
                  await _isarService.getPropertyForById(element);
              if (propertyFor != null) {
                if (name.trim().isNotEmpty &&
                    propertyFor.name.trim().isNotEmpty) {
                  name += '-';
                }
                if (propertyFor.name.trim().isNotEmpty) {
                  name += propertyFor.name;
                }
              }
            },
          );
        }
        name += (currentDate.millisecondsSinceEpoch ~/ 1000).toString();
        filterNameFieldController.text = name;
        StaticFunctions.fieldCursorPositionAtLast(filterNameFieldController);
      }
    } else {
      if (filterToEdit.buyerName.trim().isNotEmpty) {
        customerNameFieldController.text = filterToEdit.buyerName;
        StaticFunctions.fieldCursorPositionAtLast(customerNameFieldController);
      }
      if (filterToEdit.mobileNo.trim().isNotEmpty) {
        mobileNoFieldController.text = filterToEdit.mobileNo;
      }
    }
    validateData();
    notifyListeners();
  }

  Iterable<BuyerSellerInfo> getFilteredBuyers(String query) {
    Iterable<BuyerSellerInfo> filteredData = [];
    if (_savedBuyersList.isNotEmpty &&
        customerNameFieldController.text.trim().isNotEmpty) {
      filteredData = _savedBuyersList.where((element) =>
          (element.name != null &&
              element.name!.toLowerCase().contains(query.toLowerCase())) ||
          (element.phone != null && element.phone!.startsWith(query.trim())));
    }
    return filteredData;
  }

  void selectBuyerSuggestion(BuildContext context, BuyerSellerInfo selected) {
    customerNameFieldController.text = selected.name ?? '';
    mobileNoFieldController.text = selected.phone ?? '';
    FocusScope.of(context).requestFocus(FocusNode());
    validateData();
  }

  saveFilter(BuildContext context) async {
    if (isValid) {
      filterToEdit.filterName = filterNameFieldController.text.toCapitalized();
      filterToEdit.buyerName = customerNameFieldController.text.toTitleCase();
      filterToEdit.mobileNo = mobileNoFieldController.text;
      final filterFromDb = await _isarService.checkIfFilterExists(
        filterName: filterToEdit.filterName,
      );
      if (filterToEdit.isFromBuyer ||
          filterFromDb == null ||
          (isEdit && filterFromDb.id == filterToEdit.id)) {
        isNameTaken = false;
        notifyListeners();
        filterToEdit.updatedAt = DateTime.now();
        if (!isEdit) {
          filterToEdit.addedAt = filterToEdit.updatedAt;
          filterToEdit.userId = StaticFunctions.userId;
        }
        _isarService.saveFilter(filterToEdit).then(
          (value) {
            SnackBarView.showSnackBar(
              context,
              localizationsContext!.filterSavedMessage,
            );
            Navigator.of(context).pop();
          },
        );
      } else {
        isNameTaken = true;
        notifyListeners();
      }
    }
  }

  validateData() {
    isValid = ((!filterToEdit.isFromBuyer &&
            filterNameFieldController.text.trim().isNotEmpty) ||
        (filterToEdit.isFromBuyer &&
            customerNameFieldController.text.trim().isNotEmpty &&
            (mobileNoFieldController.text.trim().isEmpty ||
                mobileNoFieldController.text.length ==
                    AppConfig.mobileNoFieldLength)));
    notifyListeners();
  }

  openContactsToPickPhone() async {
    final contactInfo = await ContactHelper.chooseFromContacts();
    if (contactInfo != null) {
      if (contactInfo.name.trim().isNotEmpty) {
        customerNameFieldController.text = contactInfo.name.toString().trim();
        StaticFunctions.fieldCursorPositionAtLast(customerNameFieldController);
      }
      if (contactInfo.phoneNo.trim().isNotEmpty) {
        mobileNoFieldController.text = contactInfo.phoneNo.toString().trim();
        StaticFunctions.fieldCursorPositionAtLast(mobileNoFieldController);
      }
      validateData();
    }
  }
}
