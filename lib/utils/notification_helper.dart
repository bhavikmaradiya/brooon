import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as notification;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart';
import 'package:timezone/timezone.dart' as tz;

import './app_config.dart';
import './enums.dart';
import './static_functions.dart';
import '../common_property_data_provider.dart';
import '../const/routes.dart';
import '../const/string_const.dart';
import '../localdb/isar_service.dart';
import '../localdb/notification/db_notifications.dart';
import '../localdb/properties/db_property.dart';
import '../localdb/reminder/db_reminder.dart';
import '../localdb/save_default_data.dart';
import '../main.dart';
import '../utils/date_utils.dart';
import '../views/view_all_property/model/view_all_screen_arg.dart';

//https://itnext.io/local-notifications-in-flutter-6136235e1b51

class NotificationHelper {
  static final _isarService = IsarService();
  static const String payloadKeyNotificationMainType = 'notificationMainType';
  static const String payloadKeyNotificationSubType = 'notificationType';
  static const String payloadKeyNotificationActiveInactiveStatus = 'status';
  static const String payloadKeyNotificationPropertyId = 'propertyId';
  static const String payloadKeyNotificationTimeStamp = 'timestamp';
  static const String payloadKeyNotificationId = 'notificationId';
  static const String payloadKeyNotificationTitle = 'notificationTitle';
  static const String payloadKeyNotificationBody = 'notificationBody';
  static const String payloadKeyReminderId = 'reminderId';

