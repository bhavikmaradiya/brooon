import 'dart:async';
import 'dart:io';

import 'package:auto_start_flutter/auto_start_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import './model/reminder_arguments.dart';
import '../../const/dimen_const.dart';
import '../../const/routes.dart';
import '../../const/string_const.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/reminder/db_reminder.dart';
import '../../utils/app_config.dart';
import '../../utils/enums.dart';
import '../../utils/full_screen_progress.dart';
import '../../utils/notification_helper.dart';
import '../../utils/static_functions.dart';
import '../../widgets/dialog_widget.dart';

class ReminderProvider extends ChangeNotifier {
  late AppLocalizations localizationsContext;
  final _isarService = IsarService();
  List<DbReminder> _reminderList = [];
  List<DbReminder> _filterReminderList = [];
  StreamSubscription<void>? reminderWatcher;
  DateTime? selectedDate;
  String selectedDateLabel = '';

  List<DbReminder> get reminderList => _filterReminderList;

  init(
    BuildContext context, {
    DateTime? selectedDate,
  }) async {
    this.localizationsContext = AppLocalizations.of(context)!;
    selectDate(selectedDate ?? DateTime.now());
    _listenFilterList();
    if (Platform.isAndroid) {
      final appSettings = await _isarService.getAppSettings();
      if (appSettings != null && !appSettings.isAutoStartPermissionAsked) {
        try {
          var test = await (isAutoStartAvailable);
          if (test != null && test) {
            appSettings.isAutoStartPermissionAsked = true;
            await _isarService.updateAppSettings(appSettings);
            await getAutoStartPermission();
          }
        } on PlatformException catch (e) {
          debugPrint(e.message);
        }
      }
    }
  }

  _getRemindersByDate(DateTime dateTime) async {
    _reminderList.clear();
    _reminderList.addAll(
      await _isarService.getSavedReminders(byDate: dateTime),
    );
    searchBy('');
  }

  searchBy(String searchBy) {
    _filterReminderList.clear();
    if (searchBy.isEmpty) {
      _filterReminderList.addAll(_reminderList);
    } else {
      _filterReminderList.addAll(
        _reminderList.where(
          (element) =>
              element.title.toString().trim().toLowerCase().contains(
                    searchBy.trim().toLowerCase(),
                  ) ||
              element.description.toString().trim().toLowerCase().contains(
                    searchBy.trim().toLowerCase(),
                  ),
        ),
      );
    }
    notifyListeners();
  }

  onUpdate(BuildContext context, ReminderArgs arguments) {
    ReminderArgs arg = arguments;
    arg.selectedDateTime = (arguments.selectedDateTime ?? DateTime.now()).add(
      const Duration(hours: 1),
    );
    Navigator.pushNamed(
      context,
      Routes.addReminder,
      arguments: arg,
    ).then(
      (value) => _listenFilterList(),
    );
  }

  onDelete(BuildContext context, DbReminder reminder) async {
    await showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return DialogWidget(
          title: '',
          titleWidget: Container(
            child: Text.rich(
              TextSpan(
                text: localizationsContext.dialogDeleteReminderMsg1,
                style: TextStyle(
                  color: StaticFunctions.getColor(
                    dialogContext,
                    ColorEnum.blackColor,
                  ),
                  fontSize: Dimensions.dialogTextSize.sp,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                    text: reminder.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: localizationsContext.dialogDeleteReminderMsg2,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          icon: Strings.iconDelete,
          positiveButton: localizationsContext.btnDeleteReminder,
          negativeButton: localizationsContext.btnCancelReminder,
          onNegativeButtonClick: () {
            Navigator.pop(dialogContext);
          },
          onPositiveButtonClick: () async {
            FullScreenProgress.showFullScreenProgress(context, true);
            if (reminder.reminderForAllDay ||
                reminder.tag != null && reminder.tag!.trim().isNotEmpty) {
              final reminders = await _isarService.getRemindersBasedOnTags(
                reminder.tag!,
              );
              List<int> reminderIds = [];
              for (int j = 0; j < reminders.length; j++) {
                reminderIds.add(reminders[j].id);
                await NotificationHelper.cancelReminders(
                  byReminderId: reminders[j].id,
                );
              }
              if (reminderIds.isNotEmpty) {
                await _isarService.deleteReminders(reminderIds);
              }
            } else {
              await NotificationHelper.cancelReminders(
                byReminderId: reminder.id,
              );
              await _isarService.deleteReminders([reminder.id]);
            }
            FullScreenProgress.showFullScreenProgress(context, false);
            Navigator.pop(dialogContext);
          },
        );
      },
    );
  }

  selectDate(DateTime date) {
    selectedDate = date;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    final dateToCheck =
        DateTime(selectedDate!.year, selectedDate!.month, selectedDate!.day);
    selectedDateLabel = dateToCheck == today
        ? localizationsContext.reminderDateToday
        : dateToCheck == yesterday
            ? localizationsContext.reminderDateYesterday
            : dateToCheck == tomorrow
                ? localizationsContext.reminderDateTomorrow
                : DateFormat(AppConfig.reminderDisplayDateFormat)
                    .format(dateToCheck);
    if (selectedDate != null) {
      _getRemindersByDate(selectedDate!);
    }
    notifyListeners();
  }

  onDispose() {
    reminderWatcher?.cancel();
  }

  _listenFilterList() async {
    reminderWatcher?.cancel();
    final onChanges = await _isarService.watchOnReminderChanges();
    reminderWatcher = onChanges.listen(
      (event) async {
        if (selectedDate != null) {
          selectDate(selectedDate!);
        }
      },
    );
  }

  Future<int> getNumberOfSavedReminderForDate(DateTime dateTime) async {
    return await _isarService.getNumberOfSavedReminderForDate(dateTime);
  }
}
