import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import './app_config.dart';
import './enums.dart';
import './notification_helper.dart';
import '../const/dark_colors.dart';
import '../const/light_colors.dart';
import '../const/string_const.dart';
import '../localdb/isar_service.dart';
import '../localdb/properties/db_property.dart';
import '../localdb/properties/db_saved_filter.dart';
import '../localdb/save_default_data.dart';
import '../localdb/user_info/db_user_info.dart';
import '../network/endpoints.dart';

class StaticFunctions {
  static bool isSubScribedUser = false;
  static int userId = -1;
  static DbUserInfo? userInfo;
  static String? deviceName = '';
  static late double deviceResolution;
  static double deviceHeight =
      WidgetsBinding.instance.window.physicalSize.height;
  static double deviceWidth = WidgetsBinding.instance.window.physicalSize.width;
  static String defaultPriceUnit = AppConfig.rupeeSymbol;
  static int defaultPriceUnitId = SaveDefaultData.priceUnitRupeeId;
  static String? fcmToken;
  static String noImagePreviewFilePath = '';
  static StreamSubscription<String>? _firebaseMessagingTokenStreamSubscription;

  static bool isHttpUrl(String? url) {
    return url != null &&
        (url.startsWith('https://') || url.startsWith('http://'));
  }

  static String? profilePictureServerFullPath(String? path) {
    if (path != null && path.trim().isNotEmpty) {
      return '${Endpoints.baseURL}/${path}';
    }
    return null;
  }

  static String? watermarkServerFullPath(String? path) {
    if (path != null && path.trim().isNotEmpty) {
      return '${Endpoints.baseURL}/${path}';
    }
    return null;
  }

  static String getPropertySoldUnsoldIcon(DbProperty? _selectedProperty) {
    return _selectedProperty?.closeDealId == SaveDefaultData.propertyForSellId
        ? Strings.iconSold
        : _selectedProperty?.closeDealId == SaveDefaultData.propertyForRentId
            ? Strings.iconRented
            : _selectedProperty?.closeDealId ==
                    SaveDefaultData.propertyForLeaseId
                ? Strings.iconLeased
                : '';
  }

  static String getInquirySoldUnsoldIcon(DbSavedFilter? _selectedInquiry) {
    return _selectedInquiry?.closeDealId == SaveDefaultData.propertyForSellId
        ? Strings.iconBought
        : _selectedInquiry?.closeDealId == SaveDefaultData.propertyForRentId
            ? Strings.iconRented
            : _selectedInquiry?.closeDealId ==
                    SaveDefaultData.propertyForLeaseId
                ? Strings.iconLeased
                : '';
  }

  static int getDefaultAreaUnitId(int? propertyTypeId) {
    if (propertyTypeId == SaveDefaultData.propertyTypePlotId ||
        propertyTypeId == SaveDefaultData.propertyTypeBungalowId) {
      return SaveDefaultData.areaUnitYdId;
    } else if (propertyTypeId ==
        SaveDefaultData.propertyTypeAgricultureLandId) {
      return SaveDefaultData.areaUnitAcreId;
    }
    return SaveDefaultData.areaUnitSqFtId;
  }

  static double shortPriceRangeValue(double price, int? unitId) {
    if (unitId == SaveDefaultData.filterPriceUnitThousand) {
      return price / 1000;
    } else if (unitId == SaveDefaultData.filterPriceUnitLac) {
      return price / 100000;
    } else if (unitId == SaveDefaultData.filterPriceUnitCrore) {
      return price / 10000000;
    }
    return price;
  }

  static int getPriceUnitAccordingPriceBySizeChanges(double price) {
    if (price <= 99999) {
      return SaveDefaultData.filterPriceUnitThousand;
    } else if (price <= 9999999) {
      return SaveDefaultData.filterPriceUnitLac;
    } else {
      return SaveDefaultData.filterPriceUnitCrore;
    }
  }

  static double convertPriceToFull(double price, int? unitId) {
    if (unitId == SaveDefaultData.filterPriceUnitThousand) {
      return price * 1000;
    } else if (unitId == SaveDefaultData.filterPriceUnitLac) {
      return price * 100000;
    } else if (unitId == SaveDefaultData.filterPriceUnitCrore) {
      return price * 10000000;
    }
    return price;
  }

