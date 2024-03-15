import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common_property_data_provider.dart';
import '../../const/routes.dart';
import '../../const/string_const.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/properties/db_property.dart';
import '../../localdb/properties/db_property_type.dart';
import '../../localdb/properties/db_saved_filter.dart';
import '../../localdb/save_default_data.dart';
import '../../localdb/user_info/db_user_info.dart';
import '../../main.dart';
import '../../network/dio_client.dart';
import '../../network/endpoints.dart';
import '../../utils/app_config.dart';
import '../../utils/app_privacy_helper.dart';
import '../../utils/choose_location_from_enum.dart';
import '../../utils/choose_plan_from_enum.dart';
import '../../utils/notification_helper.dart';
import '../../utils/static_functions.dart';
import '../../utils/subscription_utils.dart';
import '../../views/home/model/drawer_model.dart';
import '../../widgets/dialog_widget.dart';
import '../../widgets/snack_bar_view.dart';
import '../buyers_sellers/model/buyer_seller_enum.dart';
import '../filter/model/filter_screen_arg.dart';
import '../view_all_property/model/view_all_screen_arg.dart';

class HomeProvider extends ChangeNotifier {
  final _isarService = IsarService();
  late AppLocalizations localizationsContext;
  final List<DbPropertyType> propertyTypeList = [];
  final List<dynamic> nearByAllItemsList = [];
  final List<dynamic> nearByDisplayItemList = [];
  final List<dynamic> recentlyAddedList = [];
  Timer? _notificationTimer;
  int dashboardCountPagerIndex = 0;

  // To handle dashboard counts value when future is running
  final HashMap<int, MapEntry<int, int>> _propertiesCountHashMap = HashMap();
  final HashMap<int, MapEntry<int, int>> _inquiriesCountHashMap = HashMap();
  List<DrawerItem> drawerList = [];
  int _totalPropertyCounts = 0;
  int _totalInquiryCounts = 0;
  int _totalNotificationCounts = 0;
  int _sharedByBrooonPropertyCounts = 0;
  int _sharedByBrooonInquiryCounts = 0;
  int _nearByPropertyCounts = 0;
  DbUserInfo? userInfo;
  CommonPropertyDataProvider? _commonPropertyDataProvider;
  int _currentNearByRadius = -1;
  double? _currentLatitude = 0;
  double? _currentLongitude = 0;
  Timer? _nearByDebounce;

  int get totalPropertyCounts => _totalPropertyCounts;

  int get totalInquiryCounts => _totalInquiryCounts;

  int get totalNotificationCounts => _totalNotificationCounts;

  int get sharedByBrooonPropertyCounts => _sharedByBrooonPropertyCounts;

  int get sharedByBrooonInquiryCounts => _sharedByBrooonInquiryCounts;

  int get nearByPropertyCounts => _nearByPropertyCounts;

  StreamSubscription? _userInfoListener;
  StreamSubscription? _propertyInfoListener;
  StreamSubscription? blockedBrooonerStreamSubscription;
  StreamSubscription? _inquiryInfoListener;
  StreamSubscription? _notificationCountListener;
  bool mounted = true;
  late BuildContext _context;
  bool _hasMorePropertyData = false;
  bool _hasMoreInquiryData = false;
  bool _isLoadingPropertyData = false;
  bool _isLoadingInquiryData = false;
  bool isLocationServiceDisabledOnPause = false;

  init(
    BuildContext context,
    CommonPropertyDataProvider? commonProvider,
  ) async {
    mounted = true;
    _context = context;
    this.localizationsContext = AppLocalizations.of(context)!;
    _commonPropertyDataProvider = commonProvider;
    final list = await _isarService.getPropertyTypes();
    propertyTypeList.clear();
    propertyTypeList.addAll(list);
    checkForAppUpdate();
    _getUserInfo(isNeedToSetNearByFlags: true);
    _refreshUserInfo();
    _updateNotificationCounts();
    _updateTotalPropertyCounts();
    _updateTotalInquiryCounts();
    updateSharedByBrooonsPropertyList();
    updateSharedByBrooonsInquiryList();
    loadNearByList();
    loadRecentlyAddedList();
    _generateDrawerItems();
    _refreshPropertyInfo();
    _refreshInquiryInfo();
    _watchOnBlockedBroooners();
    _refreshNotificationCounts();
    _handleNotificationClick(context);
    _copyNoImagePreviewToFile();
    _checkAndUpdateSubscriptionStatus();
  }

