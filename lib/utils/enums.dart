import 'package:flutter/foundation.dart';

enum ColorEnum {
  themeColor,
  darkThemeColor,
  blueColor,
  blackColor,
  grayColor,
  whiteColor,
  disableThemeColor,
  disableWhiteColor,
  transparentBlackColor,
  shadowColor,
  darkBgOpacityColor,
  lightBgOpacityColor,
  statusBarColor,
  themeColorOpacity10Percentage,
  themeColorOpacity5Percentage,
  themeColorOpacity3Percentage,
  themeColorOpacity6Percentage,
  touchSplashColor,
  deselectedColor,
  toolbarDefaultColor,
  dividerColor,
  errorColor,
  transparent,
  gray90Color,
  gray99Color,
  greenColor,
  greenMatchingColor,
  blueColorOpacity2Percentage,
  blueColorOpacity5Percentage,
  blueColorOpacity3Percentage,
  bottomSheetBarrierColor,
  dropDownSelectedItemBgColor,
  dropDownBgColor,
  grayAEColor,
  themeColorOpacity8Percentage,
  redColor,
  borderColorE0,
  stickyHeaderBlueBgColor,
  shimmerBaseColor,
  shimmerHighlightColor,
  pdfRowDarkColor,
  pdfRowTitleTextColor,
}

enum NotificationType {
  reminder,
  pushNotification,
}

enum NotificationSubType {
  publicProperty,
  publicInquiry,
  propertyStatus,
  sold,
  promo,
  subscribe,
}

enum StatusTypeToSync {
  activeInactive,
  closedDeals,
  privatePublic,
  delete,
}

enum StatusSyncType {
  property,
  inquiry,
}

enum ApiEnum {
  inProgress,
  noInternet,
  onSuccess,
  onFailure,
  onDone, // No matter success / false
}

extension EnumExtension on Enum {
  String get name => describeEnum(this);
}
