import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../const/routes.dart';
import '../../localdb/properties/db_saved_filter.dart';
import '../../localdb/save_default_data.dart';
import '../../utils/static_functions.dart';
import '../../views/view_all_property/model/view_all_screen_arg.dart';

class InquiryActionUtils {
  static bool contactInfoAvailable(DbSavedFilter? inquiry) {
    return ((inquiry?.mobileNo != null &&
            inquiry!.mobileNo.trim().isNotEmpty) ||
        (inquiry?.closedDealSellerPhoneNo != null &&
            inquiry!.closedDealSellerPhoneNo!.isNotEmpty));
  }

  static bool brooonContactInfoAvailable(DbSavedFilter? inquiry) {
    return ((inquiry?.brooonPhone != null &&
        inquiry!.brooonPhone!.trim().isNotEmpty));
  }

  static bool isInquiryClosed(DbSavedFilter? inquiry) {
    return inquiry?.inquirySoldStatusId == SaveDefaultData.soldStatusId;
  }

  static openDialerToMakeACall(DbSavedFilter? inquiry) {
    if (inquiry != null) {
      String phoneNumber = inquiry.mobileNo.trim();
      StaticFunctions.openDialer(phoneNumber);
    }
  }

  static openDialerToMakeACallToBrooon(DbSavedFilter? inquiry) {
    if (inquiry != null) {
      StaticFunctions.openDialer(inquiry.brooonPhone!.trim());
    }
  }

  static openMatches(BuildContext context, DbSavedFilter? inquiry) {
    AppLocalizations localizationsContext = AppLocalizations.of(context)!;
    Navigator.pushNamed(
      context,
      Routes.viewAllProperties,
      arguments: ViewAllScreenArg(
        heading: localizationsContext.matchingsProperty,
        count: 0,
        inquiryToMatch: inquiry,
        showDataFor: ViewAllFromType.matches,
        viewAllFromToHandleTabs:
            ViewAllTabsVisibilityType.fromMatchingProperties,
      ),
    );
  }
}
