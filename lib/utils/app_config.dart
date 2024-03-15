class AppConfig {
  static const String appBundleIdentifier = 'com.brooon.app';
  static const bool enableForceUpdateFeature = true;
  static const bool enabledSubscriptionFeature = false;
  static const bool enabledSharedByBrooonForFreePlan = true;
  static const String paymentUrl = 'https://brooon.com/payment';
  static const int splashTimer = 3; // 3 sec
  static const int indicatorAnimationDuration = 200; // 200 millisecond
  static const int walkThroughScreensLength = 3;
  static const int mobileNoFieldLength = 11;
  static const int mobileNoLength = mobileNoFieldLength - 1; // removing space
  static const int mobileFormatterLength = 5;
  static const int otpFieldLength = 2;
  static const int otpLength = 6;
  static const int minLineSeparatorToShowPropertyCountInNextLine = 8;
  static const String mobileNumPrefix = '+91';
  static const String propertyIdLength = '000000';
  static const String inquiryIdLength = '000000';
  static const int otpVerifiedDuration = 2; // in sec
  static const Duration resendOtpTimeoutDuration = const Duration(seconds: 59);
  static const String facebookUrl = 'https://www.facebook.com/brooonofficial';
  static const String instagramUrl =
      'https://www.instagram.com/brooon_official/';
  static const String twitterUrl = 'https://twitter.com/Brooon_';
  static const String linkedInUrl = 'https://www.linkedin.com/company/brooon/';
  static const String termsAndConditionUrl =
      'https://brooon.com/terms-mob.html';
  static const String privacyPolicyUrl = 'https://brooon.com/privacy-mob.html';
  static const String faqUrl = 'https://brooon.com/faq-mob.html';
  static const String aboutUsUrl = 'https://brooon.com/about-mob.html';
  static const int showMaxSharedByPropertiesInDashBoard = 5;
  static const int showMaxNearByPropertiesInDashBoard = 5;
  static const int showRecentPaginationLimitInDashBoard = 10;
  static const int maxChainOfBrokers = 5;
  static const int maxRoomsLength = 3;
  static const int maxBathRoomsLength = 3;
  static const int maxFloorsLength = 3;
  static const int maxFrontDepthLength = 6;
  static const double bottomSheetInitialSize = 0.65;
  static const double bottomSheetMinSizeToClose = 0.55;
  static const double bottomSheetMaxSizeWeb = 0.95;
  static const double bottomSheetMaxSizeMobile = 0.95;
  static const rupeeSymbol = '\u20B9';
  static const defaultLocaleForPriceFormat = 'hi'; // hi => Hindi (India)
  static const maxLengthForPrice = 12;
  static const maxLengthForAreaSize = 10;
  static const int maxImagesAllowed = 10;
  static const int snackBarDuration = 3; // After 3 sec, snack bar will be hide!
  static const int unitCalculationMaxDecimal = 5;
  static const String mapboxStyle =
      'mapbox://styles/testwtsm/cldba8j4v000w01mos717g21d';
  static const String mapboxAccessToken =
      'pk.eyJ1IjoidGVzdHd0c20iLCJhIjoiY2xkOXRmb3pkMGFxdjNubnpzN245b3ptdSJ9.JtnsWQHqqwAlI_YfpAXXFQ';
  static const String googlePlacesKey =
      'AIzaSyAfBn-uPDtt3yyV5ZojfU-yrmSmzbb4vnw';
  static const double mapboxDefaultZoom = 14;
  static const double maxZoomLevel = 14;
  static const double minZoomLevel = 12;
  static const double defaultZoomProperty = 15;

  // https://stackoverflow.com/a/63408506/5370550
  static const double scrollToTopCenterOffset = 0.002;
  static const int minDistanceInMeterToUpdateLiveLocation = 100; // 100 meter
  static const double minLatLngToCallReverseGeoCoding = 1;
  static const int savedFilterDisplayLimit = 2;
  static const int maxPriceRangeLength = 14;
  static const String reminderDisplayDateFormat = 'dd MMM, yyyy';
  static const String reminderDisplayTimeFormat = 'hh:mm a';
  static const String reminderDisplayDateTimeFormat = 'dd MMM yyyy, hh:mm a';
  static const String pdfSharedByDateTimeFormat = 'dd MMM yyyy hh:mm a';
  static const String reminderDisplayMonthYearFormat = 'MMMM, yyyy';
  static const String reminderNotificationChannelId = 'BrooonReminderChannelId';
  static const String reminderNotificationChannelName = 'Brooon Reminder';
  static const String reminderNotificationChannelDesc =
      'You will be reminded with property notification';

  static const String fcmNotificationChannelId = 'BrooonFCMMessagesChannelId';
  static const String fcmNotificationChannelName = 'Brooon';
  static const String fcmNotificationChannelDesc =
      'You will receive property updates';
  static const int watermarkTextMaxLength = 6;
  static const int watermarkTextMinLength = 4;
  static const int maxRadius = 20; // 20 km
  static const int minRadius = 1; // 1 km
  static const int defaultRadius = 1; // 1 km
  static const double defaultNearByDistance = 1; // 1 km
  static const double defaultPrivateSearchDistance = 1; // 1 km
  static const double defaultBrooonSearchDistance = 1; // 1 km
  static const double distanceMToKm = 1000;
  static const int defaultDelayToLoadMapInMilliseconds = 3000; // 3 sec
  static const int minorDelayToLoadMapInMilliseconds = 500; // 500 milli sec
  static const String lastBackupDateFormat = 'dd MMM yyyy, hh:mm a';
  static const double watermarkOpacity = 0.7;
  static const String freeTrialPlanType = 'free';
  static const String goldPlanType = 'gold';
  static const String platinumPlanType = 'platinum';
  static const String inAppStatusPurchased = 'purchased';
  static const String inAppStatusPending = 'pending';
  static const String propertyPhotosLocalKey = 'photos';
  static const String historyPurchasedOnDateFormat = 'dd MMM, yyyy hh:mm a';
  static const String historyStartEndDateFormat = 'dd MMM, yyyy';
  static const String propertyAddedAtDateFormat = 'dd MMM yy, hh:mm a';
  static const String propertyVisitorAddedAtDateFormat = 'dd MMM yy, hh:mm a';
  static const int paginationInitialPage = 1;
  static const int paginationPerPageLimit = 5;
  static const int viewAllPaginationPerPageLimit = 5;
  static const int blockedBrooonersPaginationPerPageLimit = 15;
  static const bool showRadioOrCheckbox = false;
  static const bool showAddPropertySuccessScreen = false;
  static const String addressLandmarkTagSeparator = ',';
  static const bool enableImportExport = false;
  static const bool enableWhatsAppShareFromSettings = false;
  static const int maxAllowedEndDateFromStartDate = 30;
  static const bool enableActiveTagForListItems = false;
  static const bool enableBuyerSellerNameWithId = true;
  static const bool buyerSellerNameChangeOnSold = false;
  static const bool enableBrooonItemsImagePreview = true;
  static const bool enableNearByRealTimeFeature = true;
  static const bool enableRoomForBungalows = false;
  static const String applePlayStoreLink = 'https://apps.apple.com/app/id';
  static const bool enableCloseDealUserInfoToServer = false;
  static const bool shouldShowMatchingWithDashboardCount = true;
  static const bool shouldShowAdditionalFurnishingInShare = false;
  static const bool showSellerListWithClosedProperties = true;
  static const bool showBuyerListWithClosedInquiries = true;
  static const int minMatchCount = 0;
  static const int pricingDecimalLimit = 2;
  static const int priceRangeFieldMaxLength = 13;
  static const bool shouldApplyStringQueryForLocal = false;
  static const bool shouldEnableStringQuery = false;
}
