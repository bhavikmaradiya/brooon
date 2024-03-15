import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/routes.dart';
import '../../utils/app_config.dart';
import '../../utils/choose_plan_from_enum.dart';
import '../../utils/subscription_utils.dart';
import '../authentication/auth_provider.dart';
import '../profile/profile_from_enum.dart';

class NavigatorHelper {
  static openScreenAfterLogin(
    BuildContext context,
    bool isNeedToCheckForRestoreBackup,
  ) {
    final AuthProvider provider = Provider.of<AuthProvider>(
      context,
      listen: false,
    );
    provider.getUserInfo().then(
      (userInfo) {
        if (isNeedToCheckForRestoreBackup &&
            userInfo?.backupTakenAt != null &&
            provider.requiredToShowRestoreOption) {
          Navigator.pushReplacementNamed(
            context,
            Routes.restoreBackup,
          );
        } else if (userInfo?.firstName == null ||
            userInfo!.firstName!.trim().isEmpty ||
            userInfo.lastName == null ||
            userInfo.lastName!.trim().isEmpty) {
          Navigator.pushReplacementNamed(
            context,
            Routes.profile,
            arguments: ProfileFrom.login,
          );
        } else if (AppConfig.enabledSubscriptionFeature &&
            SubscriptionUtils.checkUserSubscriptionExpired()) {
          Navigator.pushReplacementNamed(
            context,
            Routes.subscription,
            arguments: ChoosePlanFrom.splash,
          );
        } else {
          Navigator.pushReplacementNamed(context, Routes.home);
        }
      },
    );
  }
}
