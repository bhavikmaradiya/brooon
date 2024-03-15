import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import './google_drive_helper.dart';
import './model/backup_info.dart';
import '../../const/string_const.dart';
import '../../localdb/backup_restore/db_backup_local_info.dart';
import '../../localdb/backup_restore/db_google_drive_file_info.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/user_info/db_user_info.dart';
import '../../network/dio_client.dart';
import '../../network/network_connectivity.dart';
import '../../utils/app_config.dart';
import '../../utils/compress_image_helper.dart';
import '../../utils/file_utils.dart';
import '../../utils/permission_utils.dart';
import '../../utils/preference_utils.dart';
import '../../utils/static_functions.dart';
import '../../widgets/snack_bar_view.dart';

class BackupProvider extends ChangeNotifier {
  final _isarService = IsarService();
  bool _isBackupAvailable = false;
  double _processValue = 0;
  final _googleDriveHelper = GoogleDriveHelper();
  String _backupId = '';
  int _totalBackupSizeInByte = 0;
  bool _cancelUploading = false;
  String totalBackupSizeToUpload = '';
  String uploadedBackupSizeToUpload = '';
  bool _isUploading = false;
  String? activeAccount = '';

  bool get isBackupAvailable => _isBackupAvailable;

  bool get isUploading => _isUploading;

  double get processValue => _processValue;

  bool _isMounted = true;

  init() {
    _isMounted = true;
    _updateBackupInfoToScreen();
    activeBackupAccount();
  }

  _updateBackupInfoToScreen() {
    _isBackupAvailable = StaticFunctions.userInfo?.backupTakenAt != null;
    if (_isMounted) {
      notifyListeners();
    }
  }

  _updateUploadingStatus(bool isUploading) {
    _isUploading = isUploading;
    if (_isMounted) {
      notifyListeners();
    }
  }

