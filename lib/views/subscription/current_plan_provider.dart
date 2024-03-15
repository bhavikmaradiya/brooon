import 'package:flutter/material.dart';

import '../../const/routes.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/subscription/db_subscription_plan.dart';
import '../../network/dio_client.dart';
import '../../network/network_connectivity.dart';
import '../../utils/app_config.dart';
import '../../utils/choose_plan_from_enum.dart';
import '../../utils/full_screen_progress.dart';
import '../../utils/static_functions.dart';
import '../../utils/subscription_utils.dart';

class CurrentPlanProvider extends ChangeNotifier {
  final _isarService = IsarService();
  late BuildContext _context;
  DbSubscriptionPlan? currentPlan;
  bool isNetworkAvailable = true;

  init(BuildContext context) async {
    _context = context;
    await _retrieveCurrentPlanInfo();
    checkForSubscriptions();
  }

  _retrieveCurrentPlanInfo() async {
    final info = await _isarService.getSubscriptionPlanById(
      StaticFunctions.userInfo?.subscribedPlanId,
    );
    if (info != null) {
      currentPlan = info;
      currentPlan!.isExpired = SubscriptionUtils.checkUserSubscriptionExpired();
    }
    notifyListeners();
  }

  checkForSubscriptions() async {
    if (currentPlan == null) {
      final isOnline = await NetworkConnectivity.hasNetwork();
      isNetworkAvailable = isOnline;
      FullScreenProgress.showFullScreenProgress(_context, true);
    }
    _getSubscriptionPlans();
  }

  _getSubscriptionPlans() async {
    List<DbSubscriptionPlan> plansList = [];
    final response = await DioClient().getSubscriptionPlans();
    final plans = response?.data?.plans;
    if (plans != null && plans.isNotEmpty) {
      await _isarService.deletePlans();
      plansList.clear();
      plans.forEach(
        (element) {
          plansList.add(
            DbSubscriptionPlan()
              ..id = element.id!
              ..type = element.type
              ..planId = element.planId
              ..title = element.title
              ..description = element.description
              ..duration = element.duration
              ..price = element.price,
          );
        },
      );
      await _isarService.saveSubscriptions(plansList);
      notifyListeners();
    }
    if (plansList.isNotEmpty) {
      _retrieveCurrentPlanInfo();
    }
    FullScreenProgress.showFullScreenProgress(_context, false);
  }

  upgradePlan() {
    if (AppConfig.enabledSubscriptionFeature) {
      Navigator.pushNamed(
        _context,
        Routes.subscription,
        arguments: ChoosePlanFrom.drawerUpgradePlan,
      );
    }
  }

  viewPurchaseHistory() {
    Navigator.pushNamed(
      _context,
      Routes.purchaseHistory,
    );
  }
}