  static Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 75,
      colors: true,
      printEmojis: true,
      printTime: false,
    ),
  );

  static initNotifications(
      notification.FlutterLocalNotificationsPlugin notificationPlugin) async {
    var initializationSettingsAndroid =
        notification.AndroidInitializationSettings(Strings.notificationIcon);
    var initializationSettingsIOS = notification.DarwinInitializationSettings(
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async =>
                _onNotificationClicked(payload));
    var initializationSettings = notification.InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await notificationPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (response) =>
          _onNotificationClicked(response.payload),
      onDidReceiveBackgroundNotificationResponse:
          onDidReceiveBackgroundNotificationResponse,
    );
    await notificationPlugin
        .resolvePlatformSpecificImplementation<
            notification.IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    listenFCM();
    logger.i("Notifications initialised successfully");
  }

  static _createFCMChannel() async {
    const AndroidNotificationChannel fcmChannel = AndroidNotificationChannel(
      AppConfig.fcmNotificationChannelId,
      AppConfig.fcmNotificationChannelName,
      description: AppConfig.fcmNotificationChannelDesc,
      importance: Importance.max,
      enableLights: true,
      enableVibration: false,
      playSound: true,
      showBadge: true,
    );
    await notificationPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(fcmChannel);
  }

  static listenFCM() async {
    await _createFCMChannel();
    FirebaseMessaging.onBackgroundMessage(fcmBackgroundMessageHandler);
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      _onFCMNotificationClicked(message);
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      final payloadJson = fcmToJsonPayload(message);
      logger.w('onMessage Received:: $payloadJson');
      RemoteNotification? notification = message.notification;
      final data = message.data;
      if (notification != null &&
          data.isNotEmpty &&
          data.containsKey(payloadKeyNotificationId)) {
        int notificationId = int.parse(data[payloadKeyNotificationId]);
        final notificationSubType = data[payloadKeyNotificationSubType];
        final loggedUser = await _isarService.getUserInfo();
        if (loggedUser != null &&
            await _isNotificationEnabled() &&
            await _isarService.checkIfNotificationExistsWith(
                    notificationId: notificationId) ==
                null) {
          await _saveFCMNotification(payloadJson);
          if (!Platform.isIOS) {
            notificationPlugin.show(
              notificationId,
              notification.title,
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(
                  AppConfig.fcmNotificationChannelId,
                  AppConfig.fcmNotificationChannelName,
                  channelDescription: AppConfig.fcmNotificationChannelDesc,
                  visibility: NotificationVisibility.public,
                  enableVibration: false,
                  enableLights: true,
                  playSound: true,
                  channelShowBadge: true,
                  priority: Priority.high,
                  importance: Importance.high,
                  tag: notificationId.toString(),
                ),
                iOS: DarwinNotificationDetails(
                  presentBadge: true,
                  presentSound: true,
                ),
              ),
              payload: payloadJson,
            );
          }
        }
      }
    });
  }

  static Future<bool> _isNotificationEnabled() async {
    final loggedUser = await _isarService.getUserInfo();
    if (StaticFunctions.userId == -1 && loggedUser != null) {
      StaticFunctions.userId = loggedUser.id;
    }
    return (await _isarService
                .getSettingOf(SaveDefaultData.settingPublicPropertyId))
            ?.isChecked ??
        true;
  }

  static Future<DbNotification> _saveFCMNotification(String data) async {
    final loggedUser = await _isarService.getUserInfo();
    final payload = jsonDecode(data);
    final notificationId = int.parse(payload[payloadKeyNotificationId]);
    final notificationMainType = payload[payloadKeyNotificationMainType];
    final notificationSubtype = payload[payloadKeyNotificationSubType];
    final notificationStatus =
        payload[payloadKeyNotificationActiveInactiveStatus];
    final notificationPropertyId = payload[payloadKeyNotificationPropertyId];
    final title = payload[payloadKeyNotificationTitle];
    final body = payload[payloadKeyNotificationBody];
    final timeStamp = DateTime.fromMillisecondsSinceEpoch(
        int.parse(payload[payloadKeyNotificationTimeStamp]));
    DbNotification dbNotification = DbNotification();
    dbNotification.id = notificationId;
    dbNotification.icon = _getFCMNotificationIcon(notificationSubtype);
    dbNotification.userId = loggedUser?.id;
    dbNotification.dateTime = timeStamp;
    dbNotification.propertyId = notificationPropertyId;
    dbNotification.activeInactiveStatus = notificationStatus;
    dbNotification.subType = notificationSubtype;
    dbNotification.title = title;
    dbNotification.description = body;
    dbNotification.type = notificationMainType;
    final isNotificationEnabled = await _isNotificationEnabled();
    final doesNotificationExists = await _isarService
            .checkIfNotificationExistsWith(notificationId: notificationId) !=
        null;
    final shouldSaveNotification =
        isNotificationEnabled && loggedUser != null && !doesNotificationExists;
    if (shouldSaveNotification) {
      await _isarService.saveNotification(dbNotification);
      logger.i('Notification has been saved:: $payload');
    } else {
      logger.e(
          'Couldn\'t save notification due to:: \nNotification Settings: $isNotificationEnabled \nLogged in user: ${loggedUser?.isActiveUser ?? false} \nNotification already saved: $doesNotificationExists \nNotification type was $notificationSubtype');
    }
    return dbNotification;
  }

  static String _getFCMNotificationIcon(String type) {
    String notificationIcon = Strings.iconNotification;
    if (type.compareTo(NotificationSubType.publicProperty.name) == 0) {
      notificationIcon = Strings.iconPropertyNotification;
    } else if (type.compareTo(NotificationSubType.publicInquiry.name) == 0) {
      notificationIcon = Strings.iconInquiryNotification;
    } else if (type.compareTo(NotificationSubType.propertyStatus.name) == 0) {
      notificationIcon = Strings.iconNotification;
    } else if (type.compareTo(NotificationSubType.sold.name) == 0) {
      notificationIcon = Strings.iconSoldNotification;
    }
    return notificationIcon;
  }

  static void _onNotificationClicked(String? payload) {
    if (payload != null && payload.trim().isNotEmpty) {
      handleNotification(payload);
    }
  }

  static Future<void> fcmBackgroundMessageHandler(RemoteMessage message) async {
    if (message.notification != null &&
        message.data.isNotEmpty &&
        message.data.containsKey(NotificationHelper.payloadKeyNotificationId)) {
      final jsonPayload = fcmToJsonPayload(message);
      logger.w('onBackground message:: $jsonPayload');
      await _saveFCMNotification(jsonPayload);
    }
  }

  static _onFCMNotificationClicked(RemoteMessage message) {
    if (message.notification != null &&
        message.data.isNotEmpty &&
        message.data.containsKey(NotificationHelper.payloadKeyNotificationId)) {
      final jsonPayload = fcmToJsonPayload(message);
      handleNotification(jsonPayload);
    }
  }

  static String fcmToJsonPayload(RemoteMessage message) {
    final payload = HashMap<String, dynamic>();
    payload[NotificationHelper.payloadKeyNotificationMainType] =
        NotificationType.pushNotification.name;
    if (message.notification != null) {
      payload[NotificationHelper.payloadKeyNotificationTitle] =
          message.notification!.title;
      payload[NotificationHelper.payloadKeyNotificationBody] =
          message.notification!.body;
    }
    if (message.data[NotificationHelper.payloadKeyNotificationTimeStamp] ==
        null) {
      payload[NotificationHelper.payloadKeyNotificationTimeStamp] =
          (message.sentTime ?? DateTime.now())
              .millisecondsSinceEpoch
              .toString();
    }
    payload.addAll(message.data);
    return jsonEncode(payload);
  }

  @pragma('vm:entry-point')
  static void onDidReceiveBackgroundNotificationResponse(
    notification.NotificationResponse response,
  ) {
    if (response.payload != null && response.payload!.trim().isNotEmpty) {
      handleNotification(response.payload!);
    }
  }

  static handleNotification(String payload) async {
    final loggedUser = await _isarService.getUserInfo();
    if (loggedUser != null && await _isNotificationEnabled()) {
      logger.w('onNotification Clicked:: $payload');
      await _changeNotificationStatusOnClick(payload);
      await _handleNotificationRedirection(payload);
    }
  }

  static _handleNotificationRedirection(String payload) async {
    AppLocalizations? localizationsContext;
    if (navigatorKey.currentContext != null) {
      localizationsContext = AppLocalizations.of(navigatorKey.currentContext!)!;
    }
    final notificationPayload = jsonDecode(payload);
    final notificationId =
        notificationPayload[payloadKeyNotificationId] is String
            ? int.parse(notificationPayload[payloadKeyNotificationId])
            : notificationPayload[payloadKeyNotificationId];
    final notificationType =
        notificationPayload[payloadKeyNotificationMainType]! as String;
    final notificationSubType =
        notificationPayload[payloadKeyNotificationSubType] as String?;
    final reminderId = notificationPayload[payloadKeyReminderId] as int?;
    if (notificationType.compareTo(NotificationType.reminder.name) == 0) {
      if (reminderId != null) {
        final notification = await _isarService.checkIfNotificationExistsWith(
          reminderId: reminderId,
          notificationId: notificationId,
        );
        DateTime? selectedDate;
        if (notification != null) {
          selectedDate = notification.dateTime.applyTimeOfDay(
            timeOfDay: TimeOfDay(hour: 0, minute: 0),
          );
        }
        navigatorKey.currentState?.pushNamed(
          Routes.reminder,
          arguments: selectedDate,
        );
      }
    } else if (notificationType
            .compareTo(NotificationType.pushNotification.name) ==
        0) {
      String routeToRedirect = Routes.notification;
      var arguments = null;
      if (notificationSubType != null) {
        if (notificationSubType == NotificationSubType.publicProperty.name) {
          //TODO We have to redirect to view all screen later when notification clicked
          // routeToRedirect = Routes.viewAllProperties;
          arguments = ViewAllScreenArg(
            showDataFor: ViewAllFromType.brooonProperties,
            heading: localizationsContext != null
                ? localizationsContext.viewAllProperties
                : '',
            count: 0,
            viewAllFromToHandleTabs:
                ViewAllTabsVisibilityType.fromPropertiesNotification,
          );
        } else if (notificationSubType ==
            NotificationSubType.publicInquiry.name) {
          //TODO We have to redirect to view all screen later when notification clicked
          // routeToRedirect = Routes.viewAllProperties;
          arguments = ViewAllScreenArg(
            showDataFor: ViewAllFromType.brooonInquiries,
            heading: localizationsContext != null
                ? localizationsContext.viewAllInquiries
                : '',
            count: 0,
            viewAllFromToHandleTabs:
                ViewAllTabsVisibilityType.fromInquiriesNotification,
          );
        }
      }

      if (navigatorKey.currentContext != null) {
        bool isRouteAlreadyOpened = false;
        Navigator.popUntil(
          navigatorKey.currentContext!,
          (route) {
            if (route.settings.name == routeToRedirect) {
              isRouteAlreadyOpened = true;
            }
            return true;
          },
        );
        if (!isRouteAlreadyOpened) {
          navigatorKey.currentState?.pushNamed(
            routeToRedirect,
            arguments: arguments,
          );
        }
      }
    }
  }

  static _changeNotificationStatusOnClick(String payload) async {
    final notificationPayload = jsonDecode(payload);
    final notificationType =
        notificationPayload[payloadKeyNotificationMainType]! as String;
    final notificationId =
        notificationPayload[payloadKeyNotificationId] is String
            ? int.parse(notificationPayload[payloadKeyNotificationId])
            : notificationPayload[payloadKeyNotificationId];
    final reminderId = notificationPayload[payloadKeyReminderId] as int?;
    final isReminderNotification =
        notificationType.compareTo(NotificationType.reminder.name) == 0 &&
            reminderId != null;
    final reminder = isReminderNotification
        ? await _isarService.checkIfReminderExists(reminderId)
        : null;

    //Change status unread to read, or save new notification if it doesn't exist when notification is clicked
    if (reminder != null) {
      DbNotification notificationToSave = DbNotification();
      if (reminder.reminderForAllDay) {
        final currentDate = DateTime.now();
        final time = currentDate.applyTimeOfDay(
          timeOfDay: TimeOfDay.fromDateTime(reminder.selectedTime!),
        );
        final notification = await _isarService.checkIfNotificationExistsWith(
          notificationId: notificationId,
          dateTime: time,
          reminderId: reminder.id,
          reminderForAllDay: true,
        );
        final oldNotification = notification == null
            ? await _isarService.checkIfNotificationExistsWith(
                notificationId: notificationId,
                reminderId: reminder.id,
                reminderForAllDay: true,
              )
            : notification;
        notificationToSave = oldNotification!;
        if (notification == null) {
          notificationToSave.id =
              await NotificationHelper._getNextNotificationId();
          notificationToSave.dateTime = time;
        }
      } else {
        notificationToSave = (await _isarService.checkIfNotificationExistsWith(
          notificationId: notificationId,
          reminderId: reminderId,
          reminderForAllDay: false,
        ))!;
      }
      notificationToSave.isRead = true;
      await _isarService.saveNotification(notificationToSave);
    } else if (notificationType == NotificationType.pushNotification.name) {
      DbNotification? fcmNotification =
          await _isarService.checkIfNotificationExistsWith(
        notificationId: notificationId,
      );
      if (fcmNotification == null) {
        fcmNotification = await _saveFCMNotification(payload);
      }
      if (await _isarService.checkIfNotificationExistsWith(
              notificationId: notificationId) !=
          null) {
        fcmNotification.isRead = true;
        await _isarService.saveNotification(fcmNotification);
      }
    }
  }

  static rescheduleReminders({
    bool shouldCancelFirst = true,
  }) async {
    if (shouldCancelFirst) {
      await cancelReminders();
    }
    bool isNotificationEnabled = (await _isarService.getSettings())
            .firstWhereOrNull((element) =>
                element.settingId == SaveDefaultData.settingAppReminderId)
            ?.isChecked ??
        true;
    if (isNotificationEnabled) {
      final reminders = await _isarService.getSavedReminders();
      if (reminders.isNotEmpty) {
        final currentTime = DateTime.now();
        await Future.forEach(
          reminders,
          (element) async {
            if (element.reminderForAllDay ||
                element.selectedTime!.isAfter(currentTime)) {
              if (element.reminderForAllDay) {
                element.selectedTime = currentTime.applyTimeOfDay(
                  timeOfDay: TimeOfDay.fromDateTime(element.selectedTime!),
                );
              }
              await scheduleReminderNotification(
                reminder: element,
                isFromReschedule: true,
              );
            }
          },
        );
      }
    }
  }

  static cancelReminders({
    int? byReminderId,
  }) async {
    final reminderNotifications = await _isarService.getNotifications(
      onlyReminder: true,
      byReminderId: byReminderId,
    );
    if (reminderNotifications.isNotEmpty) {
      await Future.forEach(
        reminderNotifications,
        (element) async => await notificationPlugin.cancel(
          element.id,
          tag: element.id.toString(),
        ),
      );
    }
  }

  static scheduleReminderNotification({
    required DbReminder reminder,
    bool isFromReschedule = false,
  }) async {
    if (!isFromReschedule) {
      await cancelReminders(
        byReminderId: reminder.id,
      );
    }
    DbProperty? _selectedProperty;
    int notificationId = await _getNextNotificationId();
    if (reminder.selectedProperty != null) {
      _selectedProperty =
          await _isarService.getPropertyById(reminder.selectedProperty!);
    }
    final _bigPictureStyleInformation = _selectedProperty != null &&
            _selectedProperty.photos != null &&
            _selectedProperty.photos!.isNotEmpty &&
            File(_selectedProperty.photos![0]).existsSync()
        ? notification.BigPictureStyleInformation(
            notification.FilePathAndroidBitmap(
              _selectedProperty.photos![0],
            ),
          )
        : null;
    final _androidSpecifics = notification.AndroidNotificationDetails(
      AppConfig.reminderNotificationChannelId,
      AppConfig.reminderNotificationChannelName,
      channelDescription: AppConfig.reminderNotificationChannelDesc,
      visibility: notification.NotificationVisibility.public,
      enableVibration: true,
      enableLights: true,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('reminder_notification_sound'),
      channelShowBadge: true,
      priority: notification.Priority.high,
      importance: notification.Importance.high,
      styleInformation: _bigPictureStyleInformation,
      tag: notificationId.toString(),
    );
    final _scheduledTime = tz.TZDateTime.from(reminder.selectedTime!, tz.local);
    final _iOSSpecifics = notification.DarwinNotificationDetails(
        attachments: _selectedProperty != null &&
                _selectedProperty.photos != null &&
                _selectedProperty.photos!.isNotEmpty &&
                File(_selectedProperty.photos![0]).existsSync()
            ? [
                notification.DarwinNotificationAttachment(
                  _selectedProperty.photos![0],
                ),
              ]
            : null,
        presentSound: true,
        presentBadge: true,
        sound: 'reminder_notification_sound.aiff');
    final _platformChannelSpecifics = notification.NotificationDetails(
      android: _androidSpecifics,
      iOS: _iOSSpecifics,
    );
    final payload = HashMap<String, dynamic>();
    payload[payloadKeyNotificationMainType] = NotificationType.reminder.name;
    payload[payloadKeyNotificationId] = notificationId;
    payload[payloadKeyReminderId] = reminder.id;
    if (_selectedProperty != null) {
      payload[payloadKeyNotificationPropertyId] = _selectedProperty.propertyId!;
    }
    await notificationPlugin
        .zonedSchedule(
      notificationId,
      reminder.title,
      reminder.description,
      _scheduledTime,
      _platformChannelSpecifics,
      uiLocalNotificationDateInterpretation:
          notification.UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: reminder.reminderForAllDay
          ? notification.DateTimeComponents.time
          : null,
      payload: jsonEncode(payload),
    )
        .then(
      (value) async {
        DbNotification dbNotification = DbNotification();
        dbNotification.id = notificationId;
        dbNotification.icon = Strings.iconReminderNotification;
        dbNotification.userId = StaticFunctions.userId;
        dbNotification.reminderId = reminder.id;
        dbNotification.dateTime = reminder.selectedTime!;
        dbNotification.propertyId = _selectedProperty?.propertyId ?? null;
        dbNotification.reminderForAllDay = reminder.reminderForAllDay;
        dbNotification.description =
            '${reminder.title}${_selectedProperty != null ? '\n${_selectedProperty.propertyId} | ${CommonPropertyDataProvider.propertyAreaWithPropertyType(_selectedProperty)}' : ''}';
        dbNotification.type = NotificationType.reminder.name;
        if (await _isarService.checkIfNotificationExistsWith(
              reminderId: dbNotification.reminderId,
              dateTime: dbNotification.dateTime,
              description: dbNotification.description,
              reminderForAllDay: dbNotification.reminderForAllDay,
            ) ==
            null) {
          await _isarService.saveNotification(dbNotification);
        }
        logger.i(
            'Notification has been scheduled to ${_scheduledTime.hour} : ${_scheduledTime.minute} / Now time: ${tz.TZDateTime.from(DateTime.now(), tz.local)}');
      },
    );
  }

  //To Save remaining notification into db which are not saved.
  static manipulateNotifications(int userId) async {
    StaticFunctions.userId =
        userId; //reinitializing userId as this is isolate function
    logger.i('Checking reminder notifications');
    final currentDate = DateTime.now();
    List<DbNotification> notifications = await _isarService.getNotifications();
    await Future.forEach(
      notifications,
      (notification) async {
        if (notification.type == NotificationType.reminder.name &&
            notification.reminderId != null) {
          if (notification.reminderForAllDay == true &&
              currentDate.compareTo(notification.dateTime) != -1) {
            final dates = _getDaysInBetween(notification.dateTime, currentDate);
            await Future.forEach(
              dates,
              (date) async {
                logger.i('Remaining notification found:: $date');
                final time = date.applyTimeOfDay(
                  timeOfDay: TimeOfDay.fromDateTime(notification.dateTime),
                );
                if (await _isarService.checkIfNotificationExistsWith(
                            dateTime: time) ==
                        null &&
                    currentDate.compareTo(time) != -1) {
                  final notificationToSave = notification;
                  notificationToSave.id = await _getNextNotificationId();
                  notificationToSave.dateTime = time;
                  notificationToSave.isRead = false;
                  await _isarService.saveNotification(notificationToSave);
                }
              },
            );
          }
        }
      },
    );
  }

  static List<DateTime> _getDaysInBetween(
      DateTime startDate, DateTime endDate) {
    List<DateTime> days = [];
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      days.add(startDate.add(Duration(days: i)));
    }
    return days;
  }

  static Future<int> _getNextNotificationId() async {
    return (await _isarService.getLastAddedNotificationId());
  }
}
