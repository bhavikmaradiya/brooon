import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import './model/matching_model.dart';
import '../../common_property_data_provider.dart';
import '../../const/routes.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/properties/db_property.dart';
import '../../localdb/properties/db_saved_filter.dart';
import '../../localdb/save_default_data.dart';
import '../../utils/app_config.dart';
import '../../utils/contacts_helper.dart';
import '../../utils/static_functions.dart';
import '../add_property/model/options.dart';
import '../buyers_sellers/model/buyer_seller_info.dart';

class CloseDealDialogProvider extends ChangeNotifier {
  AppLocalizations? _localizationsContext;
  final nameFieldController = TextEditingController();
  final phoneFieldController = TextEditingController();
  final noteFieldController = TextEditingController();
  bool _validBuyerDetail = false;
  bool _isSoldProperty = false;
  int selectedDealOption = -1;
  List<Options> closeDealOptions = [];
  List<BuyerSellerInfo> _savedBuyerSellerList = [];
  bool mounted = true;
  late BuildContext buildContext;
  List<MatchingModel> filterMatchingList = [];
  bool _isInquiry = false;

  init(
    BuildContext context, {
    bool isInquiry = false,
    DbSavedFilter? inquiry,
    DbProperty? property,
  }) async {
    _isInquiry = isInquiry;
    buildContext = context;
    _localizationsContext ??= AppLocalizations.of(context)!;
    _savedBuyerSellerList = await (!isInquiry
        ? CommonPropertyDataProvider.getAllBuyersWithInquiries()
        : CommonPropertyDataProvider.getAllSellerWithProperties());
    closeDealOptions = [
      Options()
        ..id = SaveDefaultData.propertyForSellId
        ..name = !isInquiry
            ? _localizationsContext!.sold
            : _localizationsContext!.bought,
      Options()
        ..id = SaveDefaultData.propertyForRentId
        ..name = _localizationsContext!.rented,
      Options()
        ..id = SaveDefaultData.propertyForLeaseId
        ..name = _localizationsContext!.leased,
    ];
    if (mounted) {
      notifyListeners();
    }
    /*_generateMatchingList(
      inquiry: inquiry,
      property: property,
    );*/
  }

  selectDealOption(int selected) {
    selectedDealOption = selected;
    if (mounted) {
      notifyListeners();
    }
    validateCustomerData();
  }

  bool get isPropertySold => _isSoldProperty;

  bool get validBuyerDetails => _validBuyerDetail;

  validateCustomerData() {
    _validBuyerDetail = selectedDealOption != -1 &&
        nameFieldController.text.trim().isNotEmpty &&
        (phoneFieldController.text.trim().isEmpty
            ? true
            : phoneFieldController.text.length ==
                AppConfig.mobileNoFieldLength);
    if (mounted) {
      notifyListeners();
    }
  }

  openContactsToPickPhone() async {
    final contactInfo = await ContactHelper.chooseFromContacts();
    if (contactInfo != null) {
      if (contactInfo.name.trim().isNotEmpty) {
        nameFieldController.text = contactInfo.name.toString().trim();
        StaticFunctions.fieldCursorPositionAtLast(nameFieldController);
      }
      if (contactInfo.phoneNo.trim().isNotEmpty) {
        phoneFieldController.text = contactInfo.phoneNo.toString().trim();
        StaticFunctions.fieldCursorPositionAtLast(phoneFieldController);
      }
      validateCustomerData();
      checkForMatching();
    }
  }

  Iterable<BuyerSellerInfo> getFilteredBuyers(String query) {
    Iterable<BuyerSellerInfo> filteredData = [];
    if (_savedBuyerSellerList.isNotEmpty &&
        nameFieldController.text.trim().isNotEmpty) {
      filteredData = _savedBuyerSellerList.where((element) =>
          (element.name != null &&
              element.name!.toLowerCase().contains(query.toLowerCase())) ||
          (element.phone != null && element.phone!.startsWith(query.trim())));
    }
    return filteredData;
  }

  selectBuyerSuggestion(BuildContext context, BuyerSellerInfo selected) {
    nameFieldController.text = selected.name ?? '';
    phoneFieldController.text = selected.phone ?? '';
    FocusScope.of(context).requestFocus(FocusNode());
    validateCustomerData();
    checkForMatching();
  }

