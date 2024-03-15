import '../../../localdb/reminder/db_reminder.dart';

class ReminderArgs {
  DateTime? selectedDateTime;
  DbReminder? reminder;

  ReminderArgs(
    this.selectedDateTime,
    this.reminder,
  );
}
