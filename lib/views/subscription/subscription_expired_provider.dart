import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common_property_data_provider.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/subscription/db_subscription_plan.dart';
import '../../network/dio_client.dart';
import '../../utils/app_config.dart';
import '../../utils/full_screen_progress.dart';
import '../../utils/static_functions.dart';
import '../../widgets/snack_bar_view.dart';

class SubscriptionExpiredProvider extends ChangeNotifier {
  DbSubscriptionPlan? planInfo;
  final _isarService = IsarService();
  late AppLocalizations localizationsContext;

  init(AppLocalizations localizationsContext) async {
    this.localizationsContext = localizationsContext;
    planInfo = await _isarService.getSubscriptionPlanById(
      StaticFunctions.userInfo?.subscribedPlanId,
    );
    notifyListeners();
  }

  launchURL(BuildContext context) async {
    const url = AppConfig.paymentUrl;
    try {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } catch (_) {
      SnackBarView.showSnackBar(
        context,
        localizationsContext.unableToLaunchPayment,
      );
    }
  }

  verifyPlan(BuildContext context) async {
    FullScreenProgress.showFullScreenProgress(context, true);
    final response = await DioClient().checkPurchase();
    FullScreenProgress.showFullScreenProgress(context, false);
    if (response != null) {
      if (response.success == true && response.data != null) {
        if (response.data!.planId != null &&
            response.data!.planType != null &&
            response.data!.planType!.trim().isNotEmpty) {
          await _savePlan(response.data!.planId!, response.data!.planType!,
              response.data?.totalExpiredAt ?? 0);
          if (response.data!.purchaseId != null &&
              response.data!.purchaseId!.trim().isNotEmpty) {
            // update local purchase status
            await _isarService
                .updatePurchasedStatus(response.data!.purchaseId!);
          }
          final _commonDataProvider = Provider.of<CommonPropertyDataProvider>(
            context,
            listen: false,
          );
          _commonDataProvider.updateSubscriptionStatus(
              localizationsContext: localizationsContext);
          FullScreenProgress.showFullScreenProgress(context, false);
          if (DateTime.now().millisecondsSinceEpoch <
              (response.data?.totalExpiredAt ?? 0)) {
            Navigator.pop(context);
          } else {
            SnackBarView.showSnackBar(
                context, localizationsContext.paymentExpired, durationInSec: 3);
          }
        }
      } else {
        FullScreenProgress.showFullScreenProgress(context, false);
        SnackBarView.showSnackBar(context, response.message ?? '');
      }
    } else {
      FullScreenProgress.showFullScreenProgress(context, false);
    }
  }

  _savePlan(int selectedPlanId, String planType, int expiredAt) async {
    final userInfo = await _isarService.getUserInfo();
    if (userInfo != null) {
      userInfo.subscribedPlanId = selectedPlanId;
      userInfo.subscribedPlanType = planType;
      userInfo.appSubscriptionEndTime = DateTime.fromMillisecondsSinceEpoch(
        expiredAt,
      );
      await _isarService.saveOrUpdateUserInfo(userInfo);
    }
  }
}
