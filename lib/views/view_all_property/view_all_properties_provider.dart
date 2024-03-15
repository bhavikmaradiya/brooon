import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import './model/property_visual_type.dart';
import './model/view_all_screen_arg.dart';
import './model/view_all_tab.dart';
import '../../common_property_data_provider.dart';
import '../../const/routes.dart';
import '../../const/string_const.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/matching_query.dart';
import '../../localdb/properties/db_property.dart';
import '../../localdb/properties/db_saved_filter.dart';
import '../../localdb/save_default_data.dart';
import '../../localdb/user_info/db_user_info.dart';
import '../../utils/app_config.dart';
import '../../utils/choose_plan_from_enum.dart';
import '../../utils/static_functions.dart';
import '../../widgets/property_helpers/location_filter_helper.dart';
import '../add_buyer/model/add_buyer_args.dart';
import '../add_property/model/add_property_args.dart';
import '../buyers_sellers/model/buyer_seller_enum.dart';
import '../buyers_sellers/model/buyer_seller_info.dart';

class ViewAllPropertiesProvider extends ChangeNotifier {
  final _isarService = IsarService();
  static const _unknownTabId = -1;
  CommonPropertyDataProvider? _commonPropertyDataProvider;
  final List<DbProperty> _myPropertyList = [];
  final List<DbSavedFilter> _myInquiriesList = [];
  final List<DbProperty> _propertyFromNetworkList = [];
  final List<DbSavedFilter> _inquiryFromNetworkList = [];
  final List<DbProperty> _filterMyPropertyList = [];
  final List<DbSavedFilter> _filterMyInquiriesList = [];
  final List<DbProperty> _filterPropertyFromNetworkList = [];
  final List<DbSavedFilter> _filterInquiryFromNetworkList = [];
  DbUserInfo? userInfo;
  late List<DbProperty> _propertyMapList;
  late AppLocalizations localizationsContext;
  late ViewAllFromType showDataFor;
  ViewAllTabsVisibilityType? tabVisibilityType;
  DbProperty? _selectedMapProperty;
  DbSavedFilter? filterObj;
  BuyerSellerInfo? buyerSellerInfo;
  DbProperty? propertyToMatch;
  DbSavedFilter? inquiryToMatch;
  int _selectedTabId = _unknownTabId;
  int _myPropertiesCount = 0;
  int _myInquiriesCount = 0;
  int? _propertyTypeId;
  int _propertiesFromNetworkCount = 0;
  int _inquiriesFromNetworkCount = 0;
  PropertyVisualType _propertyVisualType = PropertyVisualType.list;
  List<int?>? _propertyTypeIds = null;
  List<int?>? _inquiryTypeIds = null;
  bool doesFilterExists = false;
  StreamSubscription<void>? filterWatcher;
  String? _searchBy = '';
  StreamSubscription<void>? propertyStreamSubscription;
  StreamSubscription<void>? inquiryStreamSubscription;
  StreamSubscription<void>? blockedBrooonerStreamSubscription;
  StreamSubscription? _propertyInfoListener;
  StreamSubscription? _inquiryInfoListener;
  PageController tabPageController = PageController();
  PageController viewModeSwitcherController = PageController();
  MapboxMapController? mapController;
  Timer? debounceSearchProperties;
  Timer? debounceSearchInquiries;
  final searchFieldTextController = TextEditingController();
  bool mounted = true;
  bool _hasMorePropertyData = false;
  bool _hasMoreInquiryData = false;
  bool _isLoadingPropertyData = false;
  bool _isLoadingInquiryData = false;
  bool _isMapCreated = false;
  bool _isTabChangedThroughSelectingTab = false;
  final List<int> dataTypesToRefreshOnBackPress = [];

  // Currently IF Search or Filter is ON then pull to refresh and load more - both are disabled.
  bool disablePullToRefreshLoadMoreProperties = false;
  bool disablePullToRefreshLoadMoreInquiries = false;

  bool get hasMorePropertyData => _hasMorePropertyData;

  bool get hasMoreInquiryData => _hasMoreInquiryData;

  bool get isMapCreated => _isMapCreated;

  set setMapCreated(bool value) {
    _isMapCreated = value;
    notifyListeners();
  }

  int get myPropertiesCount => _myPropertiesCount;

  int get myInquiriesCount => _myInquiriesCount;

  int get propertiesFromNetworkCount => _propertiesFromNetworkCount;

  int get inquiriesFromNetworkCount => _inquiriesFromNetworkCount;

  int get selectedTabId => _selectedTabId;

  DbProperty? get selectedMapProperty => _selectedMapProperty;

  List<DbProperty> get myPropertyList => _filterMyPropertyList;

  List<DbSavedFilter> get myInquiriesList => _filterMyInquiriesList;

  List<DbProperty> get propertyFromNetworkList =>
      _filterPropertyFromNetworkList;

  List<DbSavedFilter> get inquiryFromNetworkList =>
      _filterInquiryFromNetworkList;

  static const int myPropertyTabId = 1;
  static const int brooonPropertyTabId = 2;
  static const int myInquiryTabId = 3;
  static const int brooonInquiryTabId = 4;
  static const int maxViewAllTabSize = 4;

  int _myPropertyTabPageNo = -1;
  int _brooonPropertyTabPageNo = -1;
  int _myInquiryTabPageNo = -1;
  int _brooonInquiryTabPageNo = -1;

  List<ViewAllTab> viewAllTabs = [];
  bool isNeedToCallApiForMatchingBrooonItems = false;
  bool _isSingleTabVisible = false;
  bool _isMyPropertiesTabVisible = false;
  bool _isBrooonPropertiesTabVisible = false;
  bool _isMyInquiriesTabVisible = false;
  bool _isBrooonInquiriesTabVisible = false;
  ViewAllTabsVisibilityType? _originalRoute;

  createViewAllTabs({
    required AppLocalizations localizationsContext,
    required ViewAllTabsVisibilityType? viewAllTabVisibility,
  }) {
    viewAllTabs = [
      ViewAllTab(
        id: myPropertyTabId,
        tabShortName: localizationsContext.propertyTabShortTerm,
        tabLongName: localizationsContext.myProperty,
      ),
      ViewAllTab(
        id: brooonPropertyTabId,
        tabShortName: localizationsContext.propertyTabShortTerm,
        tabLongName: localizationsContext.homeSharedByBrooonProperty,
      ),
      ViewAllTab(
        id: myInquiryTabId,
        tabShortName: localizationsContext.inquiryTabShortTerm,
        tabLongName: localizationsContext.myInquiries,
      ),
      ViewAllTab(
        id: brooonInquiryTabId,
        tabShortName: localizationsContext.inquiryTabShortTerm,
        tabLongName: localizationsContext.homeSharedByBrooonInquiry,
      ),
    ];
    tabVisibilityType = viewAllTabVisibility;
    _originalRoute = viewAllTabVisibility!;
  }

  init({
    required BuildContext context,
    required CommonPropertyDataProvider? commonProvider,
    required ViewAllFromType viewAllFromType,
    required int myPropertiesCount,
    required int myInquiriesCount,
    required int propertiesFromNetworkCount,
    required int? propertyTypeId,
    required DbSavedFilter? savedFilterObj,
    required DbSavedFilter? inquiryToMatch,
    required DbProperty? propertyToMatch,
    required BuyerSellerInfo? buyerSellerInfo,
    required String? searchBy,
    required bool isFilterSearchPropertiesInquiries,
    required bool isNeedToCallApiForMatching,
  }) async {
    mounted = true;
    _updateLoadMorePullToRefreshForBrooonProperties();
    _updateLoadMorePullToRefreshForBrooonInquiries();
    localizationsContext = AppLocalizations.of(context)!;
    _commonPropertyDataProvider = commonProvider;
    showDataFor = viewAllFromType;
    _myPropertiesCount = myPropertiesCount;
    _myInquiriesCount = myInquiriesCount;
    this._propertyTypeId = propertyTypeId;
    this.buyerSellerInfo = buyerSellerInfo;
    this.propertyToMatch = propertyToMatch;
    this.inquiryToMatch = inquiryToMatch;
    this.isNeedToCallApiForMatchingBrooonItems = isNeedToCallApiForMatching;
    filterObj = savedFilterObj;
    _updateSearchByTypeToRefreshOnBackPress();
    _searchBy = searchBy;
    _fetchData(
      context,
      checkForFilterBySearch: isFilterSearchPropertiesInquiries,
    );
    await _watchFilters();
    notifyListeners();
    userInfo = await _isarService.getUserInfo();
    _sharedByBrooonersPropertiesWatcher(context);
    _sharedByBrooonersInquiriesWatcher(context);
    _watchOnBlockedBroooners(context);
  }

  _updateLoadMorePullToRefreshForBrooonProperties({bool isDisabled = false}) {
    if (tabVisibilityType ==
            ViewAllTabsVisibilityType.fromBuyersMatchingProperties ||
        tabVisibilityType == ViewAllTabsVisibilityType.fromAddInquiries) {
      disablePullToRefreshLoadMoreProperties = true;
    } else {
      disablePullToRefreshLoadMoreProperties = isDisabled;
    }
  }

  _updateLoadMorePullToRefreshForBrooonInquiries({bool isDisabled = false}) {
    if (tabVisibilityType ==
        ViewAllTabsVisibilityType.fromSellersMatchingInquiries) {
      disablePullToRefreshLoadMoreInquiries = true;
    } else {
      disablePullToRefreshLoadMoreInquiries = isDisabled;
    }
  }

  _fetchData(
    BuildContext context, {
    bool checkForFilterBySearch = false,
  }) {
    _getPropertiesFromLocal(
      checkForFilterBySearch: checkForFilterBySearch,
    );
    _getInquiriesFromLocal(
      checkForFilterBySearch: checkForFilterBySearch,
    );
    _getPropertiesFromNetwork(
      context,
      checkForFilterBySearch: checkForFilterBySearch,
    );
    _getInquiriesFromNetwork(
      context,
      checkForFilterBySearch: checkForFilterBySearch,
    );
  }

  makePropertyFavorite(DbProperty property) async {
    final propertyFromDb =
        await _isarService.getPropertyByPropertyId(property.propertyId!);
    if (propertyFromDb != null) {
      propertyFromDb.isFavorite = !propertyFromDb.isFavorite;
      await _isarService.saveProperty(propertyFromDb);
      if (showDataFor == ViewAllFromType.favorite &&
          !propertyFromDb.isFavorite) {
        if (_isMyPropertiesTabVisible) {
          _myPropertyList.remove(propertyFromDb);
          _filterMyPropertyList.remove(propertyFromDb);
          _myPropertiesCount = _myPropertyList.length;
        }
      } else if (showDataFor != ViewAllFromType.favorite) {
        if (_isMyPropertiesTabVisible) {
          final myPropertyIndex = _myPropertyList.indexOf(propertyFromDb);
          if (myPropertyIndex != -1) {
            _myPropertyList[myPropertyIndex].isFavorite =
                propertyFromDb.isFavorite;
          }
          final filterPropertyIndex =
              _filterMyPropertyList.indexOf(propertyFromDb);
          if (filterPropertyIndex != -1) {
            _filterMyPropertyList[filterPropertyIndex].isFavorite =
                propertyFromDb.isFavorite;
          }
        }
      }
      notifyListeners();
    }
  }

  makeInquiryFavorite(DbSavedFilter inquiry) async {
    final inquiryFromDb =
        await _isarService.getInquiryByInquiryId(inquiry.inquiryId!);
    if (inquiryFromDb != null) {
      inquiryFromDb.isFavorite = !inquiryFromDb.isFavorite;
      await _isarService.saveFilter(inquiryFromDb);
      if (showDataFor == ViewAllFromType.favorite &&
          !inquiryFromDb.isFavorite) {
        if (_isMyInquiriesTabVisible) {
          _myInquiriesList.remove(inquiryFromDb);
          _filterMyInquiriesList.remove(inquiryFromDb);
          _myInquiriesCount = _myInquiriesList.length;
        }
      } else if (showDataFor != ViewAllFromType.favorite) {
        if (_isMyInquiriesTabVisible) {
          final myInquiryIndex = _myInquiriesList.indexOf(inquiryFromDb);
          if (myInquiryIndex != -1) {
            _myInquiriesList[myInquiryIndex].isFavorite =
                inquiryFromDb.isFavorite;
          }
          final filterInquiryIndex =
              _filterMyInquiriesList.indexOf(inquiryFromDb);
          if (filterInquiryIndex != -1) {
            _filterMyInquiriesList[filterInquiryIndex].isFavorite =
                inquiryFromDb.isFavorite;
          }
        }
      }
      notifyListeners();
    }
  }

