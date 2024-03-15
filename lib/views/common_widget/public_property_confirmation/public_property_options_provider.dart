import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import './public_property_option.dart';

class PublicPropertyOptionsProvider extends ChangeNotifier {
  late AppLocalizations localizationsContext;
  final List<PublicPropertyOption> sharingOptions = [];

  init(BuildContext context) {
    localizationsContext = AppLocalizations.of(context)!;
    _generateSharingOptions();
  }

  _generateSharingOptions() async {
    sharingOptions.clear();
    sharingOptions.add(
      PublicPropertyOption(
        settingId: 1,
        title: localizationsContext.basicDetails,
        subtitle: localizationsContext.sharePublicPropertyBasicDetails,
        isEnabled: true,
      ),
    );
    sharingOptions.add(
      PublicPropertyOption(
        settingId: 2,
        title: localizationsContext.priceDetails,
        subtitle: localizationsContext.sharePublicPropertyPriceDetails,
        isEnabled: true,
      ),
    );
    sharingOptions.add(
      PublicPropertyOption(
        settingId: 3,
        title: localizationsContext.otherDetails,
        subtitle: localizationsContext.sharePublicPropertyOtherDetails,
        isEnabled: true,
      ),
    );
    sharingOptions.add(
      PublicPropertyOption(
        settingId: 4,
        title: localizationsContext.yourDetails,
        subtitle: localizationsContext.sharePublicPropertyYourDetails,
        isEnabled: true,
      ),
    );
    sharingOptions.add(
      PublicPropertyOption(
        settingId: 5,
        title: localizationsContext.sellerDetails,
        subtitle: localizationsContext.sharePublicPropertySellerDetails,
        isEnabled: false,
      ),
    );
    sharingOptions.add(
      PublicPropertyOption(
        settingId: 6,
        title: localizationsContext.privateDetails,
        subtitle: localizationsContext.sharePublicPropertyPrivateDetails,
        isEnabled: false,
      ),
    );
    notifyListeners();
  }
}