  startBackupProcess(BuildContext context) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      SnackBarView.showSnackBar(
        context,
        AppLocalizations.of(context)!.noInternetSnackBarMessage,
      );
      return;
    }
    _cancelUploading = false;
    _backupId = '';
    _totalBackupSizeInByte = 0;
    _updateUploadProgress(0);
    _updateUploadingStatus(true);
    final backupList = await _createBackup();
    if (AppConfig.enableImportExport &&
        backupList.isNotEmpty &&
        Platform.isAndroid) {
      await _backupToLocalStorage(backupList);
    }
    await _uploadToGDrive(context, isNewBackup: true);
  }

  _backupToLocalStorage(List<DbBackupLocalInfo> list) async {
    final hasPermission = await PermissionUtils.getStoragePermission();
    if (hasPermission != null && hasPermission) {
      await FileUtils.deleteOldBackupDataFromInternalStorage();
      for (int i = 0; i < list.length; i++) {
        await FileUtils.storeBackupDataToInternalStorage(list[i].filePath);
      }
    }
  }

  _uploadToGDrive(BuildContext context, {bool isNewBackup = false}) async {
    if (_cancelUploading) {
      _updateUploadingStatus(false);
      return;
    }
    final pendingBackupInfo = await _isarService.getPendingBackupInfo();
    if (pendingBackupInfo?.filePath != null) {
      final BackupInfo? backupInfo = await _googleDriveHelper.uploadFile(
        File(
          pendingBackupInfo!.filePath!,
        ),
      );
      if (backupInfo != null) {
        activeBackupAccount();
        // ------ chunk backup taken ------
        DbUserInfo? userInfo = StaticFunctions.userInfo;
        if (userInfo != null && !_cancelUploading) {
          await _uploadTakenBackupInfoToServer(
            backupInfo,
            userInfo,
            pendingBackupInfo,
            isNewBackup,
          );
          // upload other pending zip files
          _uploadToGDrive(context);
        }
      } else {
        if (!_cancelUploading) {
          SnackBarView.showSnackBar(
            context,
            AppLocalizations.of(context)!.backupInvalidAuthMessage,
          );
          _resetOnUploadingInterrupt();
          _deleteLastBackupFilesAndDbInfoFromLocal(await _getBackupDirectory());
        }
      }
    } else {
      // ---- if info is NULL means all backup is uploaded to gDrive ----
      await _deleteLastBackupFilesAndDbInfoFromLocal(
        await _getBackupDirectory(),
      );
      // delete older backup files once all current backup file uploaded and if available with same gDrive id
      /*await _deleteLastBackupFilesFromGDrive(
        userInfo,
        backupInfo,
      );*/
      _updateUploadingStatus(false);
    }
  }

  _deleteLastBackupFilesAndDbInfoFromLocal(Directory backupDir) async {
    // Delete last backup info from DB for ALL USERS to prevent pending files
    // from different users to upload. As we are creating new backup files.
    await _isarService.deleteAllBackupLocalInfo();
    final isBackupDirExist = await backupDir.exists();
    if (isBackupDirExist) {
      await backupDir.delete(recursive: true);
    }
  }

  _deleteLastBackupFilesFromGDrive(
    DbUserInfo userInfo,
    BackupInfo backupInfo,
  ) async {
    if (userInfo.gDriveId == backupInfo.gDriveId) {
      // TODO: File Ids goes here
      await _googleDriveHelper.deleteFile('');
    }
  }

  _uploadTakenBackupInfoToServer(
    BackupInfo backupInfo,
    DbUserInfo userInfo,
    DbBackupLocalInfo pendingBackupInfo,
    bool isNewBackup,
  ) async {
    // if uploading is not cancelled then only push info to server
    if (!_cancelUploading) {
      final backupResponse = await DioClient().uploadBackupInfo(
        BackupInfo().toMap(
          backupInfo,
          _backupId,
        ),
      );
      if (backupResponse?.data != null) {
        int totalChunkBackupSize = 0;
        if (!isNewBackup) {
          totalChunkBackupSize = (userInfo.backupSize ?? 0);
        }
        totalChunkBackupSize =
            totalChunkBackupSize + (backupInfo.fileSizeInByte ?? 0);

        _updateUploadProgress(totalChunkBackupSize);
        pendingBackupInfo..status = Strings.backupRestoreTypeCompleted;
        await _isarService.updateBackupLocalInfo(pendingBackupInfo);

        // save new backup info
        userInfo
          ..backupSize = totalChunkBackupSize
          ..backupTakenAt = backupInfo.backupTakenAt
          ..gDriveId = backupInfo.gDriveId
          ..gDriveEmailAddress = backupInfo.gDriveEmailAddress;
        await _isarService.saveOrUpdateUserInfo(userInfo);

        await _isarService.saveGoogleDriveFileInfo(
          DbGoogleDriveFileInfo()
            ..userId = StaticFunctions.userId
            ..status = Strings.backupRestoreTypePending
            ..fileId = backupInfo.gDriveBackupFileId!
            ..fileName = backupInfo.gDriveBackupFileName
            ..fileSizeInByte = backupInfo.fileSizeInByte,
        );

        _backupId = backupResponse?.data?.googleBackupId ?? '';
        _updateBackupInfoToScreen();
      } else if (DioClient.isUserUnAuthorized(backupResponse?.code)) {
        cancelUploading();
      }
    }
  }

  _updateUploadProgress(int uploadedSizeInByte) async {
    final percentage = (uploadedSizeInByte * 100) / _totalBackupSizeInByte;
    final pValue = percentage / 100;
    _processValue = (pValue >= 1) ? 1 : pValue;
    totalBackupSizeToUpload =
        await FileUtils.getFileSize(_totalBackupSizeInByte, 2);
    if (uploadedSizeInByte > _totalBackupSizeInByte) {
      uploadedBackupSizeToUpload = totalBackupSizeToUpload;
    } else {
      uploadedBackupSizeToUpload =
          await FileUtils.getFileSize(uploadedSizeInByte, 2);
    }
    if (_isMounted) {
      notifyListeners();
    }
  }

  cancelUploading() async {
    debugPrint('----> Uploading cancelled <----');
    _cancelUploading = true;
    _resetOnUploadingInterrupt();
    _deleteLastBackupFilesAndDbInfoFromLocal(await _getBackupDirectory());
  }

  _resetOnUploadingInterrupt() {
    _updateUploadProgress(0);
    _updateUploadingStatus(false);
  }

  Future<Directory> _getBackupDirectory() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    return Directory('${directory.path}/${Strings.backupZipFileFolderName}');
  }

  Future<List<DbBackupLocalInfo>> _createBackup() async {
    final List<DbBackupLocalInfo> backupList = [];
    // create backup folder, if exist then remove it
    final backupDir = await _getBackupDirectory();
    await _deleteLastBackupFilesAndDbInfoFromLocal(backupDir);
    await backupDir.create();
    // create json file and add all DB contents
    final File jsonFilePath =
        File('${backupDir.path}/${Strings.backupJsonFileName}');
    final data = await _isarService.exportDb();
    await jsonFilePath.writeAsString(jsonEncode(data));

    // create zip file for db json
    final jsonEncoder = ZipFileEncoder();
    final zipJsonFilePath = jsonFilePath.path.replaceFirst(
      Strings.jsonFileExtension,
      Strings.zipFileExtension,
    );
    jsonEncoder.create(zipJsonFilePath);
    await jsonEncoder.addFile(jsonFilePath);
    jsonEncoder.close();
    backupList.add(
      DbBackupLocalInfo()
        ..userId = StaticFunctions.userId
        ..filePath = zipJsonFilePath
        ..status = Strings.backupRestoreTypePending,
    );

    _updateTotalBackupSizeInByte(await File(zipJsonFilePath).length());

    // delete json file which is used for zip, as now we have zip file with us
    await File(jsonFilePath.path).delete();
    // fetch all properties which contains photos
    final propertiesWithPhotos =
        await _isarService.getPropertiesIncludesPhotos();
    if (propertiesWithPhotos.isNotEmpty) {
      final List<String> propertyDirectoryPaths = [];
      for (int propertyIndex = 0;
          propertyIndex < propertiesWithPhotos.length;
          propertyIndex++) {
        final propertyInfo = propertiesWithPhotos[propertyIndex];
        final propertyDir = await Directory(
          '${backupDir.path}/${await FileUtils.getPropertyPhotosDirectoryName(propertyInfo.id)}',
        ).create();
        for (int photoIndex = 0;
            photoIndex < propertyInfo.photos!.length;
            photoIndex++) {
          await CompressImageHelper.compressHelper(
            propertyInfo.photos![photoIndex],
            '${propertyDir.path}/$photoIndex${Strings.jpgFileExtension}',
          );
        }
        // check if property directory is not empty
        if (await Directory(propertyDir.path).exists()) {
          final list = Directory(propertyDir.path).listSync();
          if (list.isNotEmpty) {
            propertyDirectoryPaths.add(propertyDir.path);
          }
        }
      }
      if (propertyDirectoryPaths.isNotEmpty) {
        // create zip file for each property folder
        for (int dir = 0; dir < propertyDirectoryPaths.length; dir++) {
          final propertyZipFilePath =
              propertyDirectoryPaths[dir] + Strings.zipFileExtension;
          final encoder = ZipFileEncoder();
          encoder.create(propertyZipFilePath);
          await encoder.addDirectory(Directory(propertyDirectoryPaths[dir]));
          _updateTotalBackupSizeInByte(
            await File(propertyZipFilePath).length(),
          );
          encoder.close();
        }

        // delete property folder which is used for zip. As now we have zip so no need that directory
        for (int i = 0; i < propertyDirectoryPaths.length; i++) {
          backupList.add(DbBackupLocalInfo()
            ..userId = StaticFunctions.userId
            ..filePath = propertyDirectoryPaths[i] + Strings.zipFileExtension
            ..status = Strings.backupRestoreTypePending);
          await Directory('${propertyDirectoryPaths[i]}')
              .delete(recursive: true);
        }
      }
    }
    // save all backup local path and status at db so at time of uploading will pick & upload according to db status
    await _isarService.saveBackupLocalInfo(backupList);
    return backupList;
  }

  _updateTotalBackupSizeInByte(int fileSize) {
    debugPrint('fileSize: $fileSize');
    _totalBackupSizeInByte = _totalBackupSizeInByte + fileSize;
    debugPrint('totalBackupSize: $_totalBackupSizeInByte');
  }

  String getLastBackupAt() {
    if (StaticFunctions.userInfo?.backupTakenAt != null) {
      return DateFormat(AppConfig.lastBackupDateFormat).format(
        StaticFunctions.userInfo!.backupTakenAt!,
      );
    }
    return '';
  }

  Future<String> getLastBackupSize() async {
    if (StaticFunctions.userInfo?.backupSize != null) {
      return await FileUtils.getFileSize(
        StaticFunctions.userInfo!.backupSize!,
        2,
      );
    }
    return '';
  }

  String getLastBackupEmail() {
    if (StaticFunctions.userInfo?.gDriveEmailAddress != null) {
      return StaticFunctions.userInfo!.gDriveEmailAddress!;
    }
    return '';
  }

  changeBackupAccount() async {
    await _googleDriveHelper.resetGoogleAuthClient();
    await _googleDriveHelper.chooseGoogleAccount();
    activeBackupAccount();
  }

  activeBackupAccount() async {
    final account = await PreferenceUtils.getActiveBackupAccount();
    if (account != null && account.trim().isNotEmpty) {
      activeAccount = account;
      notifyListeners();
    }
  }

  onDispose() {
    _isMounted = false;
  }
}