  static String getPriceUnitLongString(
    AppLocalizations localizationsContext,
    int? unitId,
  ) {
    return unitId == SaveDefaultData.filterPriceUnitThousand
        ? localizationsContext.thousand
        : unitId == SaveDefaultData.filterPriceUnitLac
            ? localizationsContext.lakh
            : unitId == SaveDefaultData.filterPriceUnitCrore
                ? localizationsContext.crore
                : '';
  }

  static String getPriceUnitShortString(
    AppLocalizations localizationsContext,
    int? unitId,
  ) {
    return unitId == SaveDefaultData.filterPriceUnitThousand
        ? localizationsContext.thousandUnit
        : unitId == SaveDefaultData.filterPriceUnitLac
            ? localizationsContext.lac
            : unitId == SaveDefaultData.filterPriceUnitCrore
                ? localizationsContext.cr
                : '';
  }

  static LinkedHashMap<int, String> getPropertyFormattedPrice({
    required AppLocalizations localizationsContext,
    required DbProperty? property,
  }) {
    final priceRange = LinkedHashMap<int, String>();
    String price = '';
    if (property != null) {
      //TODO: Removed price unit symbol
      // String priceUnit = property.priceUnitValue ?? '';
      String priceUnit = '';
      if (property.propertyForIds != null &&
          property.propertyForIds!.isNotEmpty) {
        bool isForSell = property.propertyForIds!.firstWhereOrNull(
              (element) => element == SaveDefaultData.propertyForSellId,
            ) !=
            null;
        bool isForRent = property.propertyForIds!.firstWhereOrNull(
              (element) => element == SaveDefaultData.propertyForRentId,
            ) !=
            null;
        bool isForLease = property.propertyForIds!.firstWhereOrNull(
              (element) => element == SaveDefaultData.propertyForLeaseId,
            ) !=
            null;
        if (isForSell) {
          price = propertyPriceValue(
            localizationsContext: localizationsContext,
            priceUnit: priceUnit,
            minimumPrice: property.minSellPrice,
            maximumPrice: property.maxSellPrice,
            minPriceUnit: property.minSellPriceUnit,
            maxPriceUnit: property.maxSellPriceUnit,
          );
          priceRange[SaveDefaultData.propertyForSellId] = price;
        }
        if (isForRent) {
          price = propertyPriceValue(
            localizationsContext: localizationsContext,
            priceUnit: priceUnit,
            minimumPrice: property.minRentPrice,
            maximumPrice: property.maxRentPrice,
            minPriceUnit: property.minRentPriceUnit,
            maxPriceUnit: property.maxRentPriceUnit,
          );
          priceRange[SaveDefaultData.propertyForRentId] = price;
        }
        if (isForLease) {
          price = propertyPriceValue(
            localizationsContext: localizationsContext,
            priceUnit: priceUnit,
            minimumPrice: property.minLeasePrice,
            maximumPrice: property.maxLeasePrice,
            minPriceUnit: property.minLeasePriceUnit,
            maxPriceUnit: property.maxLeasePriceUnit,
          );
          priceRange[SaveDefaultData.propertyForLeaseId] = price;
        }
      }
    } else {
      priceRange[-1] = price;
    }
    return priceRange;
  }

