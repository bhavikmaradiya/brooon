import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:path_provider/path_provider.dart';

import './google_drive_helper.dart';
import '../../const/string_const.dart';
import '../../localdb/isar_service.dart';
import '../../network/network_connectivity.dart';
import '../../utils/file_utils.dart';
import '../../utils/notification_helper.dart';
import '../../utils/static_functions.dart';
import '../../widgets/snack_bar_view.dart';
import '../common_widget/navigator_helper.dart';

class RestoreBackupProvider extends ChangeNotifier {
  final _isarService = IsarService();
  final _googleDriveHelper = GoogleDriveHelper();
  int _totalBackupSizeInByte = 0;
  int _downloadedBackupSizeInByte = 0;
  double _processValue = 0;
  bool _isDownloading = false;
  bool _isNeedToCancelDownloading = false;
  String totalBackupSizeToDownload = '';
  String downloadedBackupSizeToDownload = '';

  bool get isDownloading => _isDownloading;

  double get processValue => _processValue;

  init() {}

  _importJson(String filePath) async {
    try {
      final String response = await File(filePath).readAsString();
      final data = await json.decode(response);
      final photoDir = await FileUtils.getPhotoDirectory();
      await _isarService.importDb(data, photoDir.path);
      await NotificationHelper.rescheduleReminders();
    } catch (error) {
      debugPrint('$error');
    }
  }

  Future<String> getCurrentBackupSize() async {
    final list = await _isarService.getAllGoogleDriveFilesInfoBasedOnStatus(
      Strings.backupRestoreTypePending,
    );
    if (list.isNotEmpty) {
      int totalSize = 0;
      list.forEach(
        (element) {
          totalSize = totalSize + (element.fileSizeInByte ?? 0);
        },
      );
      _totalBackupSizeInByte = totalSize;
      return await FileUtils.getFileSize(totalSize, 2);
    }
    _totalBackupSizeInByte = 0;
    return '';
  }

  String? getRestoreBackupEmailId() {
    return StaticFunctions.userInfo?.gDriveEmailAddress;
  }

  startDownloadingBackup(BuildContext context) async {
    final isOnline = await NetworkConnectivity.hasNetwork();
    if (!isOnline) {
      SnackBarView.showSnackBar(
        context,
        AppLocalizations.of(context)!.noInternetSnackBarMessage,
      );
      return;
    }
    _isNeedToCancelDownloading = false;
    _downloadedBackupSizeInByte = 0;
    _updateDownloadProgress(0);
    _updateDownloadingStatus(true);
    _restoreBackup(context);
  }

  _restoreBackup(BuildContext context) async {
    if (_isNeedToCancelDownloading) {
      _updateDownloadingStatus(false);
      return;
    }
    final googleDriveFileInfo =
        await _isarService.getGoogleDriveFileInfoBasedOnStatus(
      Strings.backupRestoreTypePending,
    );
    if (googleDriveFileInfo?.fileId != null) {
      final file =
          await _googleDriveHelper.downloadFile(googleDriveFileInfo!.fileId!);
      if (file != null) {
        final directory = await getApplicationDocumentsDirectory();
        debugPrint(directory.path);
        List<int> dataStore = [];
        file.stream.listen(
          (data) {
            dataStore.insertAll(dataStore.length, data);
          },
          onDone: () async {
            final saveFile = File(
              '${directory.path}/${googleDriveFileInfo.fileName}',
            );
            await saveFile.writeAsBytes(dataStore);
            final isCompleted = await _unzipFile(saveFile.path);
            // update status for downloaded google drive backup file ids
            if (isCompleted) {
              googleDriveFileInfo.status = Strings.backupRestoreTypeCompleted;
              _downloadedBackupSizeInByte = _downloadedBackupSizeInByte +
                  await File(saveFile.path).length();
              _updateDownloadProgress(_downloadedBackupSizeInByte);
            } else {
              googleDriveFileInfo.status = Strings.backupRestoreTypeFailed;
            }
            await _isarService.updateGoogleDriveFileInfo(googleDriveFileInfo);
            _restoreBackup(context);
          },
          onError: (error) {
            debugPrint('----- Some Error while Downloading: -----> $error');
          },
        );
      } else {
        SnackBarView.showSnackBar(
          context,
          AppLocalizations.of(context)!.restoreInvalidAuthMessage,
        );
        _resetOnDownloadingInterrupt();
      }
    } else {
      // All Files backup is restored from google drive.
      // Remove all downloaded zip files and db info
      await _removeAllZipFilesFromLocalStorageAndDbInfo();
      _updateDownloadingStatus(false);
      openScreen(context);
    }
  }