  makePropertyUnmatched(DbProperty property) async {
    if (showDataFor == ViewAllFromType.buyers && buyerSellerInfo != null) {
      if (buyerSellerInfo!.buyerSellerType == BuyerSellerType.buyers &&
          buyerSellerInfo!.inquiries != null &&
          buyerSellerInfo!.inquiries!.isNotEmpty) {
        final inquiryFromDb = await _isarService.getInquiryByIds(
          buyerSellerInfo!.inquiries!.map((e) => e.inquiryId!).toList(),
        );
        await Future.forEach(
          inquiryFromDb,
          (inquiry) async {
            dynamic inquiryRelatedProperties =
                await _isarService.getFilteredProperties(
              filterToApply: inquiry,
              type: ViewAllFromType.buyers,
              buyerSellerInfo: buyerSellerInfo,
              excludeUnmatched: true,
            );

            if (inquiryRelatedProperties is List<DbProperty> &&
                inquiryRelatedProperties.isNotEmpty &&
                inquiryRelatedProperties.contains(property)) {
              if (!inquiry.unmatchProperties.contains(property.propertyId!)) {
                final list =
                    List<String>.from(inquiry.unmatchProperties.toList());
                list.add(property.propertyId!);
                inquiry.unmatchProperties = list;
                await _isarService.saveFilter(inquiry);
              }
              final indexOfProperty =
                  inquiryRelatedProperties.indexOf(property);
              if (indexOfProperty != -1 &&
                  !inquiryRelatedProperties[indexOfProperty]
                      .unmatchInquiries
                      .contains(inquiry.inquiryId!)) {
                final propertyFromDb =
                    inquiryRelatedProperties[indexOfProperty];
                final list =
                    List<String>.from(propertyFromDb.unmatchInquiries.toList());
                list.add(inquiry.inquiryId!);
                propertyFromDb.unmatchInquiries = list;
                await _isarService.saveProperty(propertyFromDb);
              }
            }
          },
        );
        if (_isMyPropertiesTabVisible) {
          _myPropertyList.remove(property);
          _filterMyPropertyList.remove(property);
          _myPropertiesCount = _myPropertyList.length;
        }
        if (_isBrooonPropertiesTabVisible) {
          _propertyFromNetworkList.remove(property);
          _filterPropertyFromNetworkList.remove(property);
          _propertiesFromNetworkCount = _propertyFromNetworkList.length;
        }
        notifyListeners();
      }
    } else if (showDataFor == ViewAllFromType.matches &&
        inquiryToMatch != null) {
      dynamic inquiryRelatedProperties =
          await _isarService.getFilteredProperties(
        filterToApply: inquiryToMatch,
        type: ViewAllFromType.properties,
        excludeUnmatched: true,
      );

      if (inquiryRelatedProperties is List<DbProperty> &&
          inquiryRelatedProperties.isNotEmpty &&
          inquiryRelatedProperties.contains(property)) {
        if (!inquiryToMatch!.unmatchProperties.contains(property.propertyId!)) {
          final list =
              List<String>.from(inquiryToMatch!.unmatchProperties.toList());
          list.add(property.propertyId!);
          inquiryToMatch!.unmatchProperties = list;
          await _isarService.saveFilter(inquiryToMatch!);
        }
        final indexOfProperty = inquiryRelatedProperties.indexOf(property);
        if (indexOfProperty != -1 &&
            !inquiryRelatedProperties[indexOfProperty]
                .unmatchInquiries
                .contains(inquiryToMatch!.inquiryId!)) {
          final propertyFromDb = inquiryRelatedProperties[indexOfProperty];
          final list =
              List<String>.from(propertyFromDb.unmatchInquiries.toList());
          list.add(inquiryToMatch!.inquiryId!);
          propertyFromDb.unmatchInquiries = list;
          await _isarService.saveProperty(propertyFromDb);
        }
      }
      if (_isMyPropertiesTabVisible) {
        _myPropertyList.remove(property);
        _filterMyPropertyList.remove(property);
        _myPropertiesCount = _myPropertyList.length;
      }
      if (_isBrooonPropertiesTabVisible) {
        _propertyFromNetworkList.remove(property);
        _filterPropertyFromNetworkList.remove(property);
        _propertiesFromNetworkCount = _propertyFromNetworkList.length;
      }
      notifyListeners();
    }
  }

  makeInquiryUnmatched(DbSavedFilter inquiry) async {
    if (showDataFor == ViewAllFromType.sellers && buyerSellerInfo != null) {
      if (buyerSellerInfo!.buyerSellerType == BuyerSellerType.sellers &&
          buyerSellerInfo!.properties != null &&
          buyerSellerInfo!.properties!.isNotEmpty) {
        List<DbProperty> propertiesOfSeller =
            await _isarService.getFilteredProperties(
          type: ViewAllFromType.sellers,
          buyerSellerInfo: buyerSellerInfo,
        );

        await Future.forEach(
          propertiesOfSeller,
          (propertyInfo) async {
            dynamic propertyRelatedInquiries =
                await _isarService.getInquiriesByProperty(
              propertyInfo,
              excludeUnmatched: true,
            );

            if (propertyRelatedInquiries is List<DbSavedFilter> &&
                propertyRelatedInquiries.isNotEmpty &&
                propertyRelatedInquiries.contains(inquiry)) {
              if (!propertyInfo.unmatchInquiries.contains(inquiry.inquiryId!)) {
                final list =
                    List<String>.from(propertyInfo.unmatchInquiries.toList());
                list.add(inquiry.inquiryId!);
                propertyInfo.unmatchInquiries = list;
                await _isarService.saveProperty(propertyInfo);
              }
              final indexOfInquiry = propertyRelatedInquiries.indexOf(inquiry);
              if (indexOfInquiry != -1 &&
                  !propertyRelatedInquiries[indexOfInquiry]
                      .unmatchProperties
                      .contains(propertyInfo.propertyId!)) {
                final inquiryFromDb = propertyRelatedInquiries[indexOfInquiry];
                final list =
                    List<String>.from(inquiryFromDb.unmatchProperties.toList());
                list.add(propertyInfo.propertyId!);
                inquiryFromDb.unmatchProperties = list;
                await _isarService.saveFilter(inquiryFromDb);
              }
            }
          },
        );

        if (_isMyInquiriesTabVisible) {
          _myInquiriesList.remove(inquiry);
          _filterMyInquiriesList.remove(inquiry);
          _myInquiriesCount = _myInquiriesList.length;
        }
        if (_isBrooonInquiriesTabVisible) {
          _inquiryFromNetworkList.remove(inquiry);
          _filterInquiryFromNetworkList.remove(inquiry);
          _inquiriesFromNetworkCount = _inquiryFromNetworkList.length;
        }
        notifyListeners();
      }
    } else if (showDataFor == ViewAllFromType.matches &&
        propertyToMatch != null) {
      dynamic propertyRelatedInquiries =
          await _isarService.getInquiriesByProperty(
        propertyToMatch!,
        excludeUnmatched: true,
      );

      if (propertyRelatedInquiries is List<DbSavedFilter> &&
          propertyRelatedInquiries.isNotEmpty &&
          propertyRelatedInquiries.contains(inquiry)) {
        if (!propertyToMatch!.unmatchInquiries.contains(inquiry.inquiryId!)) {
          final list =
              List<String>.from(propertyToMatch!.unmatchInquiries.toList());
          list.add(inquiry.inquiryId!);
          propertyToMatch!.unmatchInquiries = list;
          await _isarService.saveProperty(propertyToMatch!);
        }
        final indexOfInquiry = propertyRelatedInquiries.indexOf(inquiry);
        if (indexOfInquiry != -1 &&
            !propertyRelatedInquiries[indexOfInquiry]
                .unmatchProperties
                .contains(propertyToMatch!.propertyId!)) {
          final inquiryFromDb = propertyRelatedInquiries[indexOfInquiry];
          final list =
              List<String>.from(inquiryFromDb.unmatchProperties.toList());
          list.add(propertyToMatch!.propertyId!);
          inquiryFromDb.unmatchProperties = list;
          await _isarService.saveFilter(inquiryFromDb);
        }
      }

      if (_isMyInquiriesTabVisible) {
        _myInquiriesList.remove(inquiry);
        _filterMyInquiriesList.remove(inquiry);
        _myInquiriesCount = _myInquiriesList.length;
      }
      if (_isBrooonInquiriesTabVisible) {
        _inquiryFromNetworkList.remove(inquiry);
        _filterInquiryFromNetworkList.remove(inquiry);
        _inquiriesFromNetworkCount = _inquiryFromNetworkList.length;
      }
      notifyListeners();
    }
  }

  makePropertyMatch(DbProperty property) async {
    if (property.unmatchInquiries.isNotEmpty) {
      final inquiriesWithThisUnmatchProperty = await _isarService
          .getUnmatchedInquiries(unmatchedPropertyId: property.propertyId!);
      final propertyFromDb =
          await _isarService.getPropertyByPropertyId(property.propertyId!);
      if (propertyFromDb != null) {
        propertyFromDb.unmatchInquiries = [];
        await _isarService.saveProperty(propertyFromDb);
      }
      await Future.forEach(
        inquiriesWithThisUnmatchProperty,
        (element) async {
          final unmatchedPropertyList =
              List<String>.from(element.unmatchProperties.toList());
          unmatchedPropertyList.remove(property.propertyId!);
          element.unmatchProperties = unmatchedPropertyList;
          await _isarService.saveFilter(element);
          if (element.unmatchProperties.isEmpty) {
            if (_isMyInquiriesTabVisible) {
              _myInquiriesList.remove(element);
              _filterMyInquiriesList.remove(element);
              _myInquiriesCount = _myInquiriesList.length;
            }
            if (_isBrooonInquiriesTabVisible) {
              _inquiryFromNetworkList.remove(element);
              _filterInquiryFromNetworkList.remove(element);
              _inquiriesFromNetworkCount = _inquiryFromNetworkList.length;
            }
          }
        },
      );
      if (_isMyPropertiesTabVisible) {
        _myPropertyList.remove(property);
        _filterMyPropertyList.remove(property);
        _myPropertiesCount = _myPropertyList.length;
      }
      if (_isBrooonPropertiesTabVisible) {
        _propertyFromNetworkList.remove(property);
        _filterPropertyFromNetworkList.remove(property);
        _propertiesFromNetworkCount = _propertyFromNetworkList.length;
      }
      notifyListeners();
    }
  }

  makeInquiryMatch(DbSavedFilter inquiry) async {
    if (inquiry.unmatchProperties.isNotEmpty) {
      final propertiesWithThisUnmatchInquiry = await _isarService
          .getUnmatchedProperties(unmatchedInquiryId: inquiry.inquiryId!);
      final inquiryFromDb =
          await _isarService.getInquiryByInquiryId(inquiry.inquiryId!);
      if (inquiryFromDb != null) {
        inquiryFromDb.unmatchProperties = [];
        await _isarService.saveFilter(inquiryFromDb);
      }
      await Future.forEach(
        propertiesWithThisUnmatchInquiry,
        (element) async {
          final unmatchedInquiryList =
              List<String>.from(element.unmatchInquiries.toList());
          unmatchedInquiryList.remove(inquiry.inquiryId!);
          element.unmatchInquiries = unmatchedInquiryList;
          await _isarService.saveProperty(element);
          if (element.unmatchInquiries.isEmpty) {
            if (_isMyPropertiesTabVisible) {
              _myPropertyList.remove(element);
              _filterMyPropertyList.remove(element);
              _myPropertiesCount = _myPropertyList.length;
            }
            if (_isBrooonPropertiesTabVisible) {
              _propertyFromNetworkList.remove(element);
              _filterPropertyFromNetworkList.remove(element);
              _propertiesFromNetworkCount = _propertyFromNetworkList.length;
            }
          }
        },
      );
      if (_isMyInquiriesTabVisible) {
        _myInquiriesList.remove(inquiry);
        _filterMyInquiriesList.remove(inquiry);
        _myInquiriesCount = _myInquiriesList.length;
      }
      if (_isBrooonInquiriesTabVisible) {
        _inquiryFromNetworkList.remove(inquiry);
        _filterInquiryFromNetworkList.remove(inquiry);
        _inquiriesFromNetworkCount = _inquiryFromNetworkList.length;
      }
      notifyListeners();
    }
  }

  bool _filterForSearchProperties() {
    return filterObj != null &&
        filterObj!.filterSearchBy!.any(
          (element) => element == SaveDefaultData.filterSearchByPropertiesId,
        );
  }

