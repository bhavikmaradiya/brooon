import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../const/routes.dart';
import '../../localdb/properties/db_property.dart';
import '../../localdb/save_default_data.dart';
import '../../utils/static_functions.dart';
import '../../views/view_all_property/model/view_all_screen_arg.dart';

class PropertyActionUtils {
  static bool contactInfoAvailable(DbProperty? property) {
    return ((property?.sellerPhoneNo != null &&
            property!.sellerPhoneNo!.trim().isNotEmpty) ||
        (property?.closedDealBuyerPhoneNo != null &&
            property!.closedDealBuyerPhoneNo!.isNotEmpty));
  }

  static bool brooonContactInfoAvailable(DbProperty? property) {
    return ((property?.brooonPhone != null &&
        property!.brooonPhone!.trim().isNotEmpty));
  }

  static bool isPropertyClosed(DbProperty? property) {
    return property?.propertySoldStatusId == SaveDefaultData.soldStatusId;
  }

  static openDialerToMakeACall(DbProperty? property) {
    if (property != null) {
      String phoneNumber = property.sellerPhoneNo!.trim();
      if (property.propertySoldStatusId == SaveDefaultData.soldStatusId) {
        phoneNumber = property.closedDealBuyerPhoneNo!.trim();
      }
      StaticFunctions.openDialer(phoneNumber);
    }
  }

  static openDialerToMakeACallToBrooon(DbProperty? property) {
    if (property != null) {
      StaticFunctions.openDialer(property.brooonPhone!.trim());
    }
  }

  static openMatches(BuildContext context, DbProperty? property) {
    AppLocalizations localizationsContext = AppLocalizations.of(context)!;
    /*if (property != null) {
      Navigator.pushNamed(context, Routes.visitors, arguments: property);
    }*/
    Navigator.pushNamed(
      context,
      Routes.viewAllProperties,
      arguments: ViewAllScreenArg(
        heading: localizationsContext.matchingsInquiry,
        count: 0,
        propertyToMatch: property,
        showDataFor: ViewAllFromType.matches,
        viewAllFromToHandleTabs:
            ViewAllTabsVisibilityType.fromMatchingInquiries,
      ),
    );
  }
}
