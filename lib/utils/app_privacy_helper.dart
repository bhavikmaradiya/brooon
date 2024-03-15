import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import './static_functions.dart';
import '../const/routes.dart';
import '../const/string_const.dart';
import '../localdb/isar_service.dart';
import '../widgets/dialog_widget.dart';

enum RedirectionFromForPrivacyCheck {
  splash,
  login,
  home,
}

class AppPrivacyHelper {
  static const _bufferOnTimeDifference = 300000; // 5 min = 300000 millisecond

  // check for app privacy status
  // If user is trying to use app with past dates than login date
  // Then user will be redirected to login screen
  static Future<bool> checkForPrivacy(
    BuildContext context,
    RedirectionFromForPrivacyCheck from,
    IsarService isarService,
  ) async {
    bool isPrivacyBreak = false;
    final privacyLog = await isarService.getAppPrivacyLogs();
    if (privacyLog != null) {
      // update app open time from splash and login
      // here we included login because if user is trying to login with past date
      // then we are not allowing at login time instantly.
      if (from == RedirectionFromForPrivacyCheck.splash ||
          from == RedirectionFromForPrivacyCheck.login) {
        privacyLog.appOpenTime = DateTime.now();
        await isarService.savePrivacyLogInfo(privacyLog);
        // if we need to check date difference at time of splash also
        // then remove below return statement
        if (from == RedirectionFromForPrivacyCheck.splash) {
          return isPrivacyBreak;
        }
      }
      // check if user is running app with past dates:
      if (privacyLog.appLoginTime!.isAfter(privacyLog.appOpenTime!)) {
        final dateDifference = privacyLog.appLoginTime!.millisecondsSinceEpoch -
            privacyLog.appOpenTime!.millisecondsSinceEpoch;
        if (dateDifference > _bufferOnTimeDifference) {
          isPrivacyBreak = true;
          // show login screen directly as user is trying with changing system dates
          StaticFunctions.cancelFlagsOnLogoutOrSessionTimeOut(
            isarService,
          );
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              AppLocalizations localizationsContext =
                  AppLocalizations.of(context)!;
              return DialogWidget(
                title: localizationsContext.privacyBreakMessage,
                icon: Strings.iconWarning,
                positiveButton: localizationsContext.privacyBreakLogin,
                isDialogCancellable: false,
                onPositiveButtonClick: () async {
                  Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.authenticationRoute,
                    (route) => false,
                  );
                },
              );
            },
          );
        }
      }
    }
    return isPrivacyBreak;
  }
}
