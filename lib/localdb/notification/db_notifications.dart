import 'package:isar/isar.dart';

part 'db_notifications.g.dart';

@collection
class DbNotification {
  Id id = Isar.autoIncrement;
  int? userId;
  int? reminderId;
  late String type;
  String? subType;
  String? propertyId;
  String? title;
  late String description;
  late DateTime dateTime;
  late String icon;
  bool isRead = false;
  bool isDeleted = false;
  bool? activeInactiveStatus;
  bool? reminderForAllDay;
}
