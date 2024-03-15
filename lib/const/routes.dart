import 'package:flutter/material.dart';

import '../views/add_buyer/add_buyer.dart';
import '../views/add_buyer/widget/add_buyer_success.dart';
import '../views/add_property/add_property_widget.dart';
import '../views/add_property/widgets/add_property_success.dart';
import '../views/amenities_management/amenities_management.dart';
import '../views/app_feedback/app_feedback.dart';
import '../views/authentication/authentication.dart';
import '../views/authentication/otp_verification.dart';
import '../views/authentication/otp_verified.dart';
import '../views/backup/backup.dart';
import '../views/backup/restore_backup.dart';
import '../views/blocked_broooners/blocked_broooners.dart';
import '../views/buyers_sellers/buyer_seller.dart';
import '../views/cast_management/cast_management.dart';
import '../views/choose_location/choose_location.dart';
import '../views/choose_location/search_location.dart';
import '../views/config_options/config_options.dart';
import '../views/filter/filter.dart';
import '../views/help/help.dart';
import '../views/home/home.dart';
import '../views/inquiry_details/inquiry_details.dart';
import '../views/notifications/notifications.dart';
import '../views/other_misc_items/other_misc_items.dart';
import '../views/profile/profile.dart';
import '../views/property_details/property_details.dart';
import '../views/purchase_history/purchase_history.dart';
import '../views/radius/radius.dart';
import '../views/reminder/add_reminder.dart';
import '../views/reminder/reminder.dart';
import '../views/settings/setting_options.dart';
import '../views/settings/settings.dart';
import '../views/subscription/current_plan.dart';
import '../views/subscription/subscription.dart';
import '../views/subscription/subscription_expired.dart';
import '../views/unit_converter/unit_converter.dart';
import '../views/view_all_property/view_all_properties.dart';
import '../views/visitors/visitors.dart';
import '../views/walk_through/walk_through.dart';
import '../views/watermark/property_watermark.dart';
import '../views/webview/webview_widget.dart';
import '../widgets/photo_gallery/photo_gallery.dart';

class Routes {
  static const String walkThroughRoute = '/walkThrough';
  static const String authenticationRoute = '/authentication';
  static const String otpVerificationRoute = '/otpVerification';
  static const String otpVerified = '/otpVerified';
  static const String filter = '/filter';
  static const String settings = '/settings';
  static const String settingOptions = '/settingOptions';
  static const String help = '/help';
  static const String feedback = '/feedback';
  static const String webView = '/webViewWidget';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String propertyDetail = '/propertyDetails';
  static const String inquiryDetail = '/inquiryDetails';
  static const String viewAllProperties = '/viewAllProperties';
  static const String addProperty = '/addProperty';
  static const String photoGallery = '/photoGallery';
  static const String castManagement = '/castManagement';
  static const String amenitiesManagement = '/amenityManagement';
  static const String unitConverter = '/unitConverter';
  static const String chooseLocation = '/chooseLocation';
  static const String searchArea = '/searchArea';
  static const String reminder = '/reminder';
  static const String addReminder = '/addReminder';
  static const String notification = '/notifications';
  static const String subscription = '/subscription';
  static const String purchaseHistory = '/purchaseHistory';
  static const String buyers = '/buyers';
  static const String sellers = '/sellers';
  static const String radius = '/radius';
  static const String propertyWatermark = '/propertyWatermark';
  static const String restoreBackup = '/restoreBackup';
  static const String backup = '/backup';
  static const String currentPlan = '/currentPlan';
  static const String addPropertySuccess = '/addPropertySuccess';
  static const String addBuyer = '/addBuyer';
  static const String addBuyerSuccess = '/addBuyerSuccess';
  static const String visitors = '/visitors';
  static const String configOptions = '/configOptions';
  static const String blockedBroooners = '/blockedBroooners';
  static const String otherMiscItem = '/otherMiscItem';
  static const String subscriptionExpired = '/subscriptionExpired';

  static Map<String, WidgetBuilder> get routeList => {
        walkThroughRoute: (_) => WalkThrough(),
        authenticationRoute: (_) => const Authentication(),
        otpVerificationRoute: (_) => const OtpVerification(),
        otpVerified: (_) => OtpVerified(),
        filter: (_) => Filter(),
        settings: (_) => Settings(),
        settingOptions: (_) => SettingOptions(),
        help: (_) => Help(),
        feedback: (_) => AppFeedback(),
        webView: (_) => WebViewWidget(),
        home: (_) => Home(),
        profile: (_) => Profile(),
        propertyDetail: (_) => PropertyDetails(),
        inquiryDetail: (_) => InquiryDetails(),
        viewAllProperties: (_) => ViewAllProperties(),
        addProperty: (_) => AddProperty(),
        photoGallery: (_) => PhotoGallery(),
        castManagement: (_) => CastManagement(),
        amenitiesManagement: (_) => AmenitiesManagement(),
        unitConverter: (_) => UnitConverter(),
        chooseLocation: (_) => ChooseLocation(),
        searchArea: (_) => SearchLocation(),
        reminder: (_) => Reminder(),
        addReminder: (_) => AddReminder(),
        notification: (_) => Notifications(),
        subscription: (_) => Subscription(),
        purchaseHistory: (_) => PurchaseHistory(),
        buyers: (_) => BuyerSeller(),
        sellers: (_) => BuyerSeller(),
        radius: (_) => ChooseRadius(),
        propertyWatermark: (_) => PropertyWatermark(),
        restoreBackup: (_) => RestoreBackup(),
        backup: (_) => Backup(),
        currentPlan: (_) => CurrentPlan(),
        addPropertySuccess: (_) => AddPropertySuccess(),
        addBuyer: (_) => AddBuyer(),
        addBuyerSuccess: (_) => AddBuyerSuccess(),
        visitors: (_) => Visitors(),
        configOptions: (_) => ConfigOptions(),
        blockedBroooners: (_) => BlockedBroooners(),
        otherMiscItem: (_) => OtherMiscItems(),
        subscriptionExpired: (_) => SubscriptionExpired(),
      };
}