  static LinkedHashMap<int, String> getInquiryFormattedPrice({
    required AppLocalizations localizationsContext,
    required DbSavedFilter? inquiry,
    String? priceUnitToForce, //currently used for showing Rs. in pdf
    bool showShortPrice = true, //if true 50 k else 50,000
  }) {
    final priceRange = LinkedHashMap<int, String>();
    String price = '';
    if (inquiry != null) {
      //TODO: Removed price unit symbol for displaying price in app
      // String priceUnit = priceUnitToForce ?? property.priceUnitValue ?? '';
      String priceUnit = priceUnitToForce ?? '';
      if (inquiry.propertyFor != null && inquiry.propertyFor!.isNotEmpty) {
        bool isForSell = inquiry.propertyFor!.firstWhereOrNull(
              (element) => element == SaveDefaultData.propertyForSellId,
            ) !=
            null;
        bool isForRent = inquiry.propertyFor!.firstWhereOrNull(
              (element) => element == SaveDefaultData.propertyForRentId,
            ) !=
            null;
        bool isForLease = inquiry.propertyFor!.firstWhereOrNull(
              (element) => element == SaveDefaultData.propertyForLeaseId,
            ) !=
            null;
        if (isForSell) {
          price = propertyPriceValue(
            localizationsContext: localizationsContext,
            priceUnit: priceUnit,
            minimumPrice: inquiry.sellPriceRangeMin,
            maximumPrice: inquiry.sellPriceRangeMax,
            minPriceUnit: inquiry.sellMinPriceUnit,
            maxPriceUnit: inquiry.sellMaxPriceUnit,
            isFromProperty: false,
            showShortPrice: showShortPrice,
          );
          priceRange[SaveDefaultData.propertyForSellId] = price;
        }
        if (isForRent) {
          price = propertyPriceValue(
            localizationsContext: localizationsContext,
            priceUnit: priceUnit,
            minimumPrice: inquiry.rentPriceRangeMin,
            maximumPrice: inquiry.rentPriceRangeMax,
            minPriceUnit: inquiry.rentMinPriceUnit,
            maxPriceUnit: inquiry.rentMaxPriceUnit,
            isFromProperty: false,
            showShortPrice: showShortPrice,
          );
          priceRange[SaveDefaultData.propertyForRentId] = price;
        }
        if (isForLease) {
          price = propertyPriceValue(
            localizationsContext: localizationsContext,
            priceUnit: priceUnit,
            minimumPrice: inquiry.leasePriceRangeMin,
            maximumPrice: inquiry.leasePriceRangeMax,
            minPriceUnit: inquiry.leaseMinPriceUnit,
            maxPriceUnit: inquiry.leaseMaxPriceUnit,
            isFromProperty: false,
            showShortPrice: showShortPrice,
          );
          priceRange[SaveDefaultData.propertyForLeaseId] = price;
        }
      } else {
        priceRange[-1] = price;
      }
    } else {
      priceRange[-1] = price;
    }
    return priceRange;
  }

