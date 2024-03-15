import 'dart:io';
import 'dart:math' as math;

import 'package:media_store_plus/media_store_plus.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import './static_functions.dart';
import '../const/string_const.dart';

class FileUtils {
  static void clearCacheImages() async {
    final cacheDir = await getTemporaryDirectory();
    final files = cacheDir.listSync();
    if (files.isNotEmpty) {
      Future.forEach(
        files,
        (element) async {
          if (element.path.endsWith(Strings.jpgFileExtension) ||
              element.path.endsWith(Strings.pngFileExtension)) {
            if (File(element.path).existsSync()) {
              await File(element.path).delete();
            }
          }
        },
      );
    }
  }

  static Future<String> getTempFilePath({
    String extension = Strings.jpgFileExtension,
  }) async {
    final cacheDir = await getTemporaryDirectory();
    return '${cacheDir.path}/${Strings.tempFilePrefixName}${DateTime.now().millisecondsSinceEpoch}$extension';
  }

  static Future<String> getWatermarkFilePath({
    String? extension = Strings.pngFileExtension,
  }) async {
    final directoryPath =
        '${(await getApplicationDocumentsDirectory()).path}/${Strings.watermarkImageFolderName}';
    final directory = await Directory(directoryPath);
    if (!(await directory.exists())) {
      await directory.create();
    }
    return '$directoryPath/${StaticFunctions.userId}${Strings.watermarkImageName}$extension';
  }

  static Future<void> deleteAllWatermarkAndPDFData({
    bool shouldDeleteImage = true,
    bool shouldDeletePdf = true,
  }) async {
    Directory directory = await FileUtils.getPhotoDirectory();
    List contents = directory.listSync();
    for (var content in contents) {
      //get folder of every properties
      final dirName = basename(content.path);
      if (content is Directory &&
          (dirName.startsWith(Strings.propertyFolderPrefixName) ||
              dirName.startsWith(Strings.inquiryFolderPrefixName))) {
        List files = content.listSync();
        for (var file in files) {
          if (file is File) {
            //Delete every pdf and watermarked images of property
            final fileName = basename(file.path);
            if ((shouldDeletePdf &&
                    fileName.endsWith(Strings.pdfFileExtension)) ||
                (shouldDeleteImage &&
                    (fileName.startsWith(Strings.propertyWatermarkPrefixName) &&
                        fileName.endsWith(Strings.jpgFileExtension)))) {
              file.delete();
            }
          }
        }
      }
    }
  }

  static Future<String> userProfilePicLocalPath() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final destinationPath =
        '${directory.path}/${StaticFunctions.userId}${Strings.profilePicJpgFileName}';
    return destinationPath;
  }

  static Future<String> getFileSize(int lengthInBytes, int decimals) async {
    if (lengthInBytes <= 0) return Strings.defaultFileSize;
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
    var i = (math.log(lengthInBytes) / math.log(1024)).floor();
    return ((lengthInBytes / math.pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }

  static Future<String> getPropertyPDFPath({
    required int propertyId,
    required bool isWatermarked,
  }) async {
    final fileName =
        '${isWatermarked ? Strings.propertyWatermarkPrefixName : ''}${await getPropertyPhotosDirectoryName(propertyId)}${Strings.pdfFileExtension}';
    return '${await getPropertyPhotosDirectoryPath(propertyId)}/$fileName';
  }

  static Future<String> getInquiryPDFPath({
    required int inquiryId,
  }) async {
    final fileName =
        '${await getInquiryPhotosDirectoryName(inquiryId)}${Strings.pdfFileExtension}';
    return '${await getInquiryPhotosDirectoryPath(inquiryId)}/$fileName';
  }

  static Future<Directory> getPhotoDirectory() async {
    return await getApplicationDocumentsDirectory();
  }

  static String getPropertyPhotosDirectoryName(int propertyId) {
    return '${Strings.propertyFolderPrefixName}${StaticFunctions.userInfo?.id}$propertyId';
  }

  static String getInquiryPhotosDirectoryName(int inquiryId) {
    return '${Strings.inquiryFolderPrefixName}${StaticFunctions.userInfo?.id}$inquiryId';
  }

  static Future<String> getPropertyPhotosDirectoryPath(int propertyId) async {
    final directory = await getPhotoDirectory();
    Directory folder = Directory(
        '${await directory.path}/${getPropertyPhotosDirectoryName(propertyId)}');
    if (!folder.existsSync()) {
      await folder.create();
    }
    // Folder name -> property prefix : (P) + User id (0) + Property Id : (101) => P0101
    return folder.path;
  }

  static Future<String> getInquiryPhotosDirectoryPath(int inquiryId) async {
    final directory = await getPhotoDirectory();
    Directory folder = Directory(
        '${await directory.path}/${getInquiryPhotosDirectoryName(inquiryId)}');
    if (!folder.existsSync()) {
      await folder.create();
    }
    // Folder name -> inquiry prefix : (I) + User id (0) + Inquiry Id : (101) => P0101
    return folder.path;
  }

  static deleteOldBackupDataFromInternalStorage() async {
    Directory directory = Directory(
      DirType.download.fullPath(
        relativePath: MediaStore.appFolder,
        dirName: DirName.download,
      ),
    );
    try {
      if (await directory.exists()) {
        await directory.delete(recursive: true);
      }
    } catch (_) {}
  }

  static storeBackupDataToInternalStorage(String? filePath) async {
    if (filePath != null) {
      MediaStore.appFolder = await StaticFunctions.getAppName();
      MediaStore().saveFile(
        tempFilePath: filePath,
        dirType: DirType.download,
        dirName: DirName.download,
      );
    }
  }
}