  _removeAllZipFilesFromLocalStorageAndDbInfo() async {
    final list = await _isarService.getAllGoogleDriveFilesInfoBasedOnStatus(
      Strings.backupRestoreTypeCompleted,
    );
    if (list.isNotEmpty) {
      final Directory directory = await getApplicationDocumentsDirectory();
      final jsonFilePath = '${directory.path}/${Strings.backupJsonFileName}';
      if (await File(jsonFilePath).exists()) {
        await File(jsonFilePath).delete();
      }
      for (int k = 0; k < list.length; k++) {
        final path = '${directory.path}/${list[k].fileName}';
        if (await File(path).exists()) {
          await File(path).delete();
        }
      }
      // Remove all Google Drive file info from DB table
      await _isarService.deleteAllCompletedGoogleDriveInfo();
    }
  }

  Future<bool> _unzipFile(String restoreFilePath) async {
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      // unzip file
      // Ref. https://stackoverflow.com/a/70105561/5370550
      final decoder = ZipDecoder();
      final bytes = await File(restoreFilePath).readAsBytes();
      final archive = decoder.decodeBytes(bytes);
      // Flag To remove older directory as new backup will replace older
      bool isFirstIndex = true;
      final photoDirectory = await FileUtils.getPhotoDirectory();
      for (final file in archive) {
        if (file.isFile) {
          final data = file.content as List<int>;
          if (file.name.contains(Strings.jsonFileExtension)) {
            // check if same file exist then remove it.
            final saveFile = File('${directory.path}/${file.name}');
            final isFileExist = await saveFile.exists();
            if (isFileExist) {
              await saveFile.delete();
            }
            saveFile
              ..createSync(recursive: true)
              ..writeAsBytesSync(data);
            await _importJson(saveFile.path);
          } else {
            final paths = file.name.split('/');
            final propertyDirectoryName = paths[0];
            final actualFile = paths[1];
            final propertyDirectoryPath =
                '${photoDirectory.path}/$propertyDirectoryName';
            if (isFirstIndex) {
              isFirstIndex = false;
              // check if same property is exist for same user id in db
              // then delete photos and restore from backup as in json whole detail will be replaced!
              final isFolderExist =
                  await Directory(propertyDirectoryPath).exists();
              if (isFolderExist) {
                await Directory(propertyDirectoryPath).delete(recursive: true);
              }
              await Directory(propertyDirectoryPath).create(recursive: true);
            }
            if (actualFile.contains('${Strings.jpgFileExtension}')) {
              final saveFile = File('${propertyDirectoryPath}/$actualFile');
              saveFile
                ..createSync(recursive: true)
                ..writeAsBytesSync(data);
            }
          }
        }
      }
      return true;
    } catch (error) {
      debugPrint('------ Exception while decoding: -----> $error');
      return false;
    }
  }

  _updateDownloadProgress(int downloadedSizeInByte) async {
    final percentage = (downloadedSizeInByte * 100) / _totalBackupSizeInByte;
    final pValue = percentage / 100;
    _processValue = (pValue >= 1) ? 1 : pValue;
    totalBackupSizeToDownload =
        await FileUtils.getFileSize(_totalBackupSizeInByte, 2);
    if (downloadedSizeInByte > _totalBackupSizeInByte) {
      downloadedBackupSizeToDownload = totalBackupSizeToDownload;
    } else {
      downloadedBackupSizeToDownload =
          await FileUtils.getFileSize(downloadedSizeInByte, 2);
    }
    notifyListeners();
  }

  _updateDownloadingStatus(bool isDownloading) {
    _isDownloading = isDownloading;
    notifyListeners();
  }

  cancelDownloading() {
    _isNeedToCancelDownloading = true;
    _resetOnDownloadingInterrupt();
  }

  _resetOnDownloadingInterrupt() {
    _updateDownloadProgress(0);
    _updateDownloadingStatus(false);
  }

  openScreen(BuildContext context) {
    NavigatorHelper.openScreenAfterLogin(
      context,
      false,
    );
  }
}