  static String propertyPriceValue({
    required AppLocalizations localizationsContext,
    required String priceUnit,
    required double? minimumPrice,
    required double? maximumPrice,
    required int? minPriceUnit,
    required int? maxPriceUnit,
    bool isFromProperty = true,
    bool showShortPrice = true,
  }) {
    return (minimumPrice != null &&
            maximumPrice != null &&
            minimumPrice != maximumPrice)
        ? '${priceUnit.trim().isNotEmpty ? '$priceUnit' : ''}${(appendPriceUnit(
            localizationsContext: localizationsContext,
            priceUnit: minPriceUnit,
            showShortPrice: showShortPrice,
            price: removeTrailingZeros(
              (showShortPrice
                      ? shortPriceRangeValue(minimumPrice, minPriceUnit)
                      : minimumPrice)
                  .toString(),
            ),
          ))} -'
            ' ${priceUnit.trim().isNotEmpty ? '$priceUnit' : ''}${appendPriceUnit(
            localizationsContext: localizationsContext,
            priceUnit: maxPriceUnit,
            showShortPrice: showShortPrice,
            price: removeTrailingZeros(
              (showShortPrice
                      ? shortPriceRangeValue(maximumPrice, maxPriceUnit)
                      : maximumPrice)
                  .toString(),
            ),
          )}'
        : (minimumPrice != null &&
                maximumPrice != null &&
                minimumPrice == maximumPrice)
            ? '${priceUnit.trim().isNotEmpty ? '$priceUnit' : ''}${(appendPriceUnit(
                localizationsContext: localizationsContext,
                priceUnit: minPriceUnit,
                showShortPrice: showShortPrice,
                price: removeTrailingZeros(
                  (showShortPrice
                          ? shortPriceRangeValue(minimumPrice, minPriceUnit)
                          : minimumPrice)
                      .toString(),
                ),
              ))}'
            : (minimumPrice != null)
                ? '${!isFromProperty ? '${localizationsContext.minPriceRangeHint} ' : ''}${priceUnit.trim().isNotEmpty ? '$priceUnit' : ''}${(appendPriceUnit(
                    localizationsContext: localizationsContext,
                    priceUnit: minPriceUnit,
                    showShortPrice: showShortPrice,
                    price: '${removeTrailingZeros(
                      (showShortPrice
                              ? shortPriceRangeValue(minimumPrice, minPriceUnit)
                              : minimumPrice)
                          .toString(),
                    )}',
                  ))}'
                : (maximumPrice != null)
                    ? '${!isFromProperty ? '${localizationsContext.maxPriceRangeHint} ' : ''}${priceUnit.trim().isNotEmpty ? '$priceUnit' : ''}${appendPriceUnit(
                        localizationsContext: localizationsContext,
                        priceUnit: maxPriceUnit,
                        showShortPrice: showShortPrice,
                        price: '${removeTrailingZeros(
                          (showShortPrice
                                  ? shortPriceRangeValue(
                                      maximumPrice, maxPriceUnit)
                                  : maximumPrice)
                              .toString(),
                        )}',
                      )}'
                    : '';
  }

  // price Unit -> K, Lac, Cr
  static String appendPriceUnit({
    required AppLocalizations localizationsContext,
    required String price,
    required int? priceUnit,
    bool showShortPrice = true,
  }) {
    if (showShortPrice) {
      return '${formatPrice(price)} ${getPriceUnitShortString(
        localizationsContext,
        priceUnit,
      )}';
    } else {
      return '${formatPrice(price)}';
    }
  }

  static unFocusKeyboardIfAny(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.focusedChild?.unfocus();
    }
  }

  static String formatPrice(String s) {
    if (s.toString().trim().isNotEmpty) {
      return NumberFormat.decimalPattern(AppConfig.defaultLocaleForPriceFormat)
          .format(s.contains('.') ? double.parse(s) : int.parse(s));
    }
    return '';
  }

  static fieldCursorPositionAtLast(TextEditingController controller) {
    controller.selection = TextSelection.collapsed(
      offset: controller.text.length,
    );
  }

  static double getPropertyForTagAngle() {
    return -math.pi / 4;
  }

  static String changeDateFormat(
    DateTime dateTime,
    String outputFormat,
  ) {
    final dateFormat = DateFormat(outputFormat);
    return dateFormat.format(dateTime);
  }

  static statusBarColor({
    Color? statusBarColor,
    bool? isStatusBarTextBlack,
  }) {
    SystemChrome.setSystemUIOverlayStyle(
      (isStatusBarTextBlack ?? false)
          ? SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: statusBarColor,
              statusBarIconBrightness: Brightness.dark,
            )
          : SystemUiOverlayStyle.light.copyWith(
              statusBarColor: statusBarColor,
              statusBarIconBrightness: Brightness.light,
            ),
    );
  }

  static bool allCharactersSame(String s) {
    int n = s.length;
    for (int i = 1; i < n; i++) if (s[i] != s[0]) return false;
    return true;
  }

  static bool isValidPhoneNumber(String value) =>
      value.length == AppConfig.mobileNoFieldLength &&
      !allCharactersSame(value.replaceAll(" ", "")) &&
      RegExp(r'(^(?!0+$)[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)')
          .hasMatch(value.replaceAll(" ", ""));

  static bool isValidEmail(String value) => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(value);

  static bool isAppDarkMode(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark;
  }

  static Color getColor(BuildContext context, ColorEnum colorEnum) {
    var isDarkMode = isAppDarkMode(context);
    Color color;
    switch (colorEnum) {
      case ColorEnum.themeColor:
        {
          color = isDarkMode ? DarkColors.themeColor : LightColors.themeColor;
          break;
        }
      case ColorEnum.themeColorOpacity3Percentage:
        {
          color = isDarkMode
              ? DarkColors.themeColorOpacity3Percentage
              : LightColors.themeColorOpacity3Percentage;
          break;
        }
      case ColorEnum.blueColor:
        {
          color = isDarkMode ? DarkColors.blueColor : LightColors.blueColor;
          break;
        }
      case ColorEnum.darkThemeColor:
        {
          color = isDarkMode
              ? DarkColors.darkThemeColor
              : LightColors.darkThemeColor;
          break;
        }
      case ColorEnum.blackColor:
        {
          color = isDarkMode ? DarkColors.blackColor : LightColors.blackColor;
          break;
        }
      case ColorEnum.whiteColor:
        {
          color = isDarkMode ? DarkColors.whiteColor : LightColors.whiteColor;
          break;
        }
      case ColorEnum.disableThemeColor:
        {
          color = isDarkMode
              ? DarkColors.disableThemeColor
              : LightColors.disableThemeColor;
          break;
        }
      case ColorEnum.shadowColor:
        {
          color = isDarkMode ? DarkColors.shadowColor : LightColors.shadowColor;
          break;
        }
      case ColorEnum.darkBgOpacityColor:
        {
          color = isDarkMode
              ? DarkColors.darkBgOpacityColor
              : LightColors.darkBgOpacityColor;
          break;
        }
      case ColorEnum.lightBgOpacityColor:
        {
          color = isDarkMode
              ? DarkColors.lightBgOpacityColor
              : LightColors.lightBgOpacityColor;
          break;
        }
      case ColorEnum.statusBarColor:
        {
          color = isDarkMode
              ? DarkColors.statusBarColor
              : LightColors.statusBarColor;
          break;
        }
      case ColorEnum.transparentBlackColor:
        {
          color = isDarkMode
              ? DarkColors.transparentBlackColor
              : LightColors.transparentBlackColor;
          break;
        }
      case ColorEnum.grayColor:
        {
          color = isDarkMode ? DarkColors.grayColor : LightColors.grayColor;
          break;
        }
      case ColorEnum.gray90Color:
        {
          color = isDarkMode ? DarkColors.gray90Color : LightColors.gray90Color;
          break;
        }
      case ColorEnum.gray99Color:
        {
          color = isDarkMode ? DarkColors.gray99Color : LightColors.gray99Color;
          break;
        }
      case ColorEnum.greenColor:
        {
          color = isDarkMode ? DarkColors.greenColor : LightColors.greenColor;
          break;
        }
      case ColorEnum.greenMatchingColor:
        {
          color = isDarkMode
              ? DarkColors.greenMatchingColor
              : LightColors.greenMatchingColor;
          break;
        }
      case ColorEnum.themeColorOpacity10Percentage:
        {
          color = isDarkMode
              ? DarkColors.themeColorOpacity10Percentage
              : LightColors.themeColorOpacity10Percentage;
          break;
        }
      case ColorEnum.bottomSheetBarrierColor:
        {
          color = isDarkMode
              ? DarkColors.bottomSheetBarrierColor
              : LightColors.bottomSheetBarrierColor;
          break;
        }
      case ColorEnum.dropDownBgColor:
        {
          color = isDarkMode
              ? DarkColors.dropDownBgColor
              : LightColors.dropDownBgColor;
          break;
        }
      case ColorEnum.dropDownSelectedItemBgColor:
        {
          color = isDarkMode
              ? DarkColors.dropDownSelectedItemBgColor
              : LightColors.dropDownSelectedItemBgColor;
          break;
        }
      case ColorEnum.themeColorOpacity5Percentage:
        {
          color = isDarkMode
              ? DarkColors.themeColorOpacity5Percentage
              : LightColors.themeColorOpacity5Percentage;
          break;
        }
      case ColorEnum.themeColorOpacity6Percentage:
        {
          color = isDarkMode
              ? DarkColors.themeColorOpacity6Percentage
              : LightColors.themeColorOpacity6Percentage;
          break;
        }
      case ColorEnum.touchSplashColor:
        {
          color = isDarkMode
              ? DarkColors.touchSplashColor
              : LightColors.touchSplashColor;
          break;
        }
      case ColorEnum.deselectedColor:
        {
          color = isDarkMode
              ? DarkColors.deselectedColor
              : LightColors.deselectedColor;
          break;
        }
      case ColorEnum.toolbarDefaultColor:
        {
          color = isDarkMode
              ? DarkColors.toolbarDefaultColor
              : LightColors.toolbarDefaultColor;
          break;
        }
      case ColorEnum.dividerColor:
        {
          color =
              isDarkMode ? DarkColors.dividerColor : LightColors.dividerColor;
          break;
        }
      case ColorEnum.errorColor:
        {
          color = isDarkMode ? DarkColors.errorColor : LightColors.errorColor;
          break;
        }
      case ColorEnum.disableWhiteColor:
        {
          color = isDarkMode
              ? DarkColors.disableWhiteColor
              : LightColors.disableWhiteColor;
          break;
        }
      case ColorEnum.transparent:
        {
          color = Colors.transparent;
          break;
        }
      case ColorEnum.blueColorOpacity2Percentage:
        {
          color = isDarkMode
              ? DarkColors.blueColorOpacity2Percentage
              : LightColors.blueColorOpacity2Percentage;
          break;
        }
      case ColorEnum.blueColorOpacity5Percentage:
        {
          color = isDarkMode
              ? DarkColors.blueColorOpacity5Percentage
              : LightColors.blueColorOpacity5Percentage;
          break;
        }
      case ColorEnum.blueColorOpacity3Percentage:
        {
          color = isDarkMode
              ? DarkColors.blueColorOpacity3Percentage
              : LightColors.blueColorOpacity3Percentage;
          break;
        }
      case ColorEnum.grayAEColor:
        {
          color = isDarkMode ? DarkColors.grayAEColor : LightColors.grayAEColor;
          break;
        }
      case ColorEnum.borderColorE0:
        {
          color =
              isDarkMode ? DarkColors.borderColorE0 : LightColors.borderColorE0;
          break;
        }
      case ColorEnum.themeColorOpacity8Percentage:
        {
          color = isDarkMode
              ? DarkColors.themeColorOpacity8Percentage
              : LightColors.themeColorOpacity8Percentage;
          break;
        }
      case ColorEnum.redColor:
        {
          color = isDarkMode ? DarkColors.redColor : LightColors.redColor;
          break;
        }
      case ColorEnum.stickyHeaderBlueBgColor:
        {
          color = isDarkMode
              ? DarkColors.stickyHeaderBlueBgColor
              : LightColors.stickyHeaderBlueBgColor;
          break;
        }
      case ColorEnum.shimmerBaseColor:
        {
          color = isDarkMode
              ? DarkColors.shimmerBaseColor
              : LightColors.shimmerBaseColor;
          break;
        }
      case ColorEnum.shimmerHighlightColor:
        {
          color = isDarkMode
              ? DarkColors.shimmerHighlightColor
              : LightColors.shimmerHighlightColor;
          break;
        }
      case ColorEnum.pdfRowDarkColor:
        {
          color = isDarkMode
              ? DarkColors.pdfRowDarkColor
              : LightColors.pdfRowDarkColor;
          break;
        }
      case ColorEnum.pdfRowTitleTextColor:
        {
          color = isDarkMode
              ? DarkColors.pdfRowTitleTextColor
              : LightColors.pdfRowTitleTextColor;
          break;
        }
      default:
        {
          color = isDarkMode ? DarkColors.themeColor : LightColors.themeColor;
          break;
        }
    }
    return color;
  }

  static removeTrailingZeros(String n) {
    return n.replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
  }

  static Future<String?> getFirebaseDeviceToken() async {
    try {
      fcmToken = await FirebaseMessaging.instance.getToken();
      debugPrint('FCM TOKEN: $fcmToken');
    } catch (error) {
      debugPrint('$error');
    }
    return fcmToken;
  }

  static observeFirebaseDeviceTokenChange() {
    if (_firebaseMessagingTokenStreamSubscription != null) {
      _firebaseMessagingTokenStreamSubscription!.cancel();
    }
    _firebaseMessagingTokenStreamSubscription =
        FirebaseMessaging.instance.onTokenRefresh.listen(
      (event) {
        fcmToken = event;
        debugPrint('OnTokenChange: $fcmToken');
      },
    );
  }

  static Future<String?> getDeviceName() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (kIsWeb) {
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      deviceName = webBrowserInfo.userAgent;
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceName = androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceName = iosInfo.utsname.machine;
    } else {
      deviceName = '';
    }
    return deviceName;
  }

  static Future<String?> getDeviceOs() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (kIsWeb) {
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      return webBrowserInfo.appVersion;
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.version.release;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.systemVersion;
    } else {
      return '';
    }
  }

  static Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  static Future<String> getAppName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.appName;
  }

  static Future<void> openDialer(String phoneNumber) async {
    Uri callUrl = Uri.parse('tel:=$phoneNumber');
    if (await canLaunchUrl(callUrl)) {
      await launchUrl(callUrl);
    }
  }

  static cancelFlagsOnLogoutOrSessionTimeOut(IsarService isarService) async {
    if (userInfo != null) {
      userInfo!.isUserLoggedOut = true;
      await isarService.saveOrUpdateUserInfo(userInfo!);
    }
    await NotificationHelper.cancelReminders();
    await FirebaseMessaging.instance.deleteToken();
    StaticFunctions.fcmToken = null;
  }

  static bool needToShowLivePropertyIndication(DbProperty? property) {
    return property?.isPublicProperty == true &&
        property?.sharedByBrooon == false;
  }

  static bool needToShowLiveInquiryIndication(DbSavedFilter? inquiry) {
    return inquiry?.isPublicInquiry == true && inquiry?.sharedByBrooon == false;
  }

  static bool isPropertyLocationAvailable(DbProperty? property) {
    bool isAvailable = false;
    if (property != null) {
      if (property.sharedByBrooon) {
        isAvailable = property.publicAddressLandMark != null &&
            property.publicAddressLandMark!.isNotEmpty;
      } else {
        isAvailable = property.addressLandMark != null &&
            property.addressLandMark!.isNotEmpty;
      }
    }
    return isAvailable;
  }

  static bool isInquiryLocationAvailable(DbSavedFilter? inquiry) {
    bool isAvailable = false;
    if (inquiry != null) {
      if (inquiry.sharedByBrooon) {
        isAvailable = inquiry.location != null && inquiry.location!.isNotEmpty;
      } else {
        isAvailable = inquiry.location != null && inquiry.location!.isNotEmpty;
      }
    }
    return isAvailable;
  }

  static bool isPriceAvailable(String? priceToShow) {
    return priceToShow != null && priceToShow.trim().isNotEmpty;
  }

  static bool isActiveInactiveStatusTagNeedToShow(
      int? soldStatusId, int? statusId) {
    if (soldStatusId == SaveDefaultData.soldStatusId) {
      return false;
    }
    if (statusId == SaveDefaultData.activeStatusId) {
      return AppConfig.enableActiveTagForListItems;
    }
    return true;
  }

  static String propertyItemIdWithName(DbProperty property) {
    if (AppConfig.enableBuyerSellerNameWithId) {
      if (AppConfig.buyerSellerNameChangeOnSold) {
        return '${property.propertyId} | ${property.propertySoldStatusId == SaveDefaultData.soldStatusId ? property.closedDealBuyerName : property.sellerName}';
      } else {
        return '${property.propertyId} | ${property.sellerName}';
      }
    } else {
      return '${property.propertyId}';
    }
  }

  static String inquiryItemIdWithName(DbSavedFilter inquiry) {
    if (AppConfig.enableBuyerSellerNameWithId) {
      if (AppConfig.buyerSellerNameChangeOnSold) {
        return '${inquiry.inquiryId} | ${inquiry.inquirySoldStatusId == SaveDefaultData.soldStatusId ? inquiry.closedDealSellerName : inquiry.buyerName}';
      } else {
        return '${inquiry.inquiryId} | ${inquiry.buyerName}';
      }
    } else {
      return '${inquiry.inquiryId}';
    }
  }
}
