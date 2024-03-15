class Endpoints {
  Endpoints._();

  static const String stagingBaseUrl = 'http://stagingapi.brooon.com';
  static const String productionBaseUrl = 'https://prodapi.brooon.com';
  static const String baseURL = stagingBaseUrl;
  static const String _googleApiBaseUrl =
      'https://maps.googleapis.com/maps/api';
  static const String googleReverseGeoCodingApiBaseUrl =
      '$_googleApiBaseUrl/geocode/json';
  static const String googleSearchPlacesApiBaseUrl =
      '$_googleApiBaseUrl/place/autocomplete/json';
  static const String googleSearchPlacesDetailsApiBaseUrl =
      '$_googleApiBaseUrl/place/details/json';
  static const int receiveTimeout = 25;
  static const int connectionTimeout = 25;
  static const loginEndPoint = '/v1/auth/mobile_auth';
  static const refreshTokenEndPoint = '/v1/auth/refresh_token';
  static const uploadBackupEndPoint = '/v1/user/backup';
  static const uploadProfileInfoEndPoint = '/v1/user/update_profile';
  static const uploadLocationEndPoint = '/v1/user/location';
  static const addPropertyEndPoint = '/v1/property/add_property';
  static const addInquiryEndPoint = '/v1/inquiry/add_inquiries';
  static const syncPropertyStatusEndPoint =
      '/v1/property/update_property_status';
  static const syncInquiryStatusEndPoint = '/v1/inquiry/update_inquiry_status';
  static const addSettingsEndPoint = '/v1/setting/add_setting';
  static const addWaterMarkEndPoint = '/v1/setting/add_watermark';
  static const subscriptionPlansEndPoint = '/v1/subscription/plans';
  static const addSubscriptionEndPoint = '/v1/subscription/add_subscription';
  static const purchaseHistoryEndPoint = '/v1/subscription/purchase_history';
  static const checkPurchaseEndPoint = '/v1/subscription/check_purchase';
  static const sharedByBrooonersPropertyEndPoint =
      '/v1/shared_by_brooon/all_property';
  static const sharedByBrooonersInquiryEndPoint =
      '/v1/shared_by_brooon/all_inquiries';
  static const sharedByBrooonersFilterPropertyEndPoint =
      '/v1/shared_by_brooon/filter_property';
  static const sharedByBrooonersFilterInquiryEndPoint =
      '/v1/shared_by_brooon/filter_inquiry';
  static const sharedByBrooonersMatchingPropertiesEndPoint =
      '/v1/shared_by_brooon/matching_properties';
  static const sharedByBrooonersMatchingInquiriesEndPoint =
      '/v1/shared_by_brooon/matching_inquiries';
  static const feedbackEndPoint = '/v1/feedback/add_feedback';
  static const reportEndPoint = '/v1/report/add_report';
  static const blockBrooonerEndPoint = '/v1/block/add_block';
  static const unblockBrooonerEndPoint = '/v1/block/add_unblock';
  static const blockedBrooonerListEndPoint = '/v1/block/block_list';
  static const checkUserVerifyEndPoint = '/v1/auth/check_user_verify';
  static const iOSInAppUpdateEndPoint = 'https://itunes.apple.com/lookup';
  static const logoutEndPoint = '/v1/auth/logout';
}
