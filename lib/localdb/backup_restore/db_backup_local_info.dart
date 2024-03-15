import 'package:isar/isar.dart';

part 'db_backup_local_info.g.dart';

@collection
class DbBackupLocalInfo {
  Id id = Isar.autoIncrement;
  int? userId;
  String? filePath;

  // status :
  // 1. Strings.backupRestoreTypePending
  // 2. Strings.backupRestoreTypeProcessing
  // 3. Strings.backupRestoreTypeCompleted
  // 4. Strings.backupRestoreTypeFailed
  String? status;
}
