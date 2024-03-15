import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image/image.dart' as image;
import 'package:path/path.dart';
import 'package:path/path.dart' as path;

import './app_config.dart';
import './compress_image_helper.dart';
import '../const/string_const.dart';
import '../localdb/isar_service.dart';
import '../localdb/properties/db_property_photos_meta.dart';
import '../localdb/save_default_data.dart';
import '../utils/file_utils.dart';

class WatermarkUtils {
  static final _isarService = IsarService();

  static Future<image.BitmapFont?> _loadBitmapFontFromAsset(
      BuildContext context, String asset) {
    final Completer<image.BitmapFont?> completer =
        Completer<image.BitmapFont?>();
    DefaultAssetBundle.of(context).load(asset).then((ByteData value) {
      completer.complete(image.BitmapFont.fromZip(
          value.buffer.asUint8List(value.offsetInBytes, value.lengthInBytes)));
    }).catchError((dynamic exception, StackTrace stackTrace) {
      completer.complete(null);
    });

    return completer.future;
  }

  // Used https://snowb.org/ to generate font zip file
  static Future<image.Image> _drawString(
    BuildContext context, {
    required image.Image src,
    required String text,
  }) async {
    final height = src.height;
    final width = src.width;
    final aspectRatio = src.width / src.height;
    String fontPath = Strings.bitmapFont60;

    if (aspectRatio < 1) {
      if (aspectRatio <= 0.50) {
        if (height > width) {
          if (height >= 1000) {
            fontPath = Strings.bitmapFont90;
          } else {
            fontPath = Strings.bitmapFont60;
          }
        } else {
          fontPath = Strings.bitmapFont60;
        }
      } else {
        fontPath = Strings.bitmapFont100;
      }
    } else if (aspectRatio == 1) {
      if (height > 1080) {
        fontPath = Strings.bitmapFont100;
      } else if (height > 700) {
        fontPath = Strings.bitmapFont90;
      } else {
        fontPath = Strings.bitmapFont60;
      }
    } else if (aspectRatio > 1) {
      if (height < width) {
        fontPath = Strings.bitmapFont100;
      } else {
        fontPath = Strings.bitmapFont60;
      }
    }

    final fontToApply = (await _loadBitmapFontFromAsset(
      context,
      fontPath,
    ))!;
    debugPrint('Font size:- ${fontToApply.size}');
    var stringWidth = 0;
    var stringHeight = 0;
    final chars = text.codeUnits;
    for (var char in chars) {
      if (!fontToApply.characters.containsKey(char)) {
        continue;
      }
      final fontChar = fontToApply.characters[char]!;
      stringWidth += fontChar.xadvance;
      if (fontChar.height + fontChar.yoffset > stringHeight) {
        stringHeight = fontChar.height + fontChar.yoffset;
      }
    }
    int heightToAdd =
        fontToApply.size == 60 || fontToApply.size == 90 ? 20 : 70;
    int yPosToSubtract =
        fontToApply.size == 60 || fontToApply.size == 90 ? 20 : 50;

    final watermarkXPos = (src.width / 2).round() - (stringWidth / 2).round();
    final watermarkYPos =
        ((src.height / 2).round() - (stringHeight / 2).round()) -
            yPosToSubtract;

    final appliedWatermark = image.drawStringCentered(
      src,
      fontToApply,
      text,
      y: watermarkYPos,
    );
    return _drawLines(
      appliedWatermark,
      watermarkXPos: watermarkXPos,
      watermarkYPos: watermarkYPos,
      watermarkWidth: stringWidth,
      watermarkHeight: stringHeight + heightToAdd,
    );
  }

  static image.Image _drawLines(
    image.Image src, {
    required int watermarkXPos,
    required int watermarkYPos,
    required int watermarkWidth,
    required int watermarkHeight,
  }) {
    final heightFromImage = src.height ~/ 100;
    final widthFromImage = src.width ~/ 100;
    final lineSize =
        heightFromImage > widthFromImage ? widthFromImage : heightFromImage;
    int paddingAroundImage = 30;
    int lineColor = Colors.white.withOpacity(AppConfig.watermarkOpacity).value;
    int lineThickness = lineSize;

    final firstLineX1 = src.width ~/ 2;
    final firstLineY1 = 0;
    final firstLineX2 = src.width ~/ 2;
    final firstLineY2 = watermarkYPos - paddingAroundImage;
    image.Image firstLineImage = image.drawLine(
      src,
      firstLineX1,
      firstLineY1,
      firstLineX2,
      firstLineY2,
      lineColor,
      thickness: lineThickness,
      antialias: true,
    );

    final secondLineX1 = src.width;
    final secondLineY1 = src.height ~/ 2;
    final secondLineX2 = watermarkXPos + watermarkWidth + paddingAroundImage;
    final secondLineY2 = src.height ~/ 2;

    image.Image secondLineImage = image.drawLine(
      firstLineImage,
      secondLineX1,
      secondLineY1,
      secondLineX2,
      secondLineY2,
      lineColor,
      thickness: lineThickness,
      antialias: true,
    );

    final thirdLineX1 = 0;
    final thirdLineY1 = src.height ~/ 2;
    final thirdLineX2 = watermarkXPos - paddingAroundImage;
    final thirdLineY2 = src.height ~/ 2;

    image.Image thirdLineImage = image.drawLine(
      secondLineImage,
      thirdLineX1,
      thirdLineY1,
      thirdLineX2,
      thirdLineY2,
      lineColor,
      thickness: lineThickness,
      antialias: true,
    );

    final forthLineX1 = src.width ~/ 2;
    final forthLineY1 = src.height;
    final forthLineX2 = src.width ~/ 2;
    final forthLineY2 = watermarkYPos + watermarkHeight + paddingAroundImage;

    return image.drawLine(
      thirdLineImage,
      forthLineX1,
      forthLineY1,
      forthLineX2,
      forthLineY2,
      lineColor,
      thickness: lineThickness,
      antialias: true,
    );
  }

