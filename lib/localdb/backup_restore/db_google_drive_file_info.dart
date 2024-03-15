import 'package:isar/isar.dart';

part 'db_google_drive_file_info.g.dart';

@collection
class DbGoogleDriveFileInfo {
  Id id = Isar.autoIncrement;
  int? userId;
  String? fileId;
  String? fileName;
  int? fileSizeInByte;

  // status :
  // 1. Strings.backupRestoreTypePending
  // 2. Strings.backupRestoreTypeProcessing
  // 3. Strings.backupRestoreTypeCompleted
  // 4. Strings.backupRestoreTypeFailed
  String? status;
}
