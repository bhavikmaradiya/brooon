import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../const/routes.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/notification/db_notifications.dart';
import '../../main.dart';
import '../../utils/date_utils.dart';
import '../../utils/enums.dart';
import '../view_all_property/model/view_all_screen_arg.dart';

class NotificationsProvider extends ChangeNotifier {
  final _isarService = IsarService();
  List<DbNotification> notificationsList = [];
  StreamSubscription<void>? _notificationChangeListener;

  init() async {
    _getNotifications();
    _refreshNotificationCounts();
    notifyListeners();
  }

  _getNotifications() async {
    final currentDate = DateTime.now();
    notificationsList = (await _isarService.getNotifications())
        .where((element) =>
            element.type != NotificationType.reminder.name ||
            currentDate.compareTo(element.dateTime) != -1)
        .toList();
    notifyListeners();
  }

  onNotificationSelect(BuildContext context, int id) async {
    AppLocalizations? localizationsContext = AppLocalizations.of(context)!;
    final _notification =
        notificationsList.firstWhereOrNull((element) => element.id == id);
    if (_notification != null) {
      if (_notification.type == NotificationType.reminder.name) {
        DateTime? selectedDate = _notification.dateTime.applyTimeOfDay(
          timeOfDay: TimeOfDay(hour: 0, minute: 0),
        );
        Navigator.pushNamed(
          context,
          Routes.reminder,
          arguments: selectedDate,
        ).then((value) async {
          _switchReadStatusOf(_notification);
        });
      } else if (_notification.type == NotificationType.pushNotification.name) {
        String? routeToRedirect;
        var arguments = null;

        if (_notification.subType != null) {
          if (_notification.subType ==
              NotificationSubType.publicProperty.name) {
            routeToRedirect = Routes.viewAllProperties;
            arguments = ViewAllScreenArg(
              showDataFor: ViewAllFromType.brooonProperties,
              heading: localizationsContext.viewAllProperties,
              count: 0,
              viewAllFromToHandleTabs:
                  ViewAllTabsVisibilityType.fromPropertiesNotification,
            );
          } else if (_notification.subType ==
              NotificationSubType.publicInquiry.name) {
            routeToRedirect = Routes.viewAllProperties;
            arguments = ViewAllScreenArg(
              showDataFor: ViewAllFromType.brooonInquiries,
              heading: localizationsContext.viewAllInquiries,
              count: 0,
              viewAllFromToHandleTabs:
                  ViewAllTabsVisibilityType.fromInquiriesNotification,
            );
          }
        }
        _switchReadStatusOf(_notification);
        notificationPlugin.cancel(
          _notification.id,
          tag: _notification.id.toString(),
        );
        if (routeToRedirect != null) {
          Navigator.pushNamed(
            context,
            routeToRedirect,
            arguments: arguments,
          );
        }
      }
    }
  }

  _switchReadStatusOf(DbNotification notification) async {
    if (!notification.isRead) {
      notification.isRead = true;
      await _isarService.saveNotification(notification);
      notifyListeners();
    }
  }

  _refreshNotificationCounts() async {
    final onNotificationChanges =
        await _isarService.watchOnNotificationChanges();
    _notificationChangeListener = onNotificationChanges.listen((event) async {
      await _getNotifications();
    });
  }

  onDispose() {
    _notificationChangeListener?.cancel();
  }
}
