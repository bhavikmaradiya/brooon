import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import './model/reminder_arguments.dart';
import '../../common_property_data_provider.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/properties/db_property.dart';
import '../../localdb/reminder/db_reminder.dart';
import '../../localdb/save_default_data.dart';
import '../../utils/app_config.dart';
import '../../utils/date_utils.dart';
import '../../utils/enums.dart';
import '../../utils/full_screen_progress.dart';
import '../../utils/notification_helper.dart';
import '../../utils/static_functions.dart';
import '../../widgets/snack_bar_view.dart';

class AddReminderProvider extends ChangeNotifier {
  final _isarService = IsarService();
  static const reminderHintId = -1;
  late AppLocalizations localizationsContext;
  final TextEditingController titleFieldController = TextEditingController();
  final TextEditingController descriptionFieldController =
      TextEditingController();
  final TextEditingController timeFieldController = TextEditingController();
  final TextEditingController startDateFieldController =
      TextEditingController();
  final TextEditingController endDateFieldController = TextEditingController();
  final TextEditingController propertyFieldController = TextEditingController();
  bool enableReminderForAllDay = false;
  DateTime? selectedDateTime;
  DateTime? startDateTime;
  DateTime? endDateTime;
  List<DbProperty> propertyList = [];
  bool isValid = false;
  DbReminder? selectedReminder;

  init(ReminderArgs? arguments, AppLocalizations localization) async {
    localizationsContext = localization;
    selectedReminder = arguments?.reminder;
    if (arguments?.selectedDateTime != null) {
      selectedDateTime = arguments?.selectedDateTime;
      startDateTime = selectedDateTime;
    }
    propertyList = await _isarService.getUnsoldProperties();
    _refillData();
    notifyListeners();
    if (arguments?.selectedDateTime != null) {
      _setDateAndTimeInFields(
        resetTime: true,
      );
    }
  }

  validateData() {
    isValid = titleFieldController.text.trim().isNotEmpty &&
        startDateTime != null &&
        endDateTime != null &&
        timeFieldController.text.trim().isNotEmpty &&
        startDateFieldController.text.trim().isNotEmpty &&
        (enableReminderForAllDay
            ? endDateFieldController.text.trim().isNotEmpty
            : true);
    notifyListeners();
  }

  selectProperty(int id) {
    propertyList.forEach(
      (element) {
        element.isSelected = false;
      },
    );
    if (id == reminderHintId) {
      propertyFieldController.text = localizationsContext.reminderPropertyHint;
    } else {
      final propertyToSelect = propertyList.firstWhereOrNull(
        (element) => element.id == id,
      );
      if (propertyToSelect != null) {
        propertyToSelect.isSelected = true;
        final value =
            '${propertyToSelect.propertyId} | ${CommonPropertyDataProvider.propertyAreaWithPropertyType(propertyToSelect)}';
        propertyFieldController.text =
            propertyToSelect.id == reminderHintId ? '' : value;
      }
    }
    validateData();
    notifyListeners();
  }

  selectDateAndTime(
    BuildContext context, {
    bool selectTime = false,
    bool isForEndDate = false,
  }) {
    StaticFunctions.unFocusKeyboardIfAny(context);
    if (enableReminderForAllDay && !selectTime) {
      _selectDate(
        context,
        isForEndDate: isForEndDate,
      );
    } else if (selectTime && startDateFieldController.text.trim().isNotEmpty) {
      _selectTime(context);
    } else {
      _selectDate(context);
    }
  }

  _refillData() {
    if (selectedReminder != null) {
      titleFieldController.text = selectedReminder!.title ?? '';
      descriptionFieldController.text = selectedReminder!.description ?? '';
      enableReminderForAllDay = (selectedReminder!.tag != null &&
              selectedReminder!.tag!.trim().isNotEmpty ||
          selectedReminder!.reminderForAllDay);
      selectedDateTime = selectedReminder!.selectedTime;
      startDateTime = DateTime(
        selectedReminder!.startDate!.year,
        selectedReminder!.startDate!.month,
        selectedReminder!.startDate!.day,
        selectedDateTime!.hour,
        selectedDateTime!.minute,
        selectedDateTime!.second,
      );
      endDateTime = selectedReminder?.endDate;
      _setDateAndTimeInFields(resetTime: true);
      if (selectedReminder!.selectedProperty != null) {
        selectProperty(selectedReminder!.selectedProperty!);
      }
      notifyListeners();
      validateData();
    } else {
      endDateTime = startDateTime?.add(
        Duration(
          days: AppConfig.maxAllowedEndDateFromStartDate,
          hours: 1,
        ),
      );
    }
  }

