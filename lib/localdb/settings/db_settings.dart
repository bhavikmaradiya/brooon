import 'package:isar/isar.dart';

part 'db_settings.g.dart';

@collection
class DbSetting {
  Id id = Isar.autoIncrement;
  int? settingId;
  int? userId;
  late String settingTitle;
  bool isChecked = true;
}
