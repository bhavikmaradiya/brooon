import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import './entitlement.dart';
import './revenue_cat_app_data.dart';

class RevenueCatProvider extends ChangeNotifier {
  RevenueCatProvider() {
    init();
  }

  Entitlement _entitlement = Entitlement.free;

  Entitlement get entitlement => _entitlement;

  Future init() async {
    Purchases.addCustomerInfoUpdateListener(
      (customerInfo) async {
        appData.appUserID = await Purchases.appUserID;
        CustomerInfo customerInfo = await Purchases.getCustomerInfo();
        (customerInfo.entitlements.all[RevenueCatAppData.entitlementId] !=
                    null &&
                customerInfo.entitlements.all[RevenueCatAppData.entitlementId]!
                    .isActive)
            ? _entitlement = Entitlement.premium
            : _entitlement = Entitlement.free;
      },
    );
  }
}