  bool _filterForSearchInquiries() {
    return filterObj != null &&
        filterObj!.filterSearchBy!.any(
          (element) => element == SaveDefaultData.filterSearchByInquiriesId,
        );
  }

  _getPropertiesFromLocal({bool checkForFilterBySearch = false}) {
    if (_isMyPropertiesTabVisible) {
      if (showDataFor == ViewAllFromType.nearBy) {
        _getNearByProperties(checkForFilterBySearch: checkForFilterBySearch);
      } else if (showDataFor == ViewAllFromType.searchList) {
        _searchProperties();
      } else if (showDataFor == ViewAllFromType.buyers) {
        _getBuyerRelatedProperties();
      } else if (showDataFor == ViewAllFromType.unMatches) {
        _getLocalUnmatchedProperties();
      } else if (showDataFor == ViewAllFromType.matches) {
        _getLocalMatchedProperties();
      } else if (showDataFor == ViewAllFromType.favorite) {
        _getLocalFavoriteProperties();
      } else {
        _getFilteredProperties(checkForFilterBySearch: checkForFilterBySearch);
      }
    } else {
      _myPropertyList.clear();
      _filterMyPropertyList.clear();
      _myPropertiesCount = 0;
      notifyListeners();
    }
  }

  _getInquiriesFromLocal({bool checkForFilterBySearch = false}) async {
    if (_isMyInquiriesTabVisible) {
      if (buyerSellerInfo != null &&
          buyerSellerInfo?.showDataFor == BuyerSellerViewType.inquiries &&
          (showDataFor == ViewAllFromType.buyers ||
              showDataFor == ViewAllFromType.sellers)) {
        _getBuyerSellerRelatedInquiries();
      } else if (showDataFor == ViewAllFromType.searchList) {
        _searchInquiries();
      } else if (showDataFor == ViewAllFromType.unMatches) {
        _getLocalUnmatchedInquiries();
      } else if (showDataFor == ViewAllFromType.nearBy) {
        _getNearByInquiries(checkForFilterBySearch: checkForFilterBySearch);
      } else if (showDataFor == ViewAllFromType.matches) {
        _getLocalMatchedInquiries();
      } else if (showDataFor == ViewAllFromType.favorite) {
        _getLocalFavoriteInquiries();
      } else {
        _getFilteredInquiries(checkForFilterBySearch: checkForFilterBySearch);
      }
    } else {
      _myInquiriesList.clear();
      _filterMyInquiriesList.clear();
      _myInquiriesCount = 0;
      notifyListeners();
    }
  }

  _getLocalFavoriteProperties() async {
    _myPropertyList.clear();
    _filterMyPropertyList.clear();
    final favoritePropertyList = await _isarService.getFavoriteProperties();
    _myPropertyList.addAll(favoritePropertyList);
    _filterMyPropertyList.addAll(_myPropertyList);
    _myPropertiesCount = _myPropertyList.length;
    notifyListeners();
  }

  _getLocalFavoriteInquiries() async {
    _myInquiriesList.clear();
    _filterMyInquiriesList.clear();
    final favoriteInquiryList = await _isarService.getFavoriteInquiries();
    _myInquiriesList.addAll(favoriteInquiryList);
    _filterMyInquiriesList.addAll(_myInquiriesList);
    _myInquiriesCount = _myInquiriesList.length;
    notifyListeners();
  }

  _getLocalUnmatchedProperties() async {
    _myPropertyList.clear();
    _filterMyPropertyList.clear();
    final unmatchedPropertyList = await _isarService.getUnmatchedProperties();
    _myPropertyList.addAll(unmatchedPropertyList);
    _filterMyPropertyList.addAll(_myPropertyList);
    _myPropertiesCount = _myPropertyList.length;
    notifyListeners();
  }

  _getLocalUnmatchedInquiries() async {
    _myInquiriesList.clear();
    _filterMyInquiriesList.clear();
    final unmatchedInquiryList = await _isarService.getUnmatchedInquiries();
    _myInquiriesList.addAll(unmatchedInquiryList);
    _filterMyInquiriesList.addAll(_myInquiriesList);
    _myInquiriesCount = _myInquiriesList.length;
    notifyListeners();
  }

  _getLocalMatchedProperties() async {
    if (inquiryToMatch != null) {
      _myPropertyList.clear();
      _filterMyPropertyList.clear();
      final matchedPropertyList =
          await CommonPropertyDataProvider.getMatchingPropertiesFromInquiry(
        inquiry: inquiryToMatch!,
        viewAllType: ViewAllFromType.properties,
      );
      _myPropertyList.addAll(matchedPropertyList);
      _filterMyPropertyList.addAll(_myPropertyList);
      _myPropertiesCount = _myPropertyList.length;
      notifyListeners();
    }
  }

  _getLocalMatchedInquiries() async {
    if (propertyToMatch != null) {
      _myInquiriesList.clear();
      _filterMyInquiriesList.clear();
      final matchedInquiryList =
          await CommonPropertyDataProvider.getMatchingInquiriesFromProperty(
        propertyInfo: propertyToMatch!,
      );
      _myInquiriesList.addAll(matchedInquiryList);
      _filterMyInquiriesList.addAll(_myInquiriesList);
      _myInquiriesCount = _myInquiriesList.length;
      notifyListeners();
    }
  }

  _getBuyerSellerRelatedInquiries() async {
    List<DbSavedFilter> inquiryList = [];
    _myInquiriesList.clear();
    _filterMyInquiriesList.clear();
    if (showDataFor == ViewAllFromType.sellers) {
      List<DbProperty> propertiesOfSeller =
          await _isarService.getFilteredProperties(
        type: ViewAllFromType.sellers,
        buyerSellerInfo: buyerSellerInfo,
      );
      inquiryList.clear();
      await Future.forEach(
        propertiesOfSeller,
        (propertyInfo) async {
          dynamic propertyRelatedInquiries =
              await CommonPropertyDataProvider.getMatchingInquiriesFromProperty(
                  propertyInfo: propertyInfo);

          await Future.forEach(
            propertyRelatedInquiries as List<DbSavedFilter>,
            (element) {
              if (!inquiryList.contains(element)) {
                inquiryList.add(element);
              }
            },
          );
        },
      );
    } else if (showDataFor == ViewAllFromType.buyers) {
      inquiryList = await _isarService.getInquiryByBuyer(
        buyerName: buyerSellerInfo!.name!,
        buyerPhone: buyerSellerInfo!.phone,
      );
    }
    _myInquiriesList.addAll(inquiryList);
    _filterMyInquiriesList.addAll(_myInquiriesList);
    _myInquiriesCount = _myInquiriesList.length;
    notifyListeners();
  }

  _updateSearchByTypeToRefreshOnBackPress() {
    if (filterObj != null &&
        filterObj?.filterSearchBy != null &&
        filterObj!.filterSearchBy!.isNotEmpty) {
      filterObj!.filterSearchBy!.forEach(
        (element) {
          if (!dataTypesToRefreshOnBackPress.contains(element)) {
            dataTypesToRefreshOnBackPress.add(element);
          }
        },
      );
    }
  }

  _updateViewAllTabsBasedOnFilterChanges() {
    if (filterObj?.filterSearchBy != null &&
        filterObj!.filterSearchBy!.isNotEmpty) {
      final isInquiryFilter = filterObj!.filterSearchBy!
          .contains(SaveDefaultData.filterSearchByInquiriesId);
      final isPropertyFilter = filterObj!.filterSearchBy!
          .contains(SaveDefaultData.filterSearchByPropertiesId);
      _selectedTabId = _unknownTabId;
      if (_originalRoute ==
              ViewAllTabsVisibilityType.fromHomeViewAllBrooonProperties ||
          _originalRoute ==
              ViewAllTabsVisibilityType.fromPropertiesNotification) {
        if (isInquiryFilter && !isPropertyFilter) {
          tabVisibilityType =
              ViewAllTabsVisibilityType.fromHomeViewAllBrooonInquiries;
          checkForTabVisibility(tabId: _unknownTabId);
        } else if (isPropertyFilter && !isInquiryFilter) {
          tabVisibilityType =
              ViewAllTabsVisibilityType.fromHomeViewAllBrooonProperties;
          checkForTabVisibility(tabId: _unknownTabId);
        }
      } else if (_originalRoute ==
              ViewAllTabsVisibilityType.fromHomeViewAllBrooonInquiries ||
          _originalRoute ==
              ViewAllTabsVisibilityType.fromInquiriesNotification) {
        if (isInquiryFilter && !isPropertyFilter) {
          tabVisibilityType =
              ViewAllTabsVisibilityType.fromHomeViewAllBrooonInquiries;
          checkForTabVisibility(tabId: _unknownTabId);
        } else if (isPropertyFilter && !isInquiryFilter) {
          tabVisibilityType =
              ViewAllTabsVisibilityType.fromHomeViewAllBrooonProperties;
          checkForTabVisibility(tabId: _unknownTabId);
        }
      } else if (_originalRoute == ViewAllTabsVisibilityType.fromAddInquiries ||
          _originalRoute == ViewAllTabsVisibilityType.fromAddProperties) {
        // Currently fromAddInquiries -> filter icon is disabled
        // but for future if its getting enabled then this case will help
        // Though its not tested!!
        tabVisibilityType =
            ViewAllTabsVisibilityType.fromAddPropertyInquiryWithFilter;
        checkForTabVisibility(tabId: _unknownTabId);
      } else {
        if (isInquiryFilter && isPropertyFilter) {
          // showing all tabs
          tabVisibilityType =
              ViewAllTabsVisibilityType.fromPropertiesInquiriesBothFilter;
          checkForTabVisibility(tabId: _unknownTabId);
        } else if (isInquiryFilter && !isPropertyFilter) {
          tabVisibilityType = ViewAllTabsVisibilityType.fromInquiriesFilter;
          checkForTabVisibility(tabId: _unknownTabId);
        } else if (isPropertyFilter && !isInquiryFilter) {
          tabVisibilityType = ViewAllTabsVisibilityType.fromPropertiesFilter;
          checkForTabVisibility(tabId: _unknownTabId);
        }
      }
    }
  }

  updateFilterData(BuildContext context, DbSavedFilter filter) async {
    filterObj = filter;
    if (filter.stringQuery != null && filter.stringQuery!.trim().isNotEmpty) {
      searchFieldTextController.text = filter.stringQuery!;
    }
    await _watchFilters();
    _updateSearchByTypeToRefreshOnBackPress();
    _updateViewAllTabsBasedOnFilterChanges();
    _fetchData(
      context,
      checkForFilterBySearch: true,
    );
    notifyListeners();
    // update selected tab and page view
    updateSelectedTab(_selectedTabId);
    _isTabChangedThroughSelectingTab = false;
  }

  deleteFilter() async {
    await _isarService.deleteFilter(filterObj!.id);
  }

  _watchFilters() async {
    filterWatcher?.cancel();
    if (filterObj != null) {
      doesFilterExists =
          (await _isarService.checkIfFilterExists(id: filterObj!.id)) != null;
      filterWatcher = (await _isarService.watchOnFilterChanges()).listen(
        (event) async {
          final filter =
              await _isarService.checkIfFilterExists(id: filterObj!.id);
          doesFilterExists = filter != null;
          if (doesFilterExists) {
            filterObj!.id = filter!.id;
            filterObj!.filterName = filter.filterName;
            filterObj!.buyerName = filter.buyerName;
            filterObj!.mobileNo = filter.mobileNo;
          } else {
            filterObj!.filterName = '';
            filterObj!.buyerName = '';
            filterObj!.mobileNo = '';
          }
          notifyListeners();
        },
      );
    }
  }

  int _getPropertyForIdFromName() {
    return SaveDefaultData.propertyForAllId;
  }

  _getNearByProperties({bool checkForFilterBySearch = false}) async {
    _myPropertyList.clear();
    _filterMyPropertyList.clear();
    final propertyForId = _getPropertyForIdFromName();
    if (propertyForId == SaveDefaultData.propertyForAllId) {
      final list =
          await _commonPropertyDataProvider?.getAllNearByPropertiesWithinRadius(
        filterToApply: checkForFilterBySearch
            ? (_filterForSearchProperties() ? filterObj : null)
            : filterObj,
      );
      if (list != null && list.isNotEmpty) {
        _myPropertyList.addAll(list);
        _filterMyPropertyList.addAll(_myPropertyList);
      }
      _myPropertiesCount = _myPropertyList.length;
    } else {
      final list = await _commonPropertyDataProvider
          ?.getAllNearByPropertiesWithinRadius(propertyFor: propertyForId);
      if (list != null && list.isNotEmpty) {
        _myPropertyList.addAll(list);
        _filterMyPropertyList.addAll(_myPropertyList);
      }
    }
    notifyListeners();
  }

