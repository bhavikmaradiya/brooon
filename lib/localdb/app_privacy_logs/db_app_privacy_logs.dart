import 'package:isar/isar.dart';

part 'db_app_privacy_logs.g.dart';

@collection
class DbAppPrivacyLogs {
  Id id = 1;
  DateTime? appLoginTime; // this will be server time
  // first time this will be login time
  // After login, every time this date time will update and
  // if user will try to open app with previous dates and app should jump to login
  // check this thing at splash time and home screen both
  DateTime? appOpenTime;
}
