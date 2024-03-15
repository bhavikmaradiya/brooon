class BackupInfo {
  String? backupFileLocalPath;
  int? fileSizeInByte;
  String? gDriveId;
  String? gDriveEmailAddress;
  String? gDriveBackupFileName;
  String? gDriveBackupFileId;
  DateTime? backupTakenAt;

  Map<String, dynamic> toMap(BackupInfo backupInfo, String backupId) {
    return {
      'backup_date_time': backupInfo.backupTakenAt!.millisecondsSinceEpoch,
      'backup_size': backupInfo.fileSizeInByte,
      'google_email_id': backupInfo.gDriveId,
      'google_email_address': backupInfo.gDriveEmailAddress,
      'google_file_name': backupInfo.gDriveBackupFileName,
      'google_drive_file_id': backupInfo.gDriveBackupFileId,
      'google_backup_id': backupId
    };
  }
}