  saveReminder(
    BuildContext context,
    AppLocalizations localizationsContext,
  ) async {
    validateData();
    if (isValid) {
      // check if selected reminder date and time for past time then don't allow
      if (!enableReminderForAllDay) {
        final difference = startDateTime!.millisecondsSinceEpoch -
            DateTime.now().millisecondsSinceEpoch;
        if (difference <= 0) {
          SnackBarView.showSnackBar(
            context,
            localizationsContext.reminderPastTimeNotAllowed,
          );
          return;
        }
      }
      FullScreenProgress.showFullScreenProgress(context, true);
      bool isNotificationEnabled = (await _isarService.getSettings())
              .firstWhereOrNull((element) =>
                  element.settingId == SaveDefaultData.settingAppReminderId)
              ?.isChecked ??
          true;
      if (enableReminderForAllDay) {
        List<DateTime> days = [];
        final end = DateTime(
          endDateTime!.year,
          endDateTime!.month,
          endDateTime!.day,
        );

        final start = DateTime(
          startDateTime!.year,
          startDateTime!.month,
          startDateTime!.day,
        );

        for (int i = 0; i <= end.difference(start).inDays; i++) {
          days.add(startDateTime!.add(Duration(days: i)));
        }

        if (selectedReminder?.tag != null &&
            selectedReminder!.tag!.trim().isNotEmpty) {
          // Edit Reminder - Multiple
          // First delete all reminder & cancel notifications and save new
          final reminders = await _isarService.getRemindersBasedOnTags(
            selectedReminder!.tag!,
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
          await _addMultipleReminder(days, isNotificationEnabled);
        } else {
          await _addMultipleReminder(days, isNotificationEnabled);
        }
      } else {
        // Add / Edit Reminder - Single
        await _addEditReminder(
          tag: null,
          reminderToSave:
              selectedReminder == null ? DbReminder() : selectedReminder!,
          isNotificationEnabled: isNotificationEnabled,
          selectedDateTime: startDateTime!,
          startDate: startDateTime!,
          endDate: startDateTime!,
        );
      }
      FullScreenProgress.showFullScreenProgress(context, true);
      Navigator.pop(context);
    }
  }

  _addMultipleReminder(
    List<DateTime> days,
    bool isNotificationEnabled,
  ) async {
    // Add Reminder - Multiple
    final tag = DateTime.now().millisecondsSinceEpoch;
    for (int k = 0; k < days.length; k++) {
      await _addEditReminder(
        tag: tag.toString(),
        reminderToSave: DbReminder(),
        isNotificationEnabled: isNotificationEnabled,
        selectedDateTime: days[k],
        startDate: startDateTime!,
        endDate: endDateTime!,
      );
    }
  }

  _addEditReminder({
    required String? tag,
    required DbReminder reminderToSave,
    required bool isNotificationEnabled,
    required DateTime selectedDateTime,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    reminderToSave.userId = StaticFunctions.userId;
    reminderToSave.title = titleFieldController.text;
    reminderToSave.description = descriptionFieldController.text;
    reminderToSave.selectedTime = selectedDateTime;
    if (tag != null) {
      // reminder for all tag is not false for all scenarios. we will manage
      // reminderToSave.reminderForAllDay = enableReminderForAllDay;
      reminderToSave.tag = tag;
    }
    reminderToSave.selectedDate = DateTime(
      selectedDateTime.year,
      selectedDateTime.month,
      selectedDateTime.day,
    );
    reminderToSave.startDate = DateTime(
      startDate.year,
      startDate.month,
      startDate.day,
    );
    reminderToSave.endDate = DateTime(
      endDate.year,
      endDate.month,
      endDate.day,
    );
    final propertyToSelect =
        propertyList.firstWhereOrNull((element) => element.isSelected);
    if (propertyToSelect != null) {
      reminderToSave.selectedProperty = propertyToSelect.id;
    } else {
      reminderToSave.selectedProperty = null;
    }
    await _isarService.saveReminder(reminderToSave);
    if (isNotificationEnabled &&
        (reminderToSave.reminderForAllDay ||
            reminderToSave.selectedTime!.isAfter(DateTime.now()))) {
      await NotificationHelper.scheduleReminderNotification(
        reminder: reminderToSave,
      );
    }
  }

  setReminderForAllDay(bool value) {
    this.enableReminderForAllDay = value;
    validateData();
    notifyListeners();
  }

  Theme _getPickerTheme(BuildContext context, Widget? child) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.light(
          primary: StaticFunctions.getColor(
            context,
            ColorEnum.themeColor,
          ),
          onPrimary: StaticFunctions.getColor(
            context,
            ColorEnum.whiteColor,
          ),
          onSurface: StaticFunctions.getColor(
            context,
            ColorEnum.blackColor,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: StaticFunctions.getColor(
              context,
              ColorEnum.themeColor,
            ),
          ),
        ),
      ),
      child: child!,
    );
  }

  _selectDate(
    BuildContext context, {
    bool isForEndDate = false,
  }) async {
    DateTime currentDate = DateTime.now();
    DateTime initialDate = startDateTime != null ? startDateTime! : currentDate;
    DateTime maxDate = currentDate.add(const Duration(days: 365));
    if (isForEndDate) {
      currentDate = startDateTime ?? DateTime.now();
      maxDate = currentDate.add(
        const Duration(days: AppConfig.maxAllowedEndDateFromStartDate),
      );
      initialDate = endDateTime != null ? endDateTime! : currentDate;
    }
    await showDatePicker(
      context: context,
      initialDate: initialDate,
      initialDatePickerMode: DatePickerMode.day,
      firstDate: currentDate,
      lastDate: maxDate,
      builder: (context, child) {
        return _getPickerTheme(context, child);
      },
    ).then(
      (value) {
        if (value != null) {
          var selectedTime;
          if (enableReminderForAllDay && isForEndDate) {
            if (endDateTime != null) {
              selectedTime = TimeOfDay.fromDateTime(endDateTime!);
            }
            endDateTime = value.applyTimeOfDay(
                timeOfDay:
                    selectedTime != null ? selectedTime : TimeOfDay.now());
            _updateEndDateField();
          } else {
            if (startDateTime != null) {
              selectedTime = TimeOfDay.fromDateTime(startDateTime!);
            }
            startDateTime = value.applyTimeOfDay(
                timeOfDay:
                    selectedTime != null ? selectedTime : TimeOfDay.now());
            if (enableReminderForAllDay && !isForEndDate) {
              final maximumAllowDate = startDateTime!.add(
                const Duration(days: AppConfig.maxAllowedEndDateFromStartDate),
              );
              if (startDateTime!.isAfter(endDateTime!) ||
                  endDateTime!.isAfter(maximumAllowDate)) {
                endDateTime = startDateTime?.add(
                  const Duration(
                      days: AppConfig.maxAllowedEndDateFromStartDate),
                );
              }
            }
            if (!enableReminderForAllDay &&
                timeFieldController.text.trim().isEmpty) {
              _selectTime(context);
            } else {
              _setDateAndTimeInFields();
            }
          }
          validateData();
        }
      },
    );
  }

  _selectTime(BuildContext context) async {
    await showTimePicker(
      context: context,
      initialTime: startDateTime != null
          ? TimeOfDay(hour: startDateTime!.hour, minute: startDateTime!.minute)
          : TimeOfDay.now(),
      builder: (context, child) {
        return _getPickerTheme(context, child);
      },
    ).then((value) {
      if (value != null) {
        if (startDateTime == null) {
          startDateTime = DateTime.now();
        }
        startDateTime = startDateTime?.applyTimeOfDay(timeOfDay: value);
        _setDateAndTimeInFields(resetTime: true);
        validateData();
      }
    });
  }

  _setDateAndTimeInFields({
    bool resetTime = false,
  }) {
    if (startDateTime != null) {
      startDateFieldController.text =
          DateFormat(AppConfig.reminderDisplayDateFormat)
              .format(startDateTime!);
      if (resetTime) {
        timeFieldController.text =
            DateFormat(AppConfig.reminderDisplayTimeFormat)
                .format(startDateTime!);
      }
    }
    _updateEndDateField();
    validateData();
  }

  _updateEndDateField() {
    if (endDateTime != null) {
      endDateFieldController.text =
          DateFormat(AppConfig.reminderDisplayDateFormat).format(endDateTime!);
    }
  }
}