  _getNearByInquiries({bool checkForFilterBySearch = false}) async {
    _myInquiriesList.clear();
    _filterMyInquiriesList.clear();
    final propertyForId = _getPropertyForIdFromName();
    if (propertyForId == SaveDefaultData.propertyForAllId) {
      final list =
          await _commonPropertyDataProvider?.getAllNearByInquiriesWithinRadius(
        filterToApply: checkForFilterBySearch
            ? (_filterForSearchInquiries() ? filterObj : null)
            : filterObj,
      );
      if (list != null && list.isNotEmpty) {
        _myInquiriesList.addAll(list);
        _filterMyInquiriesList.addAll(_myInquiriesList);
      }
      _myInquiriesCount = _myInquiriesList.length;
    } else {
      final list = await _commonPropertyDataProvider
          ?.getAllNearByInquiriesWithinRadius(propertyFor: propertyForId);
      if (list != null && list.isNotEmpty) {
        _myInquiriesList.addAll(list);
        _filterMyInquiriesList.addAll(_myInquiriesList);
      }
      _myInquiriesCount = _myInquiriesList.length;
    }
    notifyListeners();
  }

  _getFilteredInquiries({bool checkForFilterBySearch = false}) async {
    _myInquiriesList.clear();
    _filterMyInquiriesList.clear();
    List<DbSavedFilter> inquiryList = await _isarService.getFilteredInquiries(
      filterToApply: checkForFilterBySearch
          ? (_filterForSearchInquiries() ? filterObj : null)
          : filterObj,
      type: showDataFor,
      propertyTypeId: filterObj == null ? _propertyTypeId : null,
      buyerSellerInfo: buyerSellerInfo,
    );
    if (checkForFilterBySearch && _filterForSearchInquiries()) {
      inquiryList =
          LocationFilterHelper.applyLocationFilterForInquiresIfRequired(
        typedLocation: filterObj?.location,
        latitude: filterObj?.latitude,
        longitude: filterObj?.longitude,
        filteredList: inquiryList,
      );
    }
    _myInquiriesList.addAll(inquiryList);
    _filterMyInquiriesList.addAll(_myInquiriesList);
    _myInquiriesCount = _myInquiriesList.length;
    if (showDataFor == ViewAllFromType.searchList &&
        _searchBy != null &&
        _searchBy.toString().trim().isNotEmpty) {
      searchByInquires(_searchBy!);
    } else if (showDataFor != ViewAllFromType.searchList &&
        searchFieldTextController.text.trim().isNotEmpty) {
      searchByInquires(searchFieldTextController.text);
    }
    notifyListeners();
  }

  _getBuyerRelatedProperties() async {
    if (buyerSellerInfo?.buyerSellerType == BuyerSellerType.buyers &&
        buyerSellerInfo?.showDataFor == BuyerSellerViewType.properties) {
      final List<DbProperty> propertyList = [];
      await Future.forEach(
        buyerSellerInfo!.inquiries!,
        (inquiry) async {
          dynamic inquiryRelatedProperties =
              await CommonPropertyDataProvider.getMatchingPropertiesFromInquiry(
            inquiry: inquiry,
            buyerItem: buyerSellerInfo,
            viewAllType: ViewAllFromType.buyers,
          );

          await Future.forEach(
            inquiryRelatedProperties as List<DbProperty>,
            (element) {
              if (!propertyList.contains(element)) {
                propertyList.add(element);
              }
            },
          );
        },
      );
      _myPropertyList.clear();
      _filterMyPropertyList.clear();
      _myPropertyList.addAll(propertyList);
      _filterMyPropertyList.addAll(_myPropertyList);
      _myPropertiesCount = _myPropertyList.length;
      notifyListeners();
    }
  }

  _getFilteredProperties({bool checkForFilterBySearch = false}) async {
    _myPropertyList.clear();
    _filterMyPropertyList.clear();
    List<DbProperty> localFilteredList =
        await _isarService.getFilteredProperties(
      filterToApply: checkForFilterBySearch
          ? (_filterForSearchProperties() ? filterObj : null)
          : filterObj,
      type: showDataFor,
      propertyTypeId: filterObj == null ? _propertyTypeId : null,
      buyerSellerInfo: buyerSellerInfo,
    );
    if (checkForFilterBySearch && _filterForSearchProperties()) {
      localFilteredList =
          LocationFilterHelper.applyLocationFilterForPropertiesIfRequired(
        typedLocation: filterObj?.location,
        latitude: filterObj?.latitude,
        longitude: filterObj?.longitude,
        filteredList: localFilteredList,
      );
    }
    _myPropertyList.addAll(localFilteredList);
    _filterMyPropertyList.addAll(_myPropertyList);
    _myPropertiesCount = _myPropertyList.length;
    if (showDataFor == ViewAllFromType.searchList &&
        _searchBy != null &&
        _searchBy.toString().trim().isNotEmpty) {
      searchByProperties(_searchBy!);
    } else if (showDataFor != ViewAllFromType.searchList &&
        searchFieldTextController.text.trim().isNotEmpty) {
      searchByProperties(searchFieldTextController.text);
    }
    notifyListeners();
  }

  _searchProperties() async {
    _myPropertyList.clear();
    _filterMyPropertyList.clear();
    List<DbProperty> list = await _isarService.getAllActiveProperties();
    _myPropertyList.addAll(list);
    _filterMyPropertyList.addAll(_myPropertyList);
    _myPropertiesCount = _myPropertyList.length;
    if (_searchBy != null && _searchBy.toString().trim().isNotEmpty) {
      searchByProperties(_searchBy!);
    }
    notifyListeners();
  }

  _searchInquiries() async {
    _myInquiriesList.clear();
    _filterMyInquiriesList.clear();
    List<DbSavedFilter> list = await _isarService.getAllActiveInquiries(
      showBuyer: true,
      byPropertyType: filterObj == null ? _propertyTypeId : null,
    );
    _myInquiriesList.addAll(list);
    _filterMyInquiriesList.addAll(_myInquiriesList);
    _myInquiriesCount = _myInquiriesList.length;
    if (_searchBy != null && _searchBy.toString().trim().isNotEmpty) {
      searchByInquires(_searchBy!);
    }
    notifyListeners();
  }

  updateSelectedTab(int tabId) {
    _selectedTabId = tabId;
    _updateTabController();
    notifyListeners();
  }

  _updateTabController() {
    // If only one tab is visible then don't go for page view scrolling feature
    if (_isSingleTabVisible) {
      debugPrint('single tab clicked');
      return;
    }
    _isTabChangedThroughSelectingTab = true;
    tabPageController.animateToPage(
      _getPageNoFromTabId(),
      duration: const Duration(
        milliseconds: 200,
      ),
      curve: Curves.easeIn,
    );
  }

  // _getDefaultPageNoFromId() is also having similar feature so if we are changing here
  // We must need to change there
  int _getPageNoFromTabId() {
    int page = -1;
    if (_selectedTabId == myPropertyTabId && _isMyPropertiesTabVisible) {
      page = 0;
    } else if (_selectedTabId == brooonPropertyTabId &&
        _isBrooonPropertiesTabVisible) {
      page = 0;
      if (_isMyPropertiesTabVisible) {
        page += 1;
      }
    } else if (_selectedTabId == myInquiryTabId && _isMyInquiriesTabVisible) {
      page = 0;
      if (_isMyPropertiesTabVisible) {
        page += 1;
      }
      if (_isBrooonPropertiesTabVisible) {
        page += 1;
      }
    } else if (_selectedTabId == brooonInquiryTabId &&
        _isBrooonInquiriesTabVisible) {
      page = 0;
      if (_isMyPropertiesTabVisible) {
        page += 1;
      }
      if (_isBrooonPropertiesTabVisible) {
        page += 1;
      }
      if (_isMyInquiriesTabVisible) {
        page += 1;
      }
    }
    return page;
  }

  // _getPageNoFromTabId() is also having similar feature so if we are changing here
  // We must need to change there
  _getDefaultPageNoFromId() {
    int page = -1;
    if (_isMyPropertiesTabVisible) {
      page = 0;
      _myPropertyTabPageNo = page;
    }
    if (_isBrooonPropertiesTabVisible) {
      page = 0;
      if (_isMyPropertiesTabVisible) {
        page += 1;
      }
      _brooonPropertyTabPageNo = page;
    }
    if (_isMyInquiriesTabVisible) {
      page = 0;
      if (_isMyPropertiesTabVisible) {
        page += 1;
      }
      if (_isBrooonPropertiesTabVisible) {
        page += 1;
      }
      _myInquiryTabPageNo = page;
    }
    if (_isBrooonInquiriesTabVisible) {
      page = 0;
      if (_isMyPropertiesTabVisible) {
        page += 1;
      }
      if (_isBrooonPropertiesTabVisible) {
        page += 1;
      }
      if (_isMyInquiriesTabVisible) {
        page += 1;
      }
      _brooonInquiryTabPageNo = page;
    }
  }

  onTabPageChange(int pageNo) {
    if (!_isTabChangedThroughSelectingTab) {
      _getDefaultPageNoFromId();
      if (_isMyPropertiesTabVisible && _myPropertyTabPageNo == pageNo) {
        _selectedTabId = myPropertyTabId;
      } else if (_isBrooonPropertiesTabVisible &&
          _brooonPropertyTabPageNo == pageNo) {
        _selectedTabId = brooonPropertyTabId;
      } else if (_isMyInquiriesTabVisible && _myInquiryTabPageNo == pageNo) {
        _selectedTabId = myInquiryTabId;
      } else if (_isBrooonInquiriesTabVisible &&
          _brooonInquiryTabPageNo == pageNo) {
        _selectedTabId = brooonInquiryTabId;
      }
      notifyListeners();
    }
    _isTabChangedThroughSelectingTab = false;
  }

  _resetPropertyFromNetworkList() {
    _propertyFromNetworkList.clear();
    _filterPropertyFromNetworkList.clear();
    _propertiesFromNetworkCount = 0;
    if (mounted) {
      notifyListeners();
    }
  }

  _resetInquiryFromNetworkList() {
    _inquiryFromNetworkList.clear();
    _filterInquiryFromNetworkList.clear();
    _inquiriesFromNetworkCount = 0;
    if (mounted) {
      notifyListeners();
    }
  }

  _getPropertiesFromNetwork(
    BuildContext context, {
    bool checkForFilterBySearch = false,
  }) async {
    if (_isBrooonPropertiesTabVisible) {
      _resetPropertyFromNetworkList();
      if (StaticFunctions.isSubScribedUser) {
        fetchSharedByBrooonersProperty(
          context,
          checkForFilterBySearch: checkForFilterBySearch,
        );
      }
    } else {
      _propertyFromNetworkList.clear();
      _filterPropertyFromNetworkList.clear();
      _propertiesFromNetworkCount = 0;
      notifyListeners();
    }
  }

  _watchOnBlockedBroooners(BuildContext context) async {
    final blockedBrooonerChanges =
        await _isarService.watchOnBlockedBrooonerChanges();
    blockedBrooonerStreamSubscription = blockedBrooonerChanges.listen(
      (event) {
        _getPropertiesFromNetwork(context);
        _getInquiriesFromNetwork(context);
      },
    );
  }

  _getInquiriesFromNetwork(
    BuildContext context, {
    bool checkForFilterBySearch = false,
  }) async {
    if (_isBrooonInquiriesTabVisible) {
      _resetInquiryFromNetworkList();
      if (StaticFunctions.isSubScribedUser) {
        fetchSharedByBrooonersInquiry(
          context,
          checkForFilterBySearch: checkForFilterBySearch,
        );
      }
    } else {
      _inquiryFromNetworkList.clear();
      _filterInquiryFromNetworkList.clear();
      _inquiriesFromNetworkCount = 0;
      notifyListeners();
    }
  }

  _updateSharedByPropertyCounts({
    bool needToCheckForViewAll = false,
    String searchBy = '',
  }) async {
    if (StaticFunctions.isSubScribedUser) {
      // Show broooners property count from table if view all clicked for
      // shared by broooners from HOME
      // OR view all properties from HOME
      if (needToCheckForViewAll) {
        await _getSharedByBrooonPropertyCount();
      } else {
        if (searchBy.trim().isNotEmpty) {
          _propertiesFromNetworkCount = _filterPropertyFromNetworkList.length;
        } else {
          await _getSharedByBrooonPropertyCount();
        }
      }
    }
  }