  /*_generateMatchingList({
    DbSavedFilter? inquiry,
    DbProperty? property,
  }) async {
    _matchingList.clear();
    filterMatchingList.clear();
    if (_isInquiry) {
      final matchingProperties =
          await CommonPropertyDataProvider.getMatchingPropertiesFromInquiry(
        inquiry: inquiry!,
      );
      if (matchingProperties != null &&
          matchingProperties is List<DbProperty> &&
          matchingProperties.isNotEmpty) {
        for (int index = 0; index < matchingProperties.length; index++) {
          final property = matchingProperties[index];
          final matchingModel = MatchingModel();
          matchingModel.id = index;
          matchingModel.areaSize =
              CommonPropertyDataProvider.propertyFormattedArea(
            property,
          );
          final prices = StaticFunctions.getPropertyFormattedPrice(
            localizationsContext: _localizationsContext!,
            property: property,
          );
          if (prices.containsKey(SaveDefaultData.propertyForSellId)) {
            matchingModel.sellPrice = prices[SaveDefaultData.propertyForSellId];
          }
          if (prices.containsKey(SaveDefaultData.propertyForRentId)) {
            matchingModel.rentPrice = prices[SaveDefaultData.propertyForRentId];
          }
          if (prices.containsKey(SaveDefaultData.propertyForLeaseId)) {
            matchingModel.leasePrice =
                prices[SaveDefaultData.propertyForLeaseId];
          }
          matchingModel.propertyInquiryId = property.propertyId ?? '';
          _matchingList.add(matchingModel);
        }
      }
    } else {
      final matchingInquiries =
          await CommonPropertyDataProvider.getMatchingInquiriesFromProperty(
        propertyInfo: property!,
      );
      if (matchingInquiries != null &&
          matchingInquiries is List<DbSavedFilter> &&
          matchingInquiries.isNotEmpty) {
        for (int index = 0; index < matchingInquiries.length; index++) {
          final inquiry = matchingInquiries[index];
          final matchingModel = MatchingModel();
          matchingModel.id = index;
          matchingModel.areaSize =
              CommonPropertyDataProvider.inquiryFormattedArea(
            _localizationsContext!,
            inquiry,
          );
          final prices = StaticFunctions.getInquiryFormattedPrice(
            localizationsContext: _localizationsContext!,
            inquiry: inquiry,
          );
          if (prices.containsKey(SaveDefaultData.propertyForSellId)) {
            matchingModel.sellPrice = prices[SaveDefaultData.propertyForSellId];
          }
          if (prices.containsKey(SaveDefaultData.propertyForRentId)) {
            matchingModel.rentPrice = prices[SaveDefaultData.propertyForRentId];
          }
          if (prices.containsKey(SaveDefaultData.propertyForLeaseId)) {
            matchingModel.leasePrice =
                prices[SaveDefaultData.propertyForLeaseId];
          }
          matchingModel.propertyInquiryId = inquiry.inquiryId ?? '';
          _matchingList.add(matchingModel);
        }
      }
    }
    filterMatchingList.addAll(_matchingList);
    if (mounted) {
      notifyListeners();
    }
  }*/

  checkForMatching() {
    if (_isInquiry) {
      _matchingSellers();
    } else {
      _matchingBuyers();
    }
  }

  _matchingSellers() {
    filterMatchingList.clear();
    final name = nameFieldController.text.toString().trim();
    final phone = phoneFieldController.text.toString().trim();
    _savedBuyerSellerList.forEach(
      (element) {
        bool isNameMatches = false;
        bool isPhoneMatches = true;
        if (element.name != null && name.trim().isNotEmpty) {
          isNameMatches = element.name!.trim().toLowerCase().contains(
                name.trim().toLowerCase(),
              );
        }
        if (element.phone != null && phone.trim().isNotEmpty) {
          isPhoneMatches = element.phone!.trim().startsWith(phone);
        }
        if (isNameMatches && isPhoneMatches) {
          if (element.properties != null && element.properties!.isNotEmpty) {
            for (int index = 0; index < element.properties!.length; index++) {
              final property = element.properties![index];
              if (property.propertySoldStatusId !=
                  SaveDefaultData.soldStatusId) {
                final matchingModel = MatchingModel();
                matchingModel.id = index;
                matchingModel.areaSize =
                    CommonPropertyDataProvider.propertyFormattedArea(
                  property,
                );
                final prices = StaticFunctions.getPropertyFormattedPrice(
                  localizationsContext: _localizationsContext!,
                  property: property,
                );
                if (prices.containsKey(SaveDefaultData.propertyForSellId)) {
                  matchingModel.sellPrice =
                      prices[SaveDefaultData.propertyForSellId];
                }
                if (prices.containsKey(SaveDefaultData.propertyForRentId)) {
                  matchingModel.rentPrice =
                      prices[SaveDefaultData.propertyForRentId];
                }
                if (prices.containsKey(SaveDefaultData.propertyForLeaseId)) {
                  matchingModel.leasePrice =
                      prices[SaveDefaultData.propertyForLeaseId];
                }
                matchingModel.propertyInquiryId = property.propertyId ?? '';
                filterMatchingList.add(matchingModel);
              }
            }
          }
        }
      },
    );
    if (mounted) {
      notifyListeners();
    }
  }

