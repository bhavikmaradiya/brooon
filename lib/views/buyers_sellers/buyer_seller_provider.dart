import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import './model/buyer_seller_enum.dart';
import './model/buyer_seller_info.dart';
import '../../common_property_data_provider.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/matching_query.dart';
import '../../utils/static_functions.dart';
import '../view_all_property/model/view_all_screen_arg.dart';

class BuyerSellerProvider extends ChangeNotifier {
  final _isarService = IsarService();
  List<BuyerSellerInfo> buyerSellerInfoList = [];
  List<BuyerSellerInfo> filteredBuyerSellerInfoList = [];
  BuyerSellerType _currentType = BuyerSellerType.buyers;
  StreamSubscription? propertyChangeStream;
  StreamSubscription? inquiryChangeStream;
  String _searchBy = '';
  late AppLocalizations localizationsContext;

  init(AppLocalizations localizationsContext, BuyerSellerType type) async {
    this.localizationsContext = localizationsContext;
    _currentType = type;
    _getBuyerSellerList();
    _listenPropertyAndInquiryChanges();
  }

  searchBy(String value) {
    _searchBy = value.trim();
    filteredBuyerSellerInfoList.clear();
    if (value.toString().trim().isNotEmpty) {
      final matchedBuyerSeller = buyerSellerInfoList.where((element) =>
          element.name!.toLowerCase().contains(value.toLowerCase()) ||
          (element.phone != null && element.phone!.startsWith(value)));
      filteredBuyerSellerInfoList.addAll(matchedBuyerSeller);
    } else {
      filteredBuyerSellerInfoList.addAll(buyerSellerInfoList);
    }
    notifyListeners();
  }

  _listenPropertyAndInquiryChanges() async {
    final onPropertyChanges = await _isarService.watchOnPropertySave();
    final onInquiryChanges = await _isarService.watchOnFilterChanges();
    propertyChangeStream = onPropertyChanges.listen(
      (event) async {
        await _getBuyerSellerList();
        if (_searchBy.trim().isNotEmpty) {
          searchBy(_searchBy);
        }
      },
    );
    inquiryChangeStream = onInquiryChanges.listen(
      (event) async {
        await _getBuyerSellerList();
        if (_searchBy.trim().isNotEmpty) {
          searchBy(_searchBy);
        }
      },
    );
  }

  openDialerToMakeACall(String phoneNumber) {
    StaticFunctions.openDialer(phoneNumber);
  }

  _getBuyerSellerList() async {
    if (_currentType == BuyerSellerType.buyers) {
      buyerSellerInfoList = await CommonPropertyDataProvider
          .getAllBuyersWithInquiriesAndMatchingProperties();
    } else if (_currentType == BuyerSellerType.sellers) {
      buyerSellerInfoList = await CommonPropertyDataProvider
          .getAllSellerWithPropertiesAndMatchingInquiries();
    }
    filteredBuyerSellerInfoList.clear();
    filteredBuyerSellerInfoList.addAll(buyerSellerInfoList);
    notifyListeners();

    if (_currentType == BuyerSellerType.sellers) {
      final data = await MatchingQuery.getMatchingBrooonInquiries(
        localizationsContext,
        filteredBuyerSellerInfoList,
      );
      if (data != null) {
        filteredBuyerSellerInfoList = data;
        notifyListeners();
      }
    } else if (_currentType == BuyerSellerType.buyers) {
      final data = await MatchingQuery.getMatchingBrooonProperties(
        localizationsContext,
        filteredBuyerSellerInfoList,
      );
      if (data != null) {
        filteredBuyerSellerInfoList = data;
        notifyListeners();
      }
    }
  }

  String getPropertiesInquiriesHeading({
    required AppLocalizations localizationsContext,
    required String name,
    required BuyerSellerType type,
    required BuyerSellerViewType viewType,
  }) {
    if (type == BuyerSellerType.buyers) {
      if (viewType == BuyerSellerViewType.properties) {
        return localizationsContext.viewAllBuyerMatchingProperties(name);
      } else if (viewType == BuyerSellerViewType.inquiries) {
        return localizationsContext.viewAllBuyerInquiries(name);
      }
    } else if (type == BuyerSellerType.sellers) {
      if (viewType == BuyerSellerViewType.properties) {
        return localizationsContext.viewAllSellerProperties(name);
      } else if (viewType == BuyerSellerViewType.inquiries) {
        return localizationsContext.viewAllSellerMatchingInquiries(name);
      }
    }
    return localizationsContext.unknownText;
  }

  ViewAllTabsVisibilityType? getPropertiesInquiriesVisibilityType({
    required BuyerSellerType type,
    required BuyerSellerViewType viewType,
  }) {
    if (type == BuyerSellerType.buyers) {
      if (viewType == BuyerSellerViewType.properties) {
        return ViewAllTabsVisibilityType.fromBuyersMatchingProperties;
      } else if (viewType == BuyerSellerViewType.inquiries) {
        return ViewAllTabsVisibilityType.fromBuyersInquiries;
      }
    } else if (type == BuyerSellerType.sellers) {
      if (viewType == BuyerSellerViewType.properties) {
        return ViewAllTabsVisibilityType.fromSellersProperties;
      } else if (viewType == BuyerSellerViewType.inquiries) {
        return ViewAllTabsVisibilityType.fromSellersMatchingInquiries;
      }
    }
    return null;
  }

  onDispose() {}
}
