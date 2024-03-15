import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart' as signIn;
import 'package:googleapis/drive/v3.dart' as driveV3;
import 'package:path/path.dart' as path;
import 'package:path/path.dart';

import './google_auth_client.dart';
import './model/backup_info.dart';
import '../../const/string_const.dart';
import '../../utils/preference_utils.dart';

// Ref. https://www.youtube.com/watch?v=9kXov_Ly9BI
// https://betterprogramming.pub/the-minimum-guide-for-using-google-drive-api-with-flutter-9207e4cb05ba
// To Download & Upload : https://stackoverflow.com/a/68955711/5370550
// check steps for iOS : https://pub.dev/packages/google_sign_in

class GoogleDriveHelper {
  GoogleAuthClient? _authClient;
  late BackupInfo _backupInfo;
  final List<String> _scopes = [
    driveV3.DriveApi.driveAppdataScope,
  ];

  GoogleDriveHelper() {
    _backupInfo = BackupInfo();
  }

  Future<GoogleAuthClient?> _getGoogleSignInAuthClient() async {
    if (_authClient == null) {
      final googleSignIn = signIn.GoogleSignIn.standard(
        scopes: _scopes,
      );
      final signIn.GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account != null) {
        PreferenceUtils.saveToPreference(
          PreferenceUtils.activeBackupAccountKey,
          account.email,
        );
        _backupInfo.gDriveId = account.id;
        _backupInfo.gDriveEmailAddress = account.email;
        final authHeaders = await account.authHeaders;
        _authClient = GoogleAuthClient(authHeaders);
        return _authClient;
      }
      debugPrint('Google Authentication failed!');
    }
    return _authClient;
  }

  // upload file
  Future<BackupInfo?> uploadFile(File file) async {
    final client = await _getGoogleSignInAuthClient();
    if (client != null) {
      try {
        final drive = driveV3.DriveApi(client);
        final response = await drive.files.create(
          driveV3.File()
            ..parents = [Strings.googleDriveAppDataFolder]
            ..name = path.basename(
              file.absolute.path,
            ),
          uploadMedia: driveV3.Media(
            file.openRead(),
            file.lengthSync(),
          ),
        );
        debugPrint('${response.toJson()}');
        _backupInfo.backupTakenAt = DateTime.now();
        _backupInfo.fileSizeInByte = await file.length();
        _backupInfo.gDriveBackupFileId = response.id;
        _backupInfo.backupFileLocalPath = file.absolute.path;
        _backupInfo.gDriveBackupFileName = basename(file.absolute.path);
        return _backupInfo;
      } on FileSystemException catch (error) {
        debugPrint('FileSystemException: $error');
      } on ArgumentError catch (error) {
        debugPrint('ArgumentError: $error');
      } catch (error) {
        debugPrint('Failed to upload: $error');
      }
    }
    return null;
  }

  deleteFile(String fileId) async {
    final client = await _getGoogleSignInAuthClient();
    if (client != null) {
      try {
        final drive = driveV3.DriveApi(client);
        await drive.files.delete(fileId);
        debugPrint('old backup file deleted');
      } catch (error) {
        debugPrint('$error');
      }
    }
  }

  // download file
  Future<driveV3.Media?> downloadFile(String gdID) async {
    final client = await _getGoogleSignInAuthClient();
    if (client != null) {
      try {
        final drive = driveV3.DriveApi(client);
        driveV3.Media file = await drive.files.get(
          gdID,
          downloadOptions: driveV3.DownloadOptions.fullMedia,
        ) as driveV3.Media;
        return file;
      } catch (error) {
        // file might not found!
        debugPrint('$error');
        resetGoogleAuthClient();
      }
    }
    return null;
  }

  resetGoogleAuthClient() async {
    await signIn.GoogleSignIn.standard(
      scopes: _scopes,
    ).signOut();
    _authClient = null;
  }

  chooseGoogleAccount() async {
    await _getGoogleSignInAuthClient();
  }
}
