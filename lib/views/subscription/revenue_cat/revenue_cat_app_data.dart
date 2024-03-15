class RevenueCatAppData {
  static final RevenueCatAppData _appData = RevenueCatAppData._internal();
  static const entitlementId = 'premium';
  static const revenueCatAppId = 'appdb8ed99a75';
  static const appleApiKey = 'appl_api_key';
  static const googleApiKey = 'goog_yhuvVCdMTyuGoNoRYbFdNHkrQxC';

  String appUserID = '';

  factory RevenueCatAppData() {
    return _appData;
  }

  RevenueCatAppData._internal();
}

final appData = RevenueCatAppData();