  _matchingBuyers() {
    filterMatchingList.clear();
    final name = nameFieldController.text.toString().trim();
    final phone = phoneFieldController.text.toString().trim();
    _savedBuyerSellerList.forEach(
      (element) {
        bool isNameMatches = false;
        bool isPhoneMatches = true;
        if (element.name != null && name.trim().isNotEmpty) {
          isNameMatches = element.name!.trim().toLowerCase().contains(
                name.trim().toLowerCase(),
              );
        }
        if (element.phone != null && phone.trim().isNotEmpty) {
          isPhoneMatches = element.phone!.trim().startsWith(phone);
        }
        if (isNameMatches && isPhoneMatches) {
          if (element.inquiries != null && element.inquiries!.isNotEmpty) {
            for (int index = 0; index < element.inquiries!.length; index++) {
              final inquiry = element.inquiries![index];
              if (inquiry.inquirySoldStatusId != SaveDefaultData.soldStatusId) {
                final matchingModel = MatchingModel();
                matchingModel.id = index;
                matchingModel.areaSize =
                    CommonPropertyDataProvider.inquiryFormattedArea(
                  _localizationsContext!,
                  inquiry,
                );
                final prices = StaticFunctions.getInquiryFormattedPrice(
                  localizationsContext: _localizationsContext!,
                  inquiry: inquiry,
                );
                if (prices.containsKey(SaveDefaultData.propertyForSellId)) {
                  matchingModel.sellPrice =
                      prices[SaveDefaultData.propertyForSellId];
                }
                if (prices.containsKey(SaveDefaultData.propertyForRentId)) {
                  matchingModel.rentPrice =
                      prices[SaveDefaultData.propertyForRentId];
                }
                if (prices.containsKey(SaveDefaultData.propertyForLeaseId)) {
                  matchingModel.leasePrice =
                      prices[SaveDefaultData.propertyForLeaseId];
                }
                matchingModel.propertyInquiryId = inquiry.inquiryId ?? '';
                filterMatchingList.add(matchingModel);
              }
            }
          }
        }
      },
    );
    if (mounted) {
      notifyListeners();
    }
  }

  String retrieveMatchingItemText(MatchingModel data) {
    String strBuilder = '';
    if (data.areaSize != null && data.areaSize!.trim().isNotEmpty) {
      strBuilder = '${data.areaSize}';
      if (data.sellPrice != null && data.sellPrice!.trim().isNotEmpty) {
        strBuilder += ' / ${_localizationsContext!.sell}: ${data.sellPrice}';
      } else if (data.rentPrice != null && data.rentPrice!.trim().isNotEmpty) {
        strBuilder += ' / ${_localizationsContext!.rent}: ${data.rentPrice}';
      } else if (data.leasePrice != null &&
          data.leasePrice!.trim().isNotEmpty) {
        strBuilder += ' / ${_localizationsContext!.lease}: ${data.leasePrice}';
      }
    } else {
      if (data.sellPrice != null && data.sellPrice!.trim().isNotEmpty) {
        strBuilder = '${_localizationsContext!.sell}: ${data.sellPrice}';
      } else if (data.rentPrice != null && data.rentPrice!.trim().isNotEmpty) {
        strBuilder = '${_localizationsContext!.rent}: ${data.rentPrice}';
      } else if (data.leasePrice != null &&
          data.leasePrice!.trim().isNotEmpty) {
        strBuilder = '${_localizationsContext!.lease}: ${data.leasePrice}';
      }
      if (strBuilder.trim().isEmpty) {
        strBuilder = '${data.propertyInquiryId}';
      }
    }
    return strBuilder;
  }

  updateMatchingItem(int id) {
    for (int j = 0; j < filterMatchingList.length; j++) {
      if (filterMatchingList[j].id == id) {
        filterMatchingList[j].isSelected = !filterMatchingList[j].isSelected;
      } else {
        filterMatchingList[j].isSelected = false;
      }
    }
    if (mounted) {
      notifyListeners();
    }
  }

  onMatchingItemDetailClicked(String? propertyInquiryId) async {
    if (_isInquiry) {
      // Open matching property details - Read only mode
      final selectedProperty = await IsarService().getPropertyByPropertyId(
        propertyInquiryId!,
      );
      if (selectedProperty != null) {
        selectedProperty.isReadOnly = true;
        Navigator.pushNamed(
          buildContext,
          Routes.propertyDetail,
          arguments: selectedProperty,
        );
      }
    } else {
      // Open matching inquiry details - Read only mode
      final selectedInquiry = await IsarService().getInquiryByInquiryId(
        propertyInquiryId!,
      );
      if (selectedInquiry != null) {
        selectedInquiry.isReadOnly = true;
        Navigator.pushNamed(
          buildContext,
          Routes.inquiryDetail,
          arguments: selectedInquiry,
        );
      }
    }
  }
}