  static Future<image.Image> _drawImageWatermark(image.Image src) async {
    final userInfo = await _isarService.getUserInfo();
    final isWatermarkEnabled = (await _isarService
                .getSettingOf(SaveDefaultData.settingShareWatermarkId))
            ?.isChecked ??
        false;
    List<int>? _watermarkImage;
    bool _shouldApplyColor = false;
    if (isWatermarkEnabled &&
        userInfo != null &&
        userInfo.watermarkLogoPath != null &&
        File(userInfo.watermarkLogoPath!).existsSync()) {
      final watermarkFile = File(userInfo.watermarkLogoPath!);
      _watermarkImage = watermarkFile.readAsBytesSync();
      _shouldApplyColor =
          path.extension(watermarkFile.path) == Strings.pngFileExtension;
    } else {
      final ByteData bytes = await rootBundle.load(Strings.iconAppLogo);
      _watermarkImage = bytes.buffer.asUint8List();
      _shouldApplyColor = true;
    }

    if (_watermarkImage != null) {
      final heightFromImage = src.height ~/ 10;
      final widthFromImage = src.width ~/ 10;
      final watermarkSize =
          heightFromImage > widthFromImage ? widthFromImage : heightFromImage;

      image.Image watermarkImage = await image.decodeImage(_watermarkImage)!;
      image.Image resizedWatermark = await image.copyResize(
        watermarkImage,
        width: watermarkSize,
        height: watermarkSize,
      );
      //Apply color only if it is .png file.
      if (_shouldApplyColor) {
        image.colorOffset(
          resizedWatermark,
          red: 255,
          green: 255,
          blue: 255,
          alpha: 1,
        );
      }
      final watermarkWidth = resizedWatermark.width;
      final watermarkHeight = resizedWatermark.height;
      final watermarkXPos = (src.width ~/ 2) - (watermarkWidth ~/ 2);
      final watermarkYPos = (src.height ~/ 2) - (watermarkHeight ~/ 2);
      final appliedWatermark = image.copyInto(
        src,
        resizedWatermark,
        dstX: watermarkXPos,
        dstY: watermarkYPos,
      );
      return _drawLines(
        appliedWatermark,
        watermarkXPos: watermarkXPos,
        watermarkYPos: watermarkYPos,
        watermarkWidth: watermarkWidth,
        watermarkHeight: watermarkHeight,
      );
    }
    return src;
  }

  static Future<File?> applyWatermark(
    BuildContext context, {
    required DbPropertyPhotoMeta photo,
    bool forceWatermark = false,
  }) async {
    final userInfo = await _isarService.getUserInfo();
    final isWatermarkEnabled = (await _isarService
                .getSettingOf(SaveDefaultData.settingShareWatermarkId))
            ?.isChecked ??
        false;
    final propertyPhoto = File(photo.imagePath);
    final doesPropertyPhotoExists = await propertyPhoto.exists();
    if (userInfo != null &&
        (forceWatermark || isWatermarkEnabled) &&
        doesPropertyPhotoExists) {
      String dirPath = await FileUtils.getPropertyPhotosDirectoryPath(
        photo.propertyId,
      );
      final propertyPhotoFilename = basename(propertyPhoto.path);
      final String watermarkedPath =
          '$dirPath/${Strings.propertyWatermarkPrefixName}$propertyPhotoFilename';
      final watermarkFile = File(watermarkedPath);
      final doesWatermarkExists = await watermarkFile.exists();
      if (!photo.isWatermarkGenerated || !doesWatermarkExists) {
        if (doesWatermarkExists) {
          await watermarkFile.delete();
        }
        final tempFilePath = await FileUtils.getTempFilePath();
        await CompressImageHelper.compressHelper(
          propertyPhoto.path,
          tempFilePath,
        );
        final compressedFile = File(tempFilePath);
        image.Image src =
            await image.decodeImage(compressedFile.readAsBytesSync())!;
        final localizationsContext = AppLocalizations.of(context);
        final isText =
            userInfo.watermarkType == SaveDefaultData.watermarkTypeTextId;
        final imageWithWatermark = await (isWatermarkEnabled && isText
            ? _drawString(
                context,
                src: src,
                text: userInfo.watermarkText ?? localizationsContext!.appName,
              )
            : _drawImageWatermark(src));
        final watermarkedFile = await watermarkFile.writeAsBytes(
          Uint8List.fromList(
            image.encodeJpg(
              imageWithWatermark,
              quality: 50,
            ),
          ),
        );
        await compressedFile.delete();
        photo.isWatermarkGenerated = true;
        await _isarService.savePhotoMeta(photo);
        debugPrint('image saved at ${watermarkedPath}');
        return watermarkedFile;
      } else {
        return watermarkFile;
      }
    } else if (doesPropertyPhotoExists) {
      return propertyPhoto;
    }
    return null;
  }
}
