import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

import '../../const/string_const.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/save_default_data.dart';
import '../../localdb/user_info/db_user_info.dart';
import '../../network/dio_client.dart';
import '../../utils/app_config.dart';
import '../../utils/file_utils.dart';
import '../../widgets/snack_bar_view.dart';

class UploadWatermarkProvider extends ChangeNotifier {
  final _isarService = IsarService();
  late AppLocalizations localizationsContext;
  bool isTypeImageSelected = true;
  bool isValid = true;
  Size watermarkIconSize = Size(0, 0);
  Size watermarkPreviewSize = Size(0, 0);
  File? selectedImage = null;
  bool isWatermarkChanged = false;
  final watermarkTextController = TextEditingController();

  init(AppLocalizations localizationsContext) async {
    final userInfo = await _isarService.getUserInfo();
    this.localizationsContext = localizationsContext;
    watermarkTextController.text = localizationsContext.appName;
    if (userInfo != null) {
      isTypeImageSelected =
          userInfo.watermarkType == SaveDefaultData.watermarkTypeImageId;

      if (userInfo.watermarkLogoPath != null &&
          userInfo.watermarkLogoPath!.trim().isNotEmpty &&
          File(userInfo.watermarkLogoPath!).existsSync()) {
        selectedImage = File(userInfo.watermarkLogoPath!);
      }
      if (userInfo.watermarkText != null &&
          userInfo.watermarkText!.trim().isNotEmpty) {
        watermarkTextController.text = userInfo.watermarkText!;
      }
    }
    validate();
  }

  openImagePicker(BuildContext context) async {
    if (isTypeImageSelected) {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        if (path.extension(pickedFile.path) == Strings.pngFileExtension ||
            path.extension(pickedFile.path) == Strings.jpgFileExtension) {
          selectedImage = await File(pickedFile.path);
          isWatermarkChanged = true;
          notifyListeners();
        } else {
          SnackBarView.showSnackBar(
            context,
            localizationsContext.watermarkMustBePng,
          );
        }
      }
    }
    validate();
  }

  updateWatermark(BuildContext context) async {
    validate();
    if (isValid) {
      FileUtils.deleteAllWatermarkAndPDFData();
      final userInfo = await _isarService.getUserInfo();
      if (userInfo != null) {
        userInfo.watermarkType = isTypeImageSelected
            ? SaveDefaultData.watermarkTypeImageId
            : SaveDefaultData.watermarkTypeTextId;
        if (isTypeImageSelected &&
            isWatermarkChanged &&
            selectedImage != null) {
          final watermarkPath = await FileUtils.getWatermarkFilePath(
            extension: path.extension(selectedImage!.path),
          );
          final watermarkFile = await File(watermarkPath);
          if (await watermarkFile.exists()) {
            await watermarkFile.delete();
          }
          final fileToSave =
              await File(selectedImage!.path).copy(watermarkPath);
          FileUtils.clearCacheImages();
          userInfo.watermarkLogoPath = fileToSave.path;
        } else if (!isTypeImageSelected) {
          userInfo.watermarkText = watermarkTextController.text;
        }
        await _isarService.saveOrUpdateUserInfo(userInfo);
        _uploadWatermarkInfoToServer(userInfo);
        Navigator.pop(context);
      }
    }
  }

  switchWatermarkType(bool isImage) {
    isTypeImageSelected = isImage;
    validate();
  }

  validate() {
    isValid = ((isTypeImageSelected &&
            (selectedImage == null ||
                (path.extension(selectedImage!.path) ==
                        Strings.pngFileExtension ||
                    path.extension(selectedImage!.path) ==
                        Strings.jpgFileExtension))) ||
        (!isTypeImageSelected &&
            watermarkTextController.text.trim().length >=
                AppConfig.watermarkTextMinLength));
    notifyListeners();
  }

  setWatermarkSize(Size size) {
    this.watermarkIconSize = size;
    notifyListeners();
  }

  setWatermarkPreviewSize(Size size) {
    this.watermarkPreviewSize = size;
    notifyListeners();
  }

  _uploadWatermarkInfoToServer(DbUserInfo userInfo) {
    String type = '';
    String? filePath;
    String? text;
    if (userInfo.watermarkType == SaveDefaultData.watermarkTypeImageId) {
      type = SaveDefaultData.watermarkTypeImageString;
      filePath = userInfo.watermarkLogoPath;
    } else if (userInfo.watermarkType == SaveDefaultData.watermarkTypeTextId) {
      type = SaveDefaultData.watermarkTypeTextString;
      text = userInfo.watermarkText;
    }
    DioClient().updateWatermark(
      watermarkType: type,
      watermarkLogoPath: filePath,
      watermarkText: text,
    );
  }
}