  onDashboardCountPagerIndexChange(int index) {
    dashboardCountPagerIndex = index;
    if (mounted) {
      notifyListeners();
    }
  }

  checkForAppUpdate() async {
    if (kReleaseMode && Endpoints.baseURL == Endpoints.productionBaseUrl) {
      if (Platform.isAndroid) {
        try {
          InAppUpdate.checkForUpdate().then(
            (updateInfo) {
              if (updateInfo.updateAvailability ==
                  UpdateAvailability.updateAvailable) {
                if (updateInfo.immediateUpdateAllowed) {
                  // Perform immediate update
                  InAppUpdate.performImmediateUpdate().then(
                    (appUpdateResult) {
                      if (appUpdateResult == AppUpdateResult.success) {
                        debugPrint('successfully updated!');
                      } else if (appUpdateResult ==
                          AppUpdateResult.inAppUpdateFailed) {
                        debugPrint('failed to update!');
                        if (AppConfig.enableForceUpdateFeature) {
                          checkForAppUpdate();
                        }
                      } else if (appUpdateResult ==
                          AppUpdateResult.userDeniedUpdate) {
                        debugPrint('user denied to update!');
                        if (AppConfig.enableForceUpdateFeature) {
                          checkForAppUpdate();
                        }
                      }
                    },
                  );
                } else if (updateInfo.flexibleUpdateAllowed) {
                  //Perform flexible update
                  InAppUpdate.startFlexibleUpdate().then(
                    (appUpdateResult) {
                      if (appUpdateResult == AppUpdateResult.success) {
                        debugPrint('successfully updated!');
                        InAppUpdate.completeFlexibleUpdate();
                      } else if (appUpdateResult ==
                          AppUpdateResult.inAppUpdateFailed) {
                        debugPrint('failed to update!');
                        if (AppConfig.enableForceUpdateFeature) {
                          checkForAppUpdate();
                        }
                      } else if (appUpdateResult ==
                          AppUpdateResult.userDeniedUpdate) {
                        debugPrint('user denied to update!');
                        if (AppConfig.enableForceUpdateFeature) {
                          checkForAppUpdate();
                        }
                      }
                    },
                  );
                }
              }
            },
          );
        } on PlatformException catch (error) {
          debugPrint('$error');
        } on FormatException catch (error) {
          debugPrint('$error');
        } catch (error) {
          debugPrint('$error');
        }
      } else if (Platform.isIOS) {
        final response = await DioClient.appleApi().getAppVersionForIos(
          AppConfig.appBundleIdentifier,
        );
        if (response?.results != null && response!.results!.isNotEmpty) {
          final appStoreVersion = response.results![0].version;
          final appId = response.results![0].trackId;
          if (appStoreVersion != null && appStoreVersion.trim().isNotEmpty) {
            final splitAppStoreVersion = appStoreVersion.split('.');
            int? appStoreMajor, appStoreMinor, appStorePatch;
            int? currentAppMajor, currentAppMinor, currentAppPatch;
            if (splitAppStoreVersion.length == 3) {
              appStoreMajor = int.tryParse(splitAppStoreVersion[0]);
              appStoreMinor = int.tryParse(splitAppStoreVersion[1]);
              appStorePatch = int.tryParse(splitAppStoreVersion[2]);
            }
            if (appStoreMajor != null &&
                appStoreMinor != null &&
                appStorePatch != null) {
              final currentAppVersion = await StaticFunctions.getAppVersion();
              if (currentAppVersion.trim().isNotEmpty) {
                final splitCurrentAppVersion = currentAppVersion.split('.');
                if (splitCurrentAppVersion.length == 3) {
                  currentAppMajor = int.tryParse(splitCurrentAppVersion[0]);
                  currentAppMinor = int.tryParse(splitCurrentAppVersion[1]);
                  currentAppPatch = int.tryParse(splitCurrentAppVersion[2]);
                  if (currentAppMajor != null &&
                      currentAppMinor != null &&
                      currentAppPatch != null) {
                    // compare major / minor / patch versions
                    if (appStoreMajor > currentAppMajor) {
                      _showInAppUpdateDialog(appId);
                    } else if (appStoreMinor > currentAppMinor) {
                      _showInAppUpdateDialog(appId);
                    } else if (appStorePatch > currentAppPatch) {
                      _showInAppUpdateDialog(appId);
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  _generateDrawerItems() {
    drawerList = [
      /*DrawerItem(
        id: 1,
        icon: Strings.iconDrawerDashBoard,
        title: localizationsContext.drawerItemDashboard,
      ),*/
      /*DrawerItem(
        id: 2,
        icon: Strings.iconDrawerAddProperty,
        title: localizationsContext.drawerItemAddProperty,
      ),*/
      /*DrawerItem(
        id: 3,
        icon: Strings.iconDrawerAddInquiry,
        title: localizationsContext.drawerItemAddInquiry,
      ),*/
      DrawerItem(
        id: 4,
        icon: Strings.iconDrawerProperties,
        title: localizationsContext.drawerItemProperties,
      ),
      DrawerItem(
        id: 5,
        icon: Strings.iconDrawerSeller,
        title: localizationsContext.drawerItemSellers,
      ),
      DrawerItem(
        id: 6,
        icon: Strings.iconDrawerInquiries,
        title: localizationsContext.drawerItemInquiries,
      ),
      DrawerItem(
        id: 7,
        icon: Strings.iconDrawersBuyer,
        title: localizationsContext.drawerItemBuyers,
      ),
      DrawerItem(
        id: 8,
        icon: Strings.iconDrawerOther,
        title: localizationsContext.drawerItemOther,
      ),
      DrawerItem(
        id: 9,
        icon: Strings.iconDrawerReminder,
        title: localizationsContext.drawerItemReminder,
      ),
      DrawerItem(
        id: 10,
        icon: Strings.iconDrawerUnitConverter,
        title: localizationsContext.drawerItemUnitConverter,
      ),
      DrawerItem(
        id: 11,
        icon: Strings.iconDrawerBackup,
        title: localizationsContext.drawerItemBackup,
      ),
      DrawerItem(
        id: 12,
        icon: Strings.iconDrawerSettings,
        title: localizationsContext.drawerItemSettings,
      ),
      /*
      // TODO :-> uncomment when we have screen for legal advisory
      DrawerItem(
        id: 13,
        icon: Strings.iconDrawerLegalAdvisory,
        title: localizationsContext.drawerItemLegalAdvisory,
      ),*/
      if (AppConfig.enabledSubscriptionFeature)
        DrawerItem(
          id: 14,
          icon: Strings.iconDrawerSubscription,
          title: localizationsContext.subscription,
        ),
      DrawerItem(
        id: 15,
        icon: Strings.iconDrawerHelp,
        title: localizationsContext.drawerItemHelp,
      ),
      DrawerItem(
        id: 16,
        icon: Strings.iconDrawerFeedback,
        title: localizationsContext.drawerItemFeedback,
      ),
      DrawerItem(
        id: 17,
        icon: Strings.iconDrawerLogout,
        title: localizationsContext.drawerItemLogout,
      ),
    ];
  }

  openPropertyListScreen(
    BuildContext context,
    String heading,
    int count,
    ViewAllFromType type, {
    int? propertyTypeId = null,
    required ViewAllTabsVisibilityType viewAllFromToHandleTabs,
  }) {
    StaticFunctions.unFocusKeyboardIfAny(context);
    Navigator.pushNamed(
      context,
      Routes.viewAllProperties,
      arguments: ViewAllScreenArg(
        heading: heading,
        count: count,
        showDataFor: type,
        propertyTypeId: propertyTypeId,
        viewAllFromToHandleTabs: viewAllFromToHandleTabs,
      ),
    ).then(
      (dataTypesToRefreshOnBackPress) {
        //refresh home screen brooon data if any changes from view all screen because we are using same array list for both screen api calls. (currently we are refreshing data only if filter is applied in view all screen)
        _refreshBrooonFromViewAll(dataTypesToRefreshOnBackPress);
      },
    );
  }

  openInquiryListScreen(
    BuildContext context,
    String heading,
    int count,
    ViewAllFromType type, {
    int? propertyTypeId = null,
    required ViewAllTabsVisibilityType viewAllFromToHandleTabs,
  }) {
    StaticFunctions.unFocusKeyboardIfAny(context);
    Navigator.pushNamed(
      context,
      Routes.viewAllProperties,
      arguments: ViewAllScreenArg(
        heading: heading,
        count: count,
        showDataFor: type,
        propertyTypeId: propertyTypeId,
        viewAllFromToHandleTabs: viewAllFromToHandleTabs,
      ),
    ).then(
      (dataTypesToRefreshOnBackPress) {
        //refresh home screen brooon data if any changes from view all screen because we are using same array list for both screen api calls. (currently we are refreshing data only if filter is applied in view all screen)
        _refreshBrooonFromViewAll(dataTypesToRefreshOnBackPress);
      },
    );
  }

  _refreshBrooonFromViewAll(dataTypesToRefreshOnBackPress) {
    if (dataTypesToRefreshOnBackPress != null &&
        dataTypesToRefreshOnBackPress is List<int> &&
        dataTypesToRefreshOnBackPress.isNotEmpty) {
      if (dataTypesToRefreshOnBackPress
          .contains(SaveDefaultData.filterSearchByInquiriesId)) {
        updateSharedByBrooonsInquiryList();
      }
      if (dataTypesToRefreshOnBackPress
          .contains(SaveDefaultData.filterSearchByPropertiesId)) {
        updateSharedByBrooonsPropertyList();
      }
    }
    _updateSharedByPropertyCounts();
    _updateSharedByInquiryCounts();
  }

  Future<void> onDrawerItemSelected(
    BuildContext context,
    DrawerItem drawerItem,
  ) async {
    if (drawerItem.title == localizationsContext.drawerItemAddProperty) {
      openAddProperty();
    } else if (drawerItem.title == localizationsContext.drawerItemProperties) {
      openPropertyListScreen(
        context,
        localizationsContext.viewAllProperties,
        totalPropertyCounts,
        ViewAllFromType.properties,
        viewAllFromToHandleTabs: ViewAllTabsVisibilityType.fromDrawerProperties,
      );
    } else if (drawerItem.title == localizationsContext.drawerItemInquiries) {
      openPropertyListScreen(
        context,
        localizationsContext.viewAllInquiries,
        totalInquiryCounts,
        ViewAllFromType.properties,
        viewAllFromToHandleTabs: ViewAllTabsVisibilityType.fromDrawerInquiries,
      );
    } else if (drawerItem.title == localizationsContext.drawerItemSettings) {
      Navigator.pushNamed(context, Routes.settings);
    } else if (drawerItem.title == localizationsContext.drawerItemHelp) {
      Navigator.pushNamed(context, Routes.help);
    } else if (drawerItem.title == localizationsContext.drawerItemFeedback) {
      Navigator.pushNamed(context, Routes.feedback);
    } else if (drawerItem.title == localizationsContext.drawerItemLogout) {
      await showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return DialogWidget(
            title: localizationsContext.dialogLogoutSure,
            icon: Strings.iconDrawerLogout,
            positiveButton: localizationsContext.logout,
            negativeButton: localizationsContext.cancel,
            onNegativeButtonClick: () {
              Navigator.pop(dialogContext);
            },
            onPositiveButtonClick: () async {
              Navigator.pop(dialogContext);
              await _logout();
            },
          );
        },
      );
    } else if (drawerItem.title ==
        localizationsContext.drawerItemUnitConverter) {
      Navigator.pushNamed(context, Routes.unitConverter);
    } else if (drawerItem.title == localizationsContext.drawerItemReminder) {
      Navigator.pushNamed(context, Routes.reminder);
    } else if (drawerItem.title == localizationsContext.drawerItemBuyers) {
      Navigator.pushNamed(
        context,
        Routes.buyers,
        arguments: BuyerSellerType.buyers,
      );
    } else if (drawerItem.title == localizationsContext.drawerItemSellers) {
      Navigator.pushNamed(
        context,
        Routes.sellers,
        arguments: BuyerSellerType.sellers,
      );
    } else if (drawerItem.title == localizationsContext.drawerItemBackup) {
      Navigator.pushNamed(
        context,
        Routes.backup,
      );
    } else if (drawerItem.title == localizationsContext.drawerItemOther) {
      Navigator.pushNamed(
        context,
        Routes.otherMiscItem,
      );
    } else if (drawerItem.title == localizationsContext.subscription) {
      Navigator.pushNamed(
        context,
        Routes.currentPlan,
      );
    }
  }

  Future<void> _logout() async {
    debugPrint('FCM TOKEN:: ${StaticFunctions.fcmToken}');
    DioClient().logout();
    await StaticFunctions.cancelFlagsOnLogoutOrSessionTimeOut(_isarService);
    navigatorKey.currentState?.pushReplacementNamed(Routes.authenticationRoute);
  }

  Future<int> _getTotalPropertyCounts() async {
    final propertyCount = await _isarService.getMyPropertiesCount();
    return propertyCount;
  }

  Future<int> _getTotalInquiryCounts() async {
    final inquiryCount = await _isarService.getMyInquiriesCount();
    return inquiryCount;
  }

  Future<int> _getUnreadNotificationCounts() async {
    final notificationCount = await _isarService.getUnreadNotificationCount();
    return notificationCount;
  }

  _updateTotalPropertyCounts() async {
    _totalPropertyCounts = await _getTotalPropertyCounts();
    if (mounted) {
      notifyListeners();
    }
  }

  _updateTotalInquiryCounts() async {
    _totalInquiryCounts = await _getTotalInquiryCounts();
    if (mounted) {
      notifyListeners();
    }
  }

  _updateNotificationCounts() async {
    _totalNotificationCounts = await _getUnreadNotificationCounts();
    if (mounted) {
      notifyListeners();
    }
  }

  updateSharedByBrooonsPropertyList() async {
    if (StaticFunctions.isSubScribedUser) {
      _refreshSharedByBrooonersProperty();
    } else {
      _commonPropertyDataProvider?.addDummyBrooonProperties(
        localizationsContext,
      );
    }
    if (mounted) {
      notifyListeners();
    }
  }

  updateSharedByBrooonsInquiryList() async {
    if (StaticFunctions.isSubScribedUser) {
      _refreshSharedByBrooonersInquiry();
    } else {
      _commonPropertyDataProvider?.addDummyBrooonInquiries(
        localizationsContext,
      );
    }
    if (mounted) {
      notifyListeners();
    }
  }

  _refreshSharedByBrooonersProperty() async {
    await _commonPropertyDataProvider?.fetchSharedByBrooonersProperties();
    await _updateSharedByPropertyCounts();
    if (mounted) {
      notifyListeners();
    }
  }

  _refreshSharedByBrooonersInquiry() async {
    await _commonPropertyDataProvider?.fetchSharedByBrooonersInquiries(
      localizationsContext: localizationsContext,
    );
    await _updateSharedByInquiryCounts();
    if (mounted) {
      notifyListeners();
    }
  }

  Future<bool> loadMorePropertiesSharedByBroooners() async {
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
        );
        if (newBrooonProperties != null && newBrooonProperties.isNotEmpty) {
          await _updateSharedByPropertyCounts();
          if (mounted) {
            notifyListeners();
          }
          return true;
        }
      }
    }
    return false;
  }

  Future<bool> loadMoreInquiriesSharedByBroooners() async {
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
        );
        if (newBrooonInquiries != null && newBrooonInquiries.isNotEmpty) {
          await _updateSharedByInquiryCounts();
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
    final isApiCallSuccess = await loadMorePropertiesSharedByBroooners();
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
    final isApiCallSuccess = await loadMoreInquiriesSharedByBroooners();
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

  _updateSharedByPropertyCounts() async {
    if (StaticFunctions.isSubScribedUser) {
      final brooonPropertyInfo =
          await _isarService.getBrooonPropertiesCountSchema();
      _sharedByBrooonPropertyCounts = brooonPropertyInfo?.totalItemsCount ?? 0;
    } else {
      _sharedByBrooonPropertyCounts = 0;
    }
    if (mounted) {
      notifyListeners();
    }
  }

  _updateSharedByInquiryCounts() async {
    if (StaticFunctions.isSubScribedUser) {
      final brooonInquiryInfo =
          await _isarService.getBrooonInquiriesCountSchema();
      _sharedByBrooonInquiryCounts = brooonInquiryInfo?.totalItemsCount ?? 0;
    } else {
      _sharedByBrooonInquiryCounts = 0;
    }
    if (mounted) {
      notifyListeners();
    }
  }

  loadNearByList({bool shouldReset = true}) async {
    if (shouldReset || nearByAllItemsList.isEmpty) {
      nearByDisplayItemList.clear();
      nearByAllItemsList.clear();
      final propertyList = await _commonPropertyDataProvider
          ?.getAllNearByPropertiesWithinRadius();
      final inquiryList = await _commonPropertyDataProvider
          ?.getAllNearByInquiriesWithinRadius();
      if (propertyList != null) {
        nearByAllItemsList.addAll(propertyList);
      }
      if (inquiryList != null) {
        nearByAllItemsList.addAll(inquiryList);
      }
      nearByAllItemsList.sort(
        (a, b) {
          return (a.distance! as double).compareTo((b.distance! as double));
        },
      );
      _nearByPropertyCounts = nearByAllItemsList.length;
    }
    if (nearByAllItemsList.isNotEmpty) {
      final lengthToSkip = nearByDisplayItemList.length;
      for (int i = lengthToSkip; i < nearByAllItemsList.length; i++) {
        if (i == lengthToSkip + AppConfig.showMaxNearByPropertiesInDashBoard) {
          break;
        }
        nearByDisplayItemList.add(nearByAllItemsList[i]);
      }
    }
    if (mounted) {
      notifyListeners();
    }
  }

  loadRecentlyAddedList({
    bool shouldReset = true,
  }) async {
    final lastPropertyDate = !shouldReset && recentlyAddedList.isNotEmpty
        ? recentlyAddedList
            .lastWhereOrNull((element) => element is DbProperty)
            ?.addedAt
        : null;
    final propertyList = await _isarService.getRecentlyAddedProperties(
      AppConfig.showRecentPaginationLimitInDashBoard,
      lastDate: lastPropertyDate,
    );

    if (shouldReset) {
      recentlyAddedList.removeWhere((element) => element is DbProperty);
    }
    if (propertyList.isNotEmpty) {
      recentlyAddedList.addAll(propertyList);
    }

    final lastInquiryDate = !shouldReset && recentlyAddedList.isNotEmpty
        ? recentlyAddedList
            .lastWhereOrNull((element) => element is DbSavedFilter)
            ?.addedAt
        : null;
    final inquiryList = await _isarService.getRecentlyAddedInquiries(
      AppConfig.showRecentPaginationLimitInDashBoard,
      lastDate: lastInquiryDate,
    );
    if (shouldReset) {
      recentlyAddedList.removeWhere((element) => element is DbSavedFilter);
    }
    if (inquiryList.isNotEmpty) {
      recentlyAddedList.addAll(inquiryList);
    }
    recentlyAddedList.sort(
      (a, b) {
        return (b.addedAt as DateTime)
            .millisecondsSinceEpoch
            .compareTo((a.addedAt as DateTime).millisecondsSinceEpoch);
      },
    );
    if (mounted) {
      notifyListeners();
    }
  }

  Future<MapEntry<int, int>> getPropertyCountWithInquiryByType(
      int propertyTypeId) async {
    MapEntry<int, int> counts =
        await CommonPropertyDataProvider.getInquiryCountOfPropertyWith(
      propertyTypeId,
    );
    _propertiesCountHashMap[propertyTypeId] = counts;
    return counts;
  }

  Future<MapEntry<int, int>> getInquiryCountWithPropertyByType(
      int propertyTypeId) async {
    MapEntry<int, int> counts =
        await CommonPropertyDataProvider.getPropertyCountOfInquiryWith(
      propertyTypeId,
    );
    _inquiriesCountHashMap[propertyTypeId] = counts;
    return counts;
  }

  MapEntry<int, int> getPropertyCountWithInquiryByTypeBeforeFuture(
      int propertyTypeId) {
    if (_propertiesCountHashMap.containsKey(propertyTypeId)) {
      return _propertiesCountHashMap[propertyTypeId] ?? MapEntry(0, 0);
    }
    return MapEntry(0, 0);
  }

  MapEntry<int, int> getInquiryCountWithPropertyByTypeBeforeFuture(
      int propertyTypeId) {
    if (_inquiriesCountHashMap.containsKey(propertyTypeId)) {
      return _inquiriesCountHashMap[propertyTypeId] ?? MapEntry(0, 0);
    }
    return MapEntry(0, 0);
  }

  _getUserInfo({required bool isNeedToSetNearByFlags}) async {
    userInfo = await _isarService.getUserInfo();
    if (mounted) {
      notifyListeners();
    }
    if (isNeedToSetNearByFlags) {
      _currentNearByRadius =
          userInfo?.nearByDistance.toInt() ?? _currentNearByRadius;
      _currentLatitude = userInfo?.liveLatitude;
      _currentLongitude = userInfo?.liveLongitude;
      checkForUserIsVerified();
    }
  }

  _refreshPropertyInfo() async {
    final onPropertyChanges = await _isarService.watchOnPropertySave();
    _propertyInfoListener = onPropertyChanges.listen(
      (event) async {
        await _updateTotalPropertyCounts();
        await loadNearByList();
        await loadRecentlyAddedList();
      },
    );
  }

  _refreshInquiryInfo() async {
    final onInquiryChanges = await _isarService.watchOnFilterChanges();
    _inquiryInfoListener = onInquiryChanges.listen(
      (event) async {
        await _updateTotalInquiryCounts();
        await loadNearByList();
        await loadRecentlyAddedList();
      },
    );
  }

  _refreshNotificationCounts() async {
    final onNotificationChanges =
        await _isarService.watchOnNotificationChanges();
    _notificationCountListener = onNotificationChanges.listen(
      (event) async {
        await _updateNotificationCounts();
      },
    );
    if (_notificationTimer == null || !_notificationTimer!.isActive) {
      _notificationTimer = Timer.periodic(
        const Duration(
          minutes: 1,
        ),
        (timer) async {
          compute(NotificationHelper.manipulateNotifications,
                  StaticFunctions.userId)
              .then(
            (value) {
              if (mounted) {
                _updateNotificationCounts();
              }
            },
          );
        },
      );
    }
  }

  _refreshUserInfo() async {
    final Stream<void> onUserChanges = await _isarService.watchOnUserInfo();
    _userInfoListener = onUserChanges.listen(
      (event) async {
        await _checkForRefreshNearBy();
      },
    );
  }

  _checkForRefreshNearBy() async {
    await _getUserInfo(isNeedToSetNearByFlags: false);
    if (_nearByDebounce?.isActive ?? false) {
      _nearByDebounce?.cancel();
    }
    _nearByDebounce = Timer(
      const Duration(
        milliseconds: 2000,
      ),
      () async {
        // on radius changes or live location changes - update near by properties list
        if (_currentNearByRadius != (-1) &&
            (_currentNearByRadius != userInfo?.nearByDistance.toInt() ||
                _currentLatitude != userInfo?.liveLatitude ||
                _currentLongitude != userInfo?.liveLongitude)) {
          _currentNearByRadius =
              userInfo?.nearByDistance.toInt() ?? _currentNearByRadius;
          _currentLatitude = userInfo?.liveLatitude;
          _currentLongitude = userInfo?.liveLongitude;
          await loadNearByList();
        }
      },
    );
  }

  _handleNotificationClick(BuildContext context) async {
    NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await notificationPlugin.getNotificationAppLaunchDetails();
    if (notificationAppLaunchDetails != null &&
        notificationAppLaunchDetails.notificationResponse != null &&
        notificationAppLaunchDetails.notificationResponse!.payload != null &&
        notificationAppLaunchDetails.notificationResponse!.payload!
            .trim()
            .isNotEmpty) {
      NotificationHelper.handleNotification(
          notificationAppLaunchDetails.notificationResponse!.payload!);
    }
    final RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null &&
        initialMessage.notification != null &&
        initialMessage.data.isNotEmpty &&
        initialMessage.data
            .containsKey(NotificationHelper.payloadKeyNotificationId)) {
      final payloadJson = NotificationHelper.fcmToJsonPayload(initialMessage);
      NotificationHelper.handleNotification(payloadJson);
    }
  }

  _copyNoImagePreviewToFile() async {
    final Directory docDir = await getApplicationDocumentsDirectory();
    StaticFunctions.noImagePreviewFilePath =
        '${docDir.path}/${Strings.noImagePreviewFileName}';
    File file = File(StaticFunctions.noImagePreviewFilePath);
    if (!await file.exists()) {
      final imageBytes = await rootBundle.load(Strings.imageNoPreview);
      final buffer = imageBytes.buffer;
      await file.writeAsBytes(
        buffer.asUint8List(
          imageBytes.offsetInBytes,
          imageBytes.lengthInBytes,
        ),
      );
    }
  }

  checkForPrivacy(BuildContext context) async {
    final isPrivacyBreak = await AppPrivacyHelper.checkForPrivacy(
      context,
      RedirectionFromForPrivacyCheck.home,
      _isarService,
    );
    // If no privacy break for past dates then check for subscription expiry
    if (!isPrivacyBreak) {
      if (SubscriptionUtils.checkUserSubscriptionExpired()) {
        _openSubscriptionScreen(context);
      }
    }
  }

  _openSubscriptionScreen(BuildContext context) async {
    if (!AppConfig.enabledSubscriptionFeature) {
      Navigator.pushNamed(
        _context,
        Routes.subscriptionExpired,
      );
    } else {
      String message = localizationsContext.subscription;
      final planInfo = await _isarService.getSubscriptionPlanById(
        StaticFunctions.userInfo?.subscribedPlanId,
      );
      if (planInfo?.title != null) {
        message = planInfo!.title!;
      }
      await showDialog(
        context: _context,
        barrierDismissible: false,
        builder: (BuildContext dialogContext) {
          return DialogWidget(
            title: localizationsContext.subscriptionExpired(message),
            icon: Strings.iconSessionTimeout,
            positiveButton: localizationsContext.subscribeNow,
            isDialogCancellable: false,
            onPositiveButtonClick: () async {
              Navigator.pop(dialogContext);
              if (AppConfig.enabledSubscriptionFeature) {
                Navigator.pushNamed(
                  _context,
                  Routes.subscription,
                  arguments: ChoosePlanFrom.forceSubscription,
                );
              } else {
                _launchURL(context);
              }
            },
          );
        },
      );
    }
  }

  openAddBuyer() {
    StaticFunctions.unFocusKeyboardIfAny(_context);
    Navigator.pushNamed(
      _context,
      Routes.addBuyer,
    );
  }

  openAddProperty() {
    StaticFunctions.unFocusKeyboardIfAny(_context);
    Navigator.pushNamed(
      _context,
      Routes.addProperty,
    );
  }

  openFilterScreen() {
    StaticFunctions.unFocusKeyboardIfAny(_context);
    Navigator.pushNamed(
      _context,
      Routes.filter,
      arguments: FilterScreenArg(
        fromRoute: Routes.home,
        filterToApply: null,
      ),
    );
  }

  openNotificationScreen() {
    StaticFunctions.unFocusKeyboardIfAny(_context);
    Navigator.pushNamed(
      _context,
      Routes.notification,
    );
  }

  openLocationScreen() {
    StaticFunctions.unFocusKeyboardIfAny(_context);
    Navigator.pushNamed(
      _context,
      Routes.chooseLocation,
      arguments: ChooseLocationFrom.home,
    );
  }

  openPropertyDetailScreen(DbProperty selectedProperty) {
    StaticFunctions.unFocusKeyboardIfAny(_context);
    Navigator.of(_context).pushNamed(
      Routes.propertyDetail,
      arguments: selectedProperty,
    );
  }

  openInquiryDetailScreen(DbSavedFilter selected) {
    StaticFunctions.unFocusKeyboardIfAny(_context);
    Navigator.of(_context).pushNamed(
      Routes.inquiryDetail,
      arguments: selected,
    );
  }

  _watchOnBlockedBroooners() async {
    final blockedBrooonerChanges =
        await _isarService.watchOnBlockedBrooonerChanges();
    blockedBrooonerStreamSubscription = blockedBrooonerChanges.listen(
      (event) {
        updateSharedByBrooonsPropertyList();
        updateSharedByBrooonsInquiryList();
      },
    );
  }

  lockItemClicked() {
    if (AppConfig.enabledSubscriptionFeature) {
      Navigator.pushNamed(
        _context,
        Routes.subscription,
        arguments: ChoosePlanFrom.propertyFromNetwork,
      );
    }
  }

  _checkAndUpdateSubscriptionStatus() async {
    _commonPropertyDataProvider?.updateSubscriptionStatus(
      isFromHome: true,
      localizationsContext: localizationsContext,
    );
  }

  _launchURL(BuildContext context) async {
    const url = AppConfig.paymentUrl;
    try {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } catch (_) {
      SnackBarView.showSnackBar(
        context,
        localizationsContext.unableToLaunchPayment,
      );
    }
  }

  _showInAppUpdateDialog(int? appId) async {
    await showDialog(
      context: _context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return DialogWidget(
          title: localizationsContext.newUpdateAvailable,
          icon: Strings.iconNewUpdate,
          positiveButton: localizationsContext.updateNow,
          isDialogCancellable: false,
          onPositiveButtonClick: () async {
            Navigator.pop(dialogContext);
            final url = Uri.parse(
              '${AppConfig.applePlayStoreLink}$appId',
            );
            launchUrl(
              url,
              mode: LaunchMode.externalApplication,
            );
          },
        );
      },
    );
  }

  checkForUserIsVerified() async {
    if (!(userInfo?.isVerifiedUser ?? false)) {
      // check for user is verified or not
      final response = await DioClient().checkUserIsVerified();
      if (response?.data?.isVerified != null) {
        if (response!.data!.isVerified! != userInfo?.isVerifiedUser) {
          if (mounted) {
            final user = await _isarService.getUserInfo();
            if (user != null) {
              user.isVerifiedUser = response.data!.isVerified!;
              _isarService.saveOrUpdateUserInfo(user);
              if (mounted) {
                notifyListeners();
              }
            }
          }
        }
      }
    }
  }

  onDispose() {
    mounted = false;
    _nearByDebounce?.cancel();
    _notificationTimer?.cancel();
    _userInfoListener?.cancel();
    _propertyInfoListener?.cancel();
    blockedBrooonerStreamSubscription?.cancel();
    _inquiryInfoListener?.cancel();
    _notificationCountListener?.cancel();
  }
}
