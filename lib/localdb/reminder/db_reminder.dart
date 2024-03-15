import 'package:isar/isar.dart';

part 'db_reminder.g.dart';

@collection
class DbReminder{
  Id id = Isar.autoIncrement;
  int? userId;
  String? title;
  String? description;
  // For All concern reminder for all is false while saving in DB.
  // In logically - TAG param will be use instead of reminderForAll.
  bool reminderForAllDay = false;
  DateTime? selectedTime;
  DateTime? selectedDate;
  DateTime? startDate;
  DateTime? endDate;
  String? tag;
  int? selectedProperty;
}