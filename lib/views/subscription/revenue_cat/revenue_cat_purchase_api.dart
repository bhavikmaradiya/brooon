import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import './revenue_cat_app_data.dart';
import './store_config.dart';

// Ref. https://www.youtube.com/watch?v=h-jOMh2KXTA
// https://www.youtube.com/watch?v=TrkiSZ2mnlo
// https://www.revenuecat.com/docs/getting-started
// https://medium.com/flutter-community/in-app-purchases-with-flutter-a-comprehensive-step-by-step-tutorial-b96065d79a21
class RevenueCatPurchaseApi {
  static Future init() async {
    if (Platform.isIOS) {
      StoreConfig(
        store: Store.appStore,
        apiKey: RevenueCatAppData.appleApiKey,
      );
    } else if (Platform.isAndroid) {
      StoreConfig(
        store: Store.playStore,
        apiKey: RevenueCatAppData.googleApiKey,
      );
    }

    await Purchases.setLogLevel(LogLevel.debug);
    /*
    - appUserID is nil, so an anonymous ID will be generated automatically by the Purchases SDK. Read more about Identifying Users here: https://docs.revenuecat.com/docs/user-ids
    - observerMode is false, so Purchases will automatically handle finishing transactions. Read more about Observer Mode here: https://docs.revenuecat.com/docs/observer-mode
    */
    PurchasesConfiguration configuration =
        PurchasesConfiguration(StoreConfig.instance.apiKey)
          ..appUserID = null
          ..observerMode = false;
    await Purchases.configure(configuration);
    appData.appUserID = await Purchases.appUserID;
  }

  static Future<List<Offering>> fetchOffers() async {
    try {
      final offerings = await Purchases.getOfferings();
      final current = offerings.current;
      return current == null ? [] : [current];
    } on PlatformException catch (_) {
      return [];
    }
  }

  static Future<bool> purchaseProduct(String productId) async {
    try {
      CustomerInfo customerInfo = await Purchases.purchaseProduct(productId);
      // CustomerInfo customerInfo = await Purchases.purchasePackage(package);
      var isPro = customerInfo
          .entitlements.all[RevenueCatAppData.entitlementId]?.isActive;
      if (isPro == true) {
        // Unlock that great "pro" content
      }
      return true;
    } on PlatformException catch (e) {
      final errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
        debugPrint('Purchase product cancelled: ${e.message}');
      }
      return false;
    }
  }
}