  _updateSharedByInquiryCounts({
    bool needToCheckForViewAll = false,
    String searchBy = '',
  }) async {
    if (StaticFunctions.isSubScribedUser) {
      // Show broooners inquiry count from table if view all clicked for
      // shared by broooners from HOME
      // OR view all inquiries from HOME
      if (needToCheckForViewAll) {
        await _getSharedByBrooonInquiryCount();
      } else {
        if (searchBy.trim().isNotEmpty) {
          _inquiriesFromNetworkCount = _filterInquiryFromNetworkList.length;
        } else {
          await _getSharedByBrooonInquiryCount();
        }
      }
    }
  }

  _getSharedByBrooonPropertyCount() async {
    if (tabVisibilityType ==
            ViewAllTabsVisibilityType.fromBuyersMatchingProperties ||
        tabVisibilityType == ViewAllTabsVisibilityType.fromAddInquiries) {
      _propertiesFromNetworkCount = _filterPropertyFromNetworkList.length;
    } else {
      final brooonPropertyInfo =
          await _isarService.getBrooonPropertiesCountSchema();
      _propertiesFromNetworkCount = brooonPropertyInfo?.totalItemsCount ?? 0;
    }
  }

  _getSharedByBrooonInquiryCount() async {
    if (tabVisibilityType ==
        ViewAllTabsVisibilityType.fromSellersMatchingInquiries) {
      _inquiriesFromNetworkCount = _filterInquiryFromNetworkList.length;
    } else {
      final brooonInquiryInfo =
          await _isarService.getBrooonInquiriesCountSchema();
      _inquiriesFromNetworkCount = brooonInquiryInfo?.totalItemsCount ?? 0;
    }
  }

  bool _compareForPropertySearch(DbProperty element, String searchBy) {
    return element.propertyName.toString().trim().toLowerCase().contains(
              searchBy.toString().trim().toLowerCase(),
            ) ||
        element.propertyTypeValue.toString().trim().toLowerCase().contains(
              searchBy.toString().trim().toLowerCase(),
            ) ||
        (element.addressLandMark != null &&
            element.addressLandMark.toString().trim().toLowerCase().contains(
                  searchBy.toString().trim().toLowerCase(),
                )) ||
        (element.area != null &&
            element.area.toString().trim().toLowerCase().contains(
                  searchBy.toString().trim().toLowerCase(),
                )) ||
        (element.publicAddressLandMark != null &&
            element.publicAddressLandMark
                .toString()
                .trim()
                .toLowerCase()
                .contains(
                  searchBy.toString().trim().toLowerCase(),
                )) ||
        (element.publicArea != null &&
            element.publicArea.toString().trim().toLowerCase().contains(
                  searchBy.toString().trim().toLowerCase(),
                )) ||
        (element.sellerName != null &&
            element.sellerName.toString().trim().toLowerCase().contains(
                  searchBy.toString().trim().toLowerCase(),
                )) ||
        (element.brooonName != null &&
            element.brooonName.toString().trim().toLowerCase().contains(
                  searchBy.toString().trim().toLowerCase(),
                )) ||
        (element.propertyForValues != null &&
            element.propertyForValues!.isNotEmpty &&
            element.propertyForValues!
                .where((element) => element
                    .toString()
                    .trim()
                    .toLowerCase()
                    .contains(searchBy.toString().trim().toLowerCase()))
                .isNotEmpty) ||
        (element.tags != null &&
            element.tags!.isNotEmpty &&
            element.tags!
                .where((element) => element
                    .toString()
                    .trim()
                    .toLowerCase()
                    .contains(searchBy.toString().trim().toLowerCase()))
                .isNotEmpty);
  }

  bool _compareForInquirySearch(DbSavedFilter element, String searchBy) {
    return element.filterName.toString().trim().toLowerCase().contains(
              searchBy.toString().trim().toLowerCase(),
            ) ||
        element.propertyTypeValues!.first
            .toString()
            .trim()
            .toLowerCase()
            .contains(
              searchBy.toString().trim().toLowerCase(),
            ) ||
        (element.location != null &&
            element.location.toString().trim().toLowerCase().contains(
                  searchBy.toString().trim().toLowerCase(),
                )) ||
        (element.area != null &&
            element.area.toString().trim().toLowerCase().contains(
                  searchBy.toString().trim().toLowerCase(),
                )) ||
        (element.buyerName.toString().trim().toLowerCase().contains(
              searchBy.toString().trim().toLowerCase(),
            )) ||
        (element.propertyForValues != null &&
            element.propertyForValues!.isNotEmpty &&
            element.propertyForValues!
                .where((element) => element
                    .toString()
                    .trim()
                    .toLowerCase()
                    .contains(searchBy.toString().trim().toLowerCase()))
                .isNotEmpty);
  }

  searchByProperties(String searchBy) async {
    if (searchBy.trim().isNotEmpty) {
      _updateLoadMorePullToRefreshForBrooonProperties(isDisabled: true);
    } else {
      _updateLoadMorePullToRefreshForBrooonProperties();
    }
    _filterMyPropertyList.clear();
    _filterPropertyFromNetworkList.clear();
    if (searchBy.toString().trim().isEmpty) {
      _filterMyPropertyList.addAll(_myPropertyList);
      _filterPropertyFromNetworkList.addAll(_propertyFromNetworkList);
    } else {
      _filterMyPropertyList.addAll(
        _myPropertyList.where(
          (element) {
            return _compareForPropertySearch(
              element,
              searchBy,
            );
          },
        ),
      );

      _filterPropertyFromNetworkList.addAll(
        _propertyFromNetworkList.where(
          (element) {
            return _compareForPropertySearch(
              element,
              searchBy,
            );
          },
        ),
      );
    }
    _myPropertiesCount = _filterMyPropertyList.length;
    await _updateSharedByPropertyCounts(
      searchBy: searchBy,
    );
    notifyListeners();
    if (showDataFor == ViewAllFromType.searchList) {
      if (debounceSearchProperties?.isActive ?? false) {
        debounceSearchProperties?.cancel();
      }
      debounceSearchProperties = Timer(
        const Duration(
          milliseconds: 1000,
        ),
        () {
          refreshMarkers();
        },
      );
    }
  }

  searchByInquires(String searchBy) async {
    if (searchBy.trim().isNotEmpty) {
      _updateLoadMorePullToRefreshForBrooonInquiries(isDisabled: true);
    } else {
      _updateLoadMorePullToRefreshForBrooonInquiries();
    }
    _filterMyInquiriesList.clear();
    _filterInquiryFromNetworkList.clear();
    if (searchBy.toString().trim().isEmpty) {
      _filterMyInquiriesList.addAll(_myInquiriesList);
      _filterInquiryFromNetworkList.addAll(_inquiryFromNetworkList);
    } else {
      _filterMyInquiriesList.addAll(
        _myInquiriesList.where(
          (element) {
            return _compareForInquirySearch(
              element,
              searchBy,
            );
          },
        ),
      );

      _filterInquiryFromNetworkList.addAll(
        _inquiryFromNetworkList.where(
          (element) {
            return _compareForInquirySearch(
              element,
              searchBy,
            );
          },
        ),
      );
    }
    _myInquiriesCount = _filterMyInquiriesList.length;
    await _updateSharedByInquiryCounts(
      searchBy: searchBy,
    );
    notifyListeners();
    if (showDataFor == ViewAllFromType.searchList) {
      if (debounceSearchInquiries?.isActive ?? false) {
        debounceSearchInquiries?.cancel();
      }
      debounceSearchInquiries = Timer(
        const Duration(
          milliseconds: 1000,
        ),
        () {
          // TODO - we don't sure whether we will have map screen for inquiry as well!
          // refreshMarkers();
        },
      );
    }
  }

  _refreshPropertyInfo(DbProperty property) async {
    String? originalCustomerName = property.closedDealBuyerName;
    String? originalCustomerPhone = property.closedDealBuyerPhoneNo;
    propertyStreamSubscription?.cancel();
    final onPropertyChanges = await _isarService.watchOnPropertyUpdate(
      property.id,
    );
    propertyStreamSubscription = onPropertyChanges.listen(
      (event) async {
        final updatedPropertyInfo = await _isarService.getPropertyById(
          property.id,
        );
        if (updatedPropertyInfo != null) {
          int index = _myPropertyList.indexWhere(
            (element) => element.id == property.id,
          );
          if (index != (-1)) {
            // update info
            if (showDataFor == ViewAllFromType.matches) {
              if (inquiryToMatch != null) {
                if (updatedPropertyInfo.unmatchInquiries
                    .contains(inquiryToMatch!.inquiryId!)) {
                  _myPropertyList.removeAt(index);
                  int filterIndex = _filterMyPropertyList.indexWhere(
                    (element) => element.id == property.id,
                  );
                  if (filterIndex != (-1)) {
                    _filterMyPropertyList.removeAt(filterIndex);
                  }
                  _myPropertiesCount = _myPropertyList.length;
                  notifyListeners();
                  return;
                }
              }
            }
            _myPropertyList[index] = updatedPropertyInfo;
            int filterIndex = _filterMyPropertyList.indexWhere(
              (element) => element.id == property.id,
            );
            if (filterIndex != (-1)) {
              _filterMyPropertyList[index] = updatedPropertyInfo;
            }
            if (showDataFor == ViewAllFromType.inActives) {
              if (updatedPropertyInfo.propertySoldStatusId ==
                      SaveDefaultData.soldStatusId ||
                  updatedPropertyInfo.propertyStatusId ==
                      SaveDefaultData.activeStatusId) {
                _removePropertyForSoldUnSoldStatus(
                  index,
                  filterIndex,
                  updatedPropertyInfo,
                );
              }
            } else if (showDataFor == ViewAllFromType.sellers &&
                !AppConfig.showSellerListWithClosedProperties) {
              if (updatedPropertyInfo.propertySoldStatusId ==
                  SaveDefaultData.soldStatusId) {
                _removePropertyForSoldUnSoldStatus(
                  index,
                  filterIndex,
                  updatedPropertyInfo,
                );
              }
            } else if (showDataFor == ViewAllFromType.buyers) {
              if (updatedPropertyInfo.propertySoldStatusId ==
                      SaveDefaultData.soldStatusId ||
                  updatedPropertyInfo.propertyStatusId ==
                      SaveDefaultData.inActiveStatusId) {
                _removePropertyForSoldUnSoldStatus(
                  index,
                  filterIndex,
                  updatedPropertyInfo,
                );
              }
            } else if (showDataFor == ViewAllFromType.closedDeals) {
              if (updatedPropertyInfo.propertySoldStatusId ==
                  SaveDefaultData.unSoldStatusId) {
                _removePropertyForSoldUnSoldStatus(
                  index,
                  filterIndex,
                  updatedPropertyInfo,
                );
              }
            } else if (showDataFor == ViewAllFromType.brooonProperties ||
                showDataFor == ViewAllFromType.nearBy) {
              if (updatedPropertyInfo.propertyStatusId ==
                      SaveDefaultData.inActiveStatusId ||
                  updatedPropertyInfo.propertySoldStatusId ==
                      SaveDefaultData.soldStatusId) {
                _removePropertyForSoldUnSoldStatus(
                  index,
                  filterIndex,
                  updatedPropertyInfo,
                );
              }
            }
            notifyListeners();
          } else {
            if (showDataFor == ViewAllFromType.inActives) {
              if (updatedPropertyInfo.propertySoldStatusId ==
                      SaveDefaultData.unSoldStatusId &&
                  updatedPropertyInfo.propertyStatusId ==
                      SaveDefaultData.activeStatusId) {
                _addPropertyIfAlreadyRemovedForSoldUnSoldStatus(
                  updatedPropertyInfo,
                );
              }
            } else if (showDataFor == ViewAllFromType.sellers) {
              if (updatedPropertyInfo.propertySoldStatusId !=
                  SaveDefaultData.soldStatusId) {
                _addPropertyIfAlreadyRemovedForSoldUnSoldStatus(
                  updatedPropertyInfo,
                );
              }
            } else if (showDataFor == ViewAllFromType.buyers) {
              if (updatedPropertyInfo.propertySoldStatusId !=
                  SaveDefaultData.soldStatusId) {
                if ((originalCustomerName.toString().trim().toLowerCase() !=
                        updatedPropertyInfo.closedDealBuyerName
                            .toString()
                            .trim()
                            .toLowerCase()) ||
                    (originalCustomerPhone !=
                        updatedPropertyInfo.closedDealBuyerPhoneNo)) {
                  // Customer Detail changed
                  return;
                }
                _addPropertyIfAlreadyRemovedForSoldUnSoldStatus(
                  updatedPropertyInfo,
                );
              }
            } else if (showDataFor == ViewAllFromType.closedDeals) {
              if (updatedPropertyInfo.propertySoldStatusId !=
                  SaveDefaultData.unSoldStatusId) {
                _addPropertyIfAlreadyRemovedForSoldUnSoldStatus(
                  updatedPropertyInfo,
                );
              }
            }
          }
        } else {
          // handle deleted property
          _myPropertyList.removeWhere((element) => element.id == property.id);
          _filterMyPropertyList
              .removeWhere((element) => element.id == property.id);
          _myPropertiesCount = _myPropertiesCount - 1;
          notifyListeners();
        }
      },
    );
  }

