import './app_config.dart';
import './static_functions.dart';

class SubscriptionUtils {
  static bool _isPremiumPlan() {
    final subscribedPlanType = StaticFunctions.userInfo?.subscribedPlanType;
    if (subscribedPlanType != null) {
      return subscribedPlanType
              .toLowerCase()
              .contains(AppConfig.goldPlanType) ||
          subscribedPlanType.toLowerCase().contains(AppConfig.platinumPlanType);
    }
    return false;
  }

  static bool _isFreePlan() {
    final subscribedPlanType = StaticFunctions.userInfo?.subscribedPlanType;
    if (subscribedPlanType != null) {
      return subscribedPlanType
          .toLowerCase()
          .contains(AppConfig.freeTrialPlanType);
    }
    return false;
  }

  static bool checkUserSubscriptionExpired() {
    final expiredAt = StaticFunctions.userInfo?.appSubscriptionEndTime ??
        DateTime.fromMillisecondsSinceEpoch(0);
    final currentDateTime = DateTime.now();
    return currentDateTime.isAfter(expiredAt);
  }

  static Future<bool> checkForUserHasActiveSubscriptionPlan() async {
    // check user's current plan expired or not if expired means not active
    // If not expired then check user current plan is not free trial one!
    final isSubscriptionExpired = checkUserSubscriptionExpired();
    if (!isSubscriptionExpired) {
      if (_isFreePlan()) {
        return AppConfig.enabledSharedByBrooonForFreePlan;
      } else if (_isPremiumPlan()) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