  _refreshInquiryInfo(DbSavedFilter inquiry) async {
    String? originalCustomerName = inquiry.closedDealSellerName;
    String? originalCustomerPhone = inquiry.closedDealSellerPhoneNo;
    inquiryStreamSubscription?.cancel();
    final onInquiryChanges = await _isarService.watchOnFilterChanges(
      id: inquiry.id,
    );
    inquiryStreamSubscription = onInquiryChanges.listen(
      (event) async {
        final updatedInquiryInfo = await _isarService.getSavedFilterById(
          inquiry.id,
        );
        if (updatedInquiryInfo != null) {
          int index = _myInquiriesList.indexWhere(
            (element) => element.id == inquiry.id,
          );
          if (index != (-1)) {
            if (showDataFor == ViewAllFromType.matches) {
              if (propertyToMatch != null) {
                if (updatedInquiryInfo.unmatchProperties
                    .contains(propertyToMatch!.propertyId!)) {
                  _myInquiriesList.removeAt(index);
                  int filterIndex = _filterMyInquiriesList.indexWhere(
                    (element) => element.id == inquiry.id,
                  );
                  if (filterIndex != (-1)) {
                    _filterMyInquiriesList.removeAt(filterIndex);
                  }
                  _myInquiriesCount = _myInquiriesList.length;
                  notifyListeners();
                  return;
                }
              }
            }

            // update info
            _myInquiriesList[index] = updatedInquiryInfo;
            int filterIndex = _filterMyInquiriesList.indexWhere(
              (element) => element.id == inquiry.id,
            );
            if (filterIndex != (-1)) {
              _filterMyInquiriesList[index] = updatedInquiryInfo;
            }
            if (showDataFor == ViewAllFromType.inActives) {
              if (updatedInquiryInfo.inquirySoldStatusId ==
                      SaveDefaultData.soldStatusId ||
                  updatedInquiryInfo.inquiryStatusId ==
                      SaveDefaultData.activeStatusId) {
                _removeInquiryForSoldUnSoldStatus(
                  index,
                  filterIndex,
                  updatedInquiryInfo,
                );
              }
            } else if (showDataFor == ViewAllFromType.sellers) {
              if (updatedInquiryInfo.inquirySoldStatusId ==
                  SaveDefaultData.soldStatusId) {
                _removeInquiryForSoldUnSoldStatus(
                  index,
                  filterIndex,
                  updatedInquiryInfo,
                );
              }
            } else if (showDataFor == ViewAllFromType.buyers &&
                !AppConfig.showBuyerListWithClosedInquiries) {
              if (updatedInquiryInfo.inquirySoldStatusId ==
                      SaveDefaultData.soldStatusId ||
                  updatedInquiryInfo.inquiryStatusId ==
                      SaveDefaultData.inActiveStatusId) {
                _removeInquiryForSoldUnSoldStatus(
                  index,
                  filterIndex,
                  updatedInquiryInfo,
                );
              }
            } else if (showDataFor == ViewAllFromType.closedDeals) {
              if (updatedInquiryInfo.inquirySoldStatusId ==
                  SaveDefaultData.unSoldStatusId) {
                _removeInquiryForSoldUnSoldStatus(
                  index,
                  filterIndex,
                  updatedInquiryInfo,
                );
              }
            } else if (showDataFor == ViewAllFromType.brooonInquiries ||
                showDataFor == ViewAllFromType.nearBy) {
              if (updatedInquiryInfo.inquiryStatusId ==
                      SaveDefaultData.inActiveStatusId ||
                  updatedInquiryInfo.inquirySoldStatusId ==
                      SaveDefaultData.soldStatusId) {
                _removeInquiryForSoldUnSoldStatus(
                  index,
                  filterIndex,
                  updatedInquiryInfo,
                );
              }
            }
            notifyListeners();
          } else {
            if (showDataFor == ViewAllFromType.inActives) {
              if (updatedInquiryInfo.inquirySoldStatusId ==
                      SaveDefaultData.unSoldStatusId &&
                  updatedInquiryInfo.inquiryStatusId ==
                      SaveDefaultData.activeStatusId) {
                _addInquiryIfAlreadyRemovedForSoldUnSoldStatus(
                  updatedInquiryInfo,
                );
              }
            } else if (showDataFor == ViewAllFromType.sellers) {
              if (updatedInquiryInfo.inquirySoldStatusId !=
                  SaveDefaultData.soldStatusId) {
                _addInquiryIfAlreadyRemovedForSoldUnSoldStatus(
                  updatedInquiryInfo,
                );
              }
            } else if (showDataFor == ViewAllFromType.buyers) {
              if (updatedInquiryInfo.inquirySoldStatusId !=
                  SaveDefaultData.soldStatusId) {
                if ((originalCustomerName.toString().trim().toLowerCase() !=
                        updatedInquiryInfo.closedDealSellerName
                            .toString()
                            .trim()
                            .toLowerCase()) ||
                    (originalCustomerPhone !=
                        updatedInquiryInfo.closedDealSellerPhoneNo)) {
                  // Customer Detail changed
                  return;
                }
                _addInquiryIfAlreadyRemovedForSoldUnSoldStatus(
                  updatedInquiryInfo,
                );
              }
            } else if (showDataFor == ViewAllFromType.closedDeals) {
              if (updatedInquiryInfo.inquirySoldStatusId !=
                  SaveDefaultData.unSoldStatusId) {
                _addInquiryIfAlreadyRemovedForSoldUnSoldStatus(
                  updatedInquiryInfo,
                );
              }
            }
          }
        } else {
          // handle deleted inquiry
          _myInquiriesList.removeWhere((element) => element.id == inquiry.id);
          _filterMyInquiriesList
              .removeWhere((element) => element.id == inquiry.id);
          _myInquiriesCount = _myInquiriesCount - 1;
          notifyListeners();
        }
      },
    );
  }

  _removePropertyForSoldUnSoldStatus(
    int index,
    int filterIndex,
    DbProperty property,
  ) {
    if (index != (-1)) {
      _myPropertyList.removeAt(index);
    }
    if (filterIndex != (-1)) {
      _filterMyPropertyList.removeAt(filterIndex);
    }
    if (_propertyTypeIds != null && _propertyTypeIds!.isNotEmpty) {
      _propertyTypeIds!.removeWhere(
        (element) => element == property.id,
      );
    }
    _myPropertiesCount = _myPropertiesCount - 1;
  }

  _removeInquiryForSoldUnSoldStatus(
    int index,
    int filterIndex,
    DbSavedFilter inquiry,
  ) {
    if (index != (-1)) {
      _myInquiriesList.removeAt(index);
    }
    if (filterIndex != (-1)) {
      _filterMyInquiriesList.removeAt(filterIndex);
    }
    if (_inquiryTypeIds != null && _inquiryTypeIds!.isNotEmpty) {
      _inquiryTypeIds!.removeWhere(
        (element) => element == inquiry.id,
      );
    }
    _myInquiriesCount = _myInquiriesCount - 1;
  }

  _addPropertyIfAlreadyRemovedForSoldUnSoldStatus(DbProperty property) {
    _myPropertyList.add(property);
    _filterMyPropertyList.add(property);
    _myPropertiesCount = _myPropertiesCount + 1;
    if (_propertyTypeIds == null) {
      _propertyTypeIds = [];
    }
    _propertyTypeIds!.add(property.id);
    if (_searchBy != null && _searchBy.toString().trim().isNotEmpty) {
      searchByProperties(_searchBy!);
    }
    notifyListeners();
  }

  _addInquiryIfAlreadyRemovedForSoldUnSoldStatus(DbSavedFilter property) {
    _myInquiriesList.add(property);
    _filterMyInquiriesList.add(property);
    _myInquiriesCount = _myInquiriesCount + 1;
    if (_inquiryTypeIds == null) {
      _inquiryTypeIds = [];
    }
    _inquiryTypeIds!.add(property.id);
    if (_searchBy != null && _searchBy.toString().trim().isNotEmpty) {
      searchByInquires(_searchBy!);
    }
    notifyListeners();
  }

  updatePropertyVisualType(PropertyVisualType value) {
    if (_propertyVisualType != value) {
      _propertyVisualType = value;
      viewModeSwitcherController.animateToPage(
        _propertyVisualType == PropertyVisualType.map ? 1 : 0,
        duration: const Duration(
          milliseconds: 200,
        ),
        curve: Curves.easeIn,
      );
      notifyListeners();
    }
  }

  Future<void> refreshMarkers() async {
    _propertyMapList = [];
    _propertyMapList.addAll(
      _filterMyPropertyList.where(
        (element) =>
            element.latitude != null &&
            element.longitude != null &&
            element.latitude != 0 &&
            element.longitude != 0,
      ),
    );

    // reset selected flag
    if (_propertyMapList.isNotEmpty) {
      for (int i = 0; i < _propertyMapList.length; i++) {
        _propertyMapList[i].isSelected = false;
      }
    }

    // reset symbols
    if (mapController?.symbolManager != null) {
      await mapController?.clearSymbols();
      _selectedMapProperty = null;
      notifyListeners();
    }

    if (_propertyMapList.isNotEmpty && mapController != null) {
      if (userInfo != null) {
        final property = getNearestDistanceProperty(
          LatLng(
            AppConfig.enableNearByRealTimeFeature
                ? (userInfo!.liveLatitude ?? userInfo!.latitude!)
                : userInfo!.latitude!,
            AppConfig.enableNearByRealTimeFeature
                ? (userInfo!.liveLongitude ?? userInfo!.longitude!)
                : userInfo!.longitude!,
          ),
        );
        if (property != null) {
          final index = _propertyMapList
              .indexWhere((element) => element.id == property.id);
          if (index != (-1)) {
            _propertyMapList[index].isSelected = true;
          }
        }
      }
      final mapProperty = _propertyMapList.firstWhereOrNull(
        (element) => element.isSelected,
      );
      if (mapProperty != null) {
        _selectedMapProperty = mapProperty;
        notifyListeners();
        mapController?.animateCamera(
          // offset to move camera upper side to show marker properly visible to user
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(
                // offset to move camera upper side to show marker properly visible to user
                mapProperty.latitude! - AppConfig.scrollToTopCenterOffset,
                mapProperty.longitude!,
              ),
              zoom: AppConfig.defaultZoomProperty,
              bearing: 0,
            ),
          ),
        );
      }
      Future.delayed(
        const Duration(milliseconds: 100),
        () async {
          // To prevent hide symbol on zoom out.
          // below should lines be need to add when symbol is added in map
          await mapController?.symbolManager?.setIconAllowOverlap(true);
          await mapController?.symbolManager?.setIconIgnorePlacement(true);
          // ---------------------------------------------------------------
          _propertyMapList.forEach(
            (element) async {
              _propertyMapList[_propertyMapList.indexOf(element)].marker =
                  await mapController?.addSymbol(
                _generateSymbolOption(
                  iconSize: !element.isSelected ? 0.8 : 0.7,
                  iconImage: element.isSelected
                      ? Strings.iconMarker
                      : Strings.iconDarkMarker,
                  position: LatLng(element.latitude!, element.longitude!),
                ),
              );
            },
          );
        },
      );
    }
  }

  Future<void> replaceMarker(Symbol clickedSymbol) async {
    final markerToReplaceIndex = _propertyMapList.indexWhere(
      (element) => element.isSelected,
    );
    if (markerToReplaceIndex != (-1)) {
      _propertyMapList[markerToReplaceIndex].isSelected = false;
      DbProperty markerToReplace = _propertyMapList[markerToReplaceIndex];
      final newMarkerIndex = _propertyMapList.indexWhere(
        (element) =>
            (element.latitude == clickedSymbol.options.geometry?.latitude &&
                element.longitude == clickedSymbol.options.geometry?.longitude),
      );
      _propertyMapList[newMarkerIndex].isSelected = true;
      DbProperty newMarker = _propertyMapList[newMarkerIndex];
      if (markerToReplace.id != newMarker.id) {
        mapController?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(
                // offset to move camera upper side to show marker properly visible to user
                newMarker.latitude! - AppConfig.scrollToTopCenterOffset,
                newMarker.longitude!,
              ),
              zoom: AppConfig.defaultZoomProperty,
              bearing: 0,
            ),
          ),
        );

        if (markerToReplace.marker != null) {
          SymbolOptions markerOptionToUpdate = _generateSymbolOption(
            iconSize: 0.8,
            iconImage: Strings.iconDarkMarker,
            position: LatLng(
              markerToReplace.latitude!,
              markerToReplace.longitude!,
            ),
          );
          await mapController?.updateSymbol(
            markerToReplace.marker!,
            markerOptionToUpdate,
          );
          _propertyMapList[_propertyMapList.indexOf(markerToReplace)]
              .marker!
              .options = markerOptionToUpdate;
        }
        if (newMarker.marker != null) {
          SymbolOptions markerOptionToUpdate = _generateSymbolOption(
            iconSize: 0.7,
            iconImage: Strings.iconMarker,
            position: LatLng(
              newMarker.latitude!,
              newMarker.longitude!,
            ),
          );
          await mapController?.updateSymbol(
            newMarker.marker!,
            markerOptionToUpdate,
          );
          _propertyMapList[_propertyMapList.indexOf(newMarker)]
              .marker!
              .options = markerOptionToUpdate;
        }
        if (_selectedMapProperty?.id != newMarker.id) {
          _selectedMapProperty = newMarker;
          notifyListeners();
        }
      }
    }
  }

  SymbolOptions _generateSymbolOption({
    required double iconSize,
    required String iconImage,
    required LatLng? position,
  }) {
    SymbolOptions symbolOptions = SymbolOptions(
      iconSize: iconSize,
      iconImage: iconImage,
      geometry: position,
      iconOffset: Offset.zero,
    );
    return symbolOptions;
  }

  DbProperty? getNearestDistanceProperty(LatLng positionToMatch) {
    if (_propertyMapList.isNotEmpty) {
      double distance = -1;
      DbProperty? nearestProperty;
      debugPrint('property latitude longitude: ${positionToMatch.latitude} '
          '${positionToMatch.longitude}');
      _propertyMapList.forEach(
        (element) {
          debugPrint('property latitude longitude: ${element.latitude!} '
              '${element.longitude!}');
          final distanceInMeter = Geolocator.distanceBetween(
            element.latitude!,
            element.longitude!,
            positionToMatch.latitude,
            positionToMatch.longitude,
          );
          debugPrint('Distance Between: $distanceInMeter');
          if (distance == (-1) || distanceInMeter < distance) {
            distance = distanceInMeter;
            nearestProperty = element;
          }
        },
      );
      return nearestProperty;
    }
    return null;
  }

  openSubscriptionScreen(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routes.subscription,
      arguments: ChoosePlanFrom.propertyFromNetwork,
    );
  }

  onMatchingPropertyClicked(DbProperty selectedProperty) {
    _refreshPropertyInfo(selectedProperty);
  }

  onMatchingInquiryClicked(DbSavedFilter inquiry) {
    _refreshInquiryInfo(inquiry);
  }

  openPropertyDetailScreen(
    BuildContext context,
    DbProperty selectedProperty,
  ) {
    StaticFunctions.unFocusKeyboardIfAny(context);
    _refreshPropertyInfo(selectedProperty);
    Navigator.of(context).pushNamed(
      Routes.propertyDetail,
      arguments: selectedProperty,
    );
  }

  openInquiryDetailScreen(
    BuildContext context,
    DbSavedFilter selectedInquiry,
  ) {
    StaticFunctions.unFocusKeyboardIfAny(context);
    _refreshInquiryInfo(selectedInquiry);
    Navigator.of(context).pushNamed(
      Routes.inquiryDetail,
      arguments: selectedInquiry,
    );
  }

  _sharedByBrooonersPropertiesWatcher(BuildContext context) async {
    // Added watcher for not subscribed user as
    // If user is subscribing then at that time
    // property is retrieving from server to DB and same time need to refresh screen!
    if (!StaticFunctions.isSubScribedUser) {
      final onPropertyChanges = await _isarService.watchOnPropertySave();
      _propertyInfoListener = onPropertyChanges.listen(
        (event) async {
          if (StaticFunctions.isSubScribedUser &&
              _propertyFromNetworkList.isNotEmpty) {
            _propertyInfoListener?.cancel();
            return;
          }
          _getPropertiesFromNetwork(context);
        },
      );
    } else {
      _propertyInfoListener?.cancel();
    }
  }

  _sharedByBrooonersInquiriesWatcher(BuildContext context) async {
    // Added watcher for not subscribed user as
    // If user is subscribing then at that time
    // inquiry is retrieving from server to DB and same time need to refresh screen!
    if (!StaticFunctions.isSubScribedUser) {
      final onInquiryChanges = await _isarService.watchOnFilterChanges();
      _inquiryInfoListener = onInquiryChanges.listen(
        (event) async {
          if (StaticFunctions.isSubScribedUser &&
              _inquiryFromNetworkList.isNotEmpty) {
            _inquiryInfoListener?.cancel();
            return;
          }
          _getInquiriesFromNetwork(context);
        },
      );
    } else {
      _inquiryInfoListener?.cancel();
    }
  }

  Future<List<DbProperty>> _callApiToFindMatchingProperties() async {
    List<DbProperty> newBrooonProperties = [];
    if (buyerSellerInfo != null) {
      final list = await MatchingQuery.getMatchingBrooonProperties(
        localizationsContext,
        [buyerSellerInfo!],
      );
      if (list != null && list.isNotEmpty) {
        newBrooonProperties.clear();
        for (int l = 0; l < list.length; l++) {
          if (list[l].properties != null) {
            newBrooonProperties.addAll(list[l].properties!);
          }
        }
      }
    }
    return newBrooonProperties;
  }

  fetchSharedByBrooonersProperty(
    BuildContext context, {
    bool checkForFilterBySearch = false,
    bool isRetryClicked = false,
  }) async {
    _isLoadingPropertyData = false;
    if (mounted) {
      notifyListeners();
    }
    List<DbProperty>? newBrooonProperties;
    if (tabVisibilityType ==
        ViewAllTabsVisibilityType.fromBuyersMatchingProperties) {
      newBrooonProperties = [];
      if (isNeedToCallApiForMatchingBrooonItems) {
        // call API and find matching properties
        newBrooonProperties = await _callApiToFindMatchingProperties();
      } else {
        newBrooonProperties =
            _commonPropertyDataProvider?.brooonMatchingProperties;
        if (isRetryClicked &&
            (newBrooonProperties == null || newBrooonProperties.isEmpty)) {
          if (buyerSellerInfo != null) {
            final properties = buyerSellerInfo!.properties;
            if (properties != null) {
              final data = properties
                  .where(
                    (element) => element.sharedByBrooon,
                  )
                  .toList();
              _commonPropertyDataProvider?.setBrooonMatchingProperties(data);
            } else {
              _commonPropertyDataProvider?.setBrooonMatchingProperties([]);
            }
          }
        }
      }
    } else {
      newBrooonProperties =
          await _commonPropertyDataProvider?.fetchSharedByBrooonersProperties(
        localizationsContext: localizationsContext,
        filter: checkForFilterBySearch
            ? (_filterForSearchProperties() ? filterObj : null)
            : filterObj,
        propertyTypeId: filterObj == null ? _propertyTypeId : null,
        limit: AppConfig.viewAllPaginationPerPageLimit,
      );
    }
    if (newBrooonProperties != null && newBrooonProperties.isNotEmpty) {
      _propertyFromNetworkList.clear();
      _filterPropertyFromNetworkList.clear();
      _propertyFromNetworkList.addAll(newBrooonProperties);
      _filterPropertyFromNetworkList.addAll(newBrooonProperties);
      await _updateSharedByPropertyCounts(
        needToCheckForViewAll: true,
      );
      if (showDataFor == ViewAllFromType.searchList &&
          _searchBy != null &&
          _searchBy.toString().trim().isNotEmpty) {
        searchByProperties(_searchBy!);
      } else if (showDataFor != ViewAllFromType.searchList &&
          searchFieldTextController.text.trim().isNotEmpty) {
        searchByProperties(searchFieldTextController.text);
      }
      if (mounted) {
        notifyListeners();
      }
    }
  }

  fetchSharedByBrooonersInquiry(
    BuildContext context, {
    bool checkForFilterBySearch = false,
    bool isRetryClicked: false,
  }) async {
    _isLoadingInquiryData = false;
    if (mounted) {
      notifyListeners();
    }

    List<DbSavedFilter>? newBrooonInquiries;
    if (tabVisibilityType ==
        ViewAllTabsVisibilityType.fromSellersMatchingInquiries) {
      newBrooonInquiries = _commonPropertyDataProvider?.brooonMatchingInquiries;
      if (isRetryClicked &&
          (newBrooonInquiries == null || newBrooonInquiries.isEmpty)) {
        newBrooonInquiries = [];
        if (buyerSellerInfo != null) {
          final inquiries = buyerSellerInfo!.inquiries;
          if (inquiries != null) {
            final data = inquiries
                .where(
                  (element) => element.sharedByBrooon,
                )
                .toList();
            _commonPropertyDataProvider?.setBrooonMatchingInquiries(data);
          } else {
            _commonPropertyDataProvider?.setBrooonMatchingInquiries([]);
          }
        }
      }
    } else {
      newBrooonInquiries =
          await _commonPropertyDataProvider?.fetchSharedByBrooonersInquiries(
        localizationsContext: localizationsContext,
        filter: checkForFilterBySearch
            ? (_filterForSearchInquiries() ? filterObj : null)
            : filterObj,
        propertyTypeId: filterObj == null ? _propertyTypeId : null,
        limit: AppConfig.viewAllPaginationPerPageLimit,
      );
    }

    if (newBrooonInquiries != null && newBrooonInquiries.isNotEmpty) {
      _inquiryFromNetworkList.clear();
      _filterInquiryFromNetworkList.clear();
      _inquiryFromNetworkList.addAll(newBrooonInquiries);
      _filterInquiryFromNetworkList.addAll(newBrooonInquiries);
      await _updateSharedByInquiryCounts(
        needToCheckForViewAll: true,
      );
      if (showDataFor == ViewAllFromType.searchList &&
          _searchBy != null &&
          _searchBy.toString().trim().isNotEmpty) {
        searchByInquires(_searchBy!);
      } else if (showDataFor != ViewAllFromType.searchList &&
          searchFieldTextController.text.trim().isNotEmpty) {
        searchByInquires(searchFieldTextController.text);
      }
      if (mounted) {
        notifyListeners();
      }
    }
  }

  Future<bool> _loadMorePropertiesSharedByBroooners() async {
    final brooonPropertyInfo =
        await _isarService.getBrooonPropertiesCountSchema();
    if (brooonPropertyInfo?.currentPage != null &&
        brooonPropertyInfo?.totalPages != null) {
      // check if next page is available
      if (brooonPropertyInfo!.totalPages! > brooonPropertyInfo.currentPage!) {
        _hasMorePropertyData = true;
        if (mounted) {
          notifyListeners();
        }
        final newBrooonProperties =
            await _commonPropertyDataProvider?.fetchSharedByBrooonersProperties(
          page: brooonPropertyInfo.currentPage! + 1,
          localizationsContext: localizationsContext,
          filter: filterObj,
          propertyTypeId: filterObj == null ? _propertyTypeId : null,
          limit: AppConfig.viewAllPaginationPerPageLimit,
        );
        if (newBrooonProperties != null && newBrooonProperties.isNotEmpty) {
          _propertyFromNetworkList.addAll(newBrooonProperties);
          _filterPropertyFromNetworkList.addAll(newBrooonProperties);
          await _updateSharedByPropertyCounts(
            needToCheckForViewAll: true,
          );
          if (mounted) {
            notifyListeners();
          }
          return true;
        }
      }
    }
    return false;
  }

  Future<bool> _loadMoreInquiriesSharedByBroooners() async {
    final brooonInquiryInfo =
        await _isarService.getBrooonInquiriesCountSchema();
    if (brooonInquiryInfo?.currentPage != null &&
        brooonInquiryInfo?.totalPages != null) {
      // check if next page is available
      if (brooonInquiryInfo!.totalPages! > brooonInquiryInfo.currentPage!) {
        _hasMoreInquiryData = true;
        if (mounted) {
          notifyListeners();
        }
        final newBrooonInquiries =
            await _commonPropertyDataProvider?.fetchSharedByBrooonersInquiries(
          page: brooonInquiryInfo.currentPage! + 1,
          localizationsContext: localizationsContext,
          filter: filterObj,
          propertyTypeId: filterObj == null ? _propertyTypeId : null,
          limit: AppConfig.viewAllPaginationPerPageLimit,
        );
        if (newBrooonInquiries != null && newBrooonInquiries.isNotEmpty) {
          _inquiryFromNetworkList.addAll(newBrooonInquiries);
          _filterInquiryFromNetworkList.addAll(newBrooonInquiries);
          await _updateSharedByInquiryCounts(
            needToCheckForViewAll: true,
          );
          if (mounted) {
            notifyListeners();
          }
          return true;
        }
      }
    }
    return false;
  }

  loadMoreSharedByBrooonProperties() async {
    if (_isLoadingPropertyData) return;
    _isLoadingPropertyData = true;
    _hasMorePropertyData = true;
    // load more item here.
    // Ref. https://www.youtube.com/watch?v=eENDlIgadr4
    final isApiCallSuccess = await _loadMorePropertiesSharedByBroooners();
    _isLoadingPropertyData = false;
    if (isApiCallSuccess) {
      _hasMorePropertyData = await _hasMoreSharedByBrooonProperties();
    } else {
      _hasMorePropertyData = false;
    }
    if (mounted) {
      notifyListeners();
    }
  }

  loadMoreSharedByBrooonInquiries() async {
    if (_isLoadingInquiryData) return;
    _isLoadingInquiryData = true;
    _hasMoreInquiryData = true;
    // load more item here.
    // Ref. https://www.youtube.com/watch?v=eENDlIgadr4
    final isApiCallSuccess = await _loadMoreInquiriesSharedByBroooners();
    _isLoadingInquiryData = false;
    if (isApiCallSuccess) {
      _hasMoreInquiryData = await _hasMoreSharedByBrooonInquiries();
    } else {
      _hasMoreInquiryData = false;
    }
    if (mounted) {
      notifyListeners();
    }
  }

  Future<bool> _hasMoreSharedByBrooonProperties() async {
    final brooonPropertyInfo =
        await _isarService.getBrooonPropertiesCountSchema();
    if (brooonPropertyInfo?.currentPage != null &&
        brooonPropertyInfo?.totalPages != null) {
      return brooonPropertyInfo!.totalPages! != brooonPropertyInfo.currentPage!;
    }
    return false;
  }

  Future<bool> _hasMoreSharedByBrooonInquiries() async {
    final brooonInquiryInfo =
        await _isarService.getBrooonInquiriesCountSchema();
    if (brooonInquiryInfo?.currentPage != null &&
        brooonInquiryInfo?.totalPages != null) {
      return brooonInquiryInfo!.totalPages! != brooonInquiryInfo.currentPage!;
    }
    return false;
  }

  openAddPropertyScreen(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routes.addProperty,
      arguments: AddPropertyArgs(
        addPropertyEnums: AddPropertyEnums.add,
        propertyId: -1,
        propertyTypeId: _propertyTypeId,
      ),
    );
  }

  openAddInquiryScreen(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routes.addBuyer,
      arguments: AddBuyerArgs(
        inquiryEnum: InquiryEnums.add,
        inquiryId: -1,
        propertyTypeId: _propertyTypeId,
      ),
    );
  }

  bool checkForTabVisibility({required tabId}) {
    if (tabVisibilityType ==
        ViewAllTabsVisibilityType.fromAddPropertyInquiryWithFilter) {
      // DON'T MERGE this condition with others
      // This will be show only my properties or my inquiries based on filter applied
      // ORIGIN Route will be from ADD PROPERTY / ADD INQUIRY
      // While inside this condition - filter must be there.
      final isInquiryFilter = filterObj!.filterSearchBy!
          .contains(SaveDefaultData.filterSearchByInquiriesId);
      final isPropertyFilter = filterObj!.filterSearchBy!
          .contains(SaveDefaultData.filterSearchByPropertiesId);
      _isBrooonPropertiesTabVisible = false;
      _isBrooonInquiriesTabVisible = false;
      if (isInquiryFilter && !isPropertyFilter) {
        if (_selectedTabId == _unknownTabId) {
          _selectedTabId = myInquiryTabId;
        }
        _isSingleTabVisible = true;
        _isMyInquiriesTabVisible = true;
        _isMyPropertiesTabVisible = false;
        return tabId == myInquiryTabId;
      } else if (isPropertyFilter && !isInquiryFilter) {
        if (_selectedTabId == _unknownTabId) {
          _selectedTabId = myPropertyTabId;
        }
        _isSingleTabVisible = true;
        _isMyInquiriesTabVisible = false;
        _isMyPropertiesTabVisible = true;
        return tabId == myPropertyTabId;
      } else if (isInquiryFilter && isPropertyFilter) {
        _isMyInquiriesTabVisible = true;
        _isMyPropertiesTabVisible = true;
        return tabId == myPropertyTabId || tabId == myInquiryTabId;
      }
    } else if (tabVisibilityType ==
            ViewAllTabsVisibilityType.fromHomeSearchByTyping ||
        tabVisibilityType ==
            ViewAllTabsVisibilityType.fromPropertiesInquiriesBothFilter) {
      // All tabs need to show
      if (_selectedTabId == _unknownTabId) {
        _selectedTabId = myPropertyTabId;
      }
      _isSingleTabVisible = false;
      _isMyPropertiesTabVisible = true;
      _isBrooonPropertiesTabVisible = true;
      _isMyInquiriesTabVisible = true;
      _isBrooonInquiriesTabVisible = true;
      return tabId == myPropertyTabId ||
          tabId == myInquiryTabId ||
          tabId == brooonPropertyTabId ||
          tabId == brooonInquiryTabId;
    } else if (tabVisibilityType ==
            ViewAllTabsVisibilityType.fromPropertiesFilter ||
        tabVisibilityType ==
            ViewAllTabsVisibilityType.fromHomeViewAllMyProperties ||
        tabVisibilityType == ViewAllTabsVisibilityType.fromHomePropertiesType ||
        tabVisibilityType == ViewAllTabsVisibilityType.fromDrawerProperties ||
        tabVisibilityType ==
            ViewAllTabsVisibilityType.fromBuyersMatchingProperties ||
        tabVisibilityType == ViewAllTabsVisibilityType.fromAddInquiries) {
      // From Add Inquiries -> matching properties need to show
      // Only my properties and brooon properties need to show
      if (_selectedTabId == _unknownTabId) {
        _selectedTabId = myPropertyTabId;
      }
      _isSingleTabVisible = false;
      _isMyPropertiesTabVisible = true;
      _isBrooonPropertiesTabVisible = true;
      _isMyInquiriesTabVisible = false;
      _isBrooonInquiriesTabVisible = false;
      return tabId == myPropertyTabId || tabId == brooonPropertyTabId;
    } else if (tabVisibilityType ==
            ViewAllTabsVisibilityType.fromInquiriesFilter ||
        tabVisibilityType ==
            ViewAllTabsVisibilityType.fromHomeViewAllMyInquiries ||
        tabVisibilityType == ViewAllTabsVisibilityType.fromHomeInquiriesType ||
        tabVisibilityType == ViewAllTabsVisibilityType.fromDrawerInquiries ||
        tabVisibilityType ==
            ViewAllTabsVisibilityType.fromSellersMatchingInquiries) {
      // Only my inquiries and brooon inquiries need to show
      if (_selectedTabId == _unknownTabId) {
        _selectedTabId = myInquiryTabId;
      }
      _isSingleTabVisible = false;
      _isMyPropertiesTabVisible = false;
      _isBrooonPropertiesTabVisible = false;
      _isMyInquiriesTabVisible = true;
      _isBrooonInquiriesTabVisible = true;
      return tabId == myInquiryTabId || tabId == brooonInquiryTabId;
    } else if (tabVisibilityType ==
            ViewAllTabsVisibilityType.fromHomeViewAllBrooonProperties ||
        tabVisibilityType ==
            ViewAllTabsVisibilityType.fromPropertiesNotification) {
      // Only brooon properties need to show
      if (_selectedTabId == _unknownTabId) {
        _selectedTabId = brooonPropertyTabId;
      }
      _isSingleTabVisible = true;
      _isMyPropertiesTabVisible = false;
      _isBrooonPropertiesTabVisible = true;
      _isMyInquiriesTabVisible = false;
      _isBrooonInquiriesTabVisible = false;
      return tabId == brooonPropertyTabId;
    } else if (tabVisibilityType ==
            ViewAllTabsVisibilityType.fromHomeViewAllBrooonInquiries ||
        tabVisibilityType ==
            ViewAllTabsVisibilityType.fromInquiriesNotification) {
      // Only brooon inquiries need to show
      if (_selectedTabId == _unknownTabId) {
        _selectedTabId = brooonInquiryTabId;
      }
      _isSingleTabVisible = true;
      _isMyPropertiesTabVisible = false;
      _isBrooonPropertiesTabVisible = false;
      _isMyInquiriesTabVisible = false;
      _isBrooonInquiriesTabVisible = true;
      return tabId == brooonInquiryTabId;
    } else if (tabVisibilityType == ViewAllTabsVisibilityType.fromHomeNearBy ||
        tabVisibilityType == ViewAllTabsVisibilityType.fromDrawerInActives ||
        tabVisibilityType == ViewAllTabsVisibilityType.fromClosedDeals ||
        tabVisibilityType == ViewAllTabsVisibilityType.fromUnMatch ||
        tabVisibilityType == ViewAllTabsVisibilityType.fromFavorite) {
      // Only my properties and my inquiries need to show
      if (_selectedTabId == _unknownTabId) {
        _selectedTabId = myPropertyTabId;
      }
      _isSingleTabVisible = false;
      _isMyPropertiesTabVisible = true;
      _isBrooonPropertiesTabVisible = false;
      _isMyInquiriesTabVisible = true;
      _isBrooonInquiriesTabVisible = false;
      return tabId == myPropertyTabId || tabId == myInquiryTabId;
    } else if (tabVisibilityType ==
            ViewAllTabsVisibilityType.fromBuyersInquiries ||
        tabVisibilityType == ViewAllTabsVisibilityType.fromMatchingInquiries) {
      // only my inquiries need to show
      if (_selectedTabId == _unknownTabId) {
        _selectedTabId = myInquiryTabId;
      }
      _isSingleTabVisible = true;
      _isMyPropertiesTabVisible = false;
      _isBrooonPropertiesTabVisible = false;
      _isMyInquiriesTabVisible = true;
      _isBrooonInquiriesTabVisible = false;
      return tabId == myInquiryTabId;
    } else if (tabVisibilityType ==
            ViewAllTabsVisibilityType.fromSellersProperties ||
        tabVisibilityType == ViewAllTabsVisibilityType.fromAddProperties ||
        tabVisibilityType == ViewAllTabsVisibilityType.fromMatchingProperties) {
      // only my properties need to show
      if (_selectedTabId == _unknownTabId) {
        _selectedTabId = myPropertyTabId;
      }
      _isSingleTabVisible = true;
      _isMyPropertiesTabVisible = true;
      _isBrooonPropertiesTabVisible = false;
      _isMyInquiriesTabVisible = false;
      _isBrooonInquiriesTabVisible = false;
      return tabId == myPropertyTabId;
    }
    return false;
  }

  bool isFilterAllowed(ViewAllFromType? viewAllFrom) {
    return viewAllFrom != ViewAllFromType.searchList &&
        viewAllFrom != ViewAllFromType.buyers &&
        viewAllFrom != ViewAllFromType.sellers &&
        viewAllFrom != ViewAllFromType.nearBy &&
        viewAllFrom != ViewAllFromType.inActives &&
        viewAllFrom != ViewAllFromType.unMatches &&
        viewAllFrom != ViewAllFromType.matches &&
        viewAllFrom != ViewAllFromType.favorite &&
        viewAllFrom != ViewAllFromType.closedDeals;
  }

  onDispose() {
    mounted = false;
    filterWatcher?.cancel();
    _propertyInfoListener?.cancel();
    _inquiryInfoListener?.cancel();
    propertyStreamSubscription?.cancel();
    blockedBrooonerStreamSubscription?.cancel();
    viewModeSwitcherController.dispose();
    inquiryStreamSubscription?.cancel();
    tabPageController.dispose();
  }
}
