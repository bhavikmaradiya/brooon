import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class CompressImageHelper {
  static compressHelper(String originPath, String destinationPath) async {
    final isFileAvailable = await File(originPath).exists();
    if (isFileAvailable) {
      final sizeInByte = await File(originPath).length();
      // Compress only if size is > 100 KB
      if (sizeInByte > 100000) {
        // if size >= 2MB then quality will be 40
        if (sizeInByte >= 2000000) {
          await _compressImages(
            originPath,
            destinationPath,
            40,
          );
        } else if (sizeInByte >= 1000000 && sizeInByte < 2000000) {
          // size >= 1MB < 2MB -> quality: 60
          await _compressImages(
            originPath,
            destinationPath,
            60,
          );
        } else {
          // size < 1MB -> quality: 70
          await _compressImages(
            originPath,
            destinationPath,
            70,
          );
        }
      } else {
        // copy less size image to property folder
        await File(originPath).copy(destinationPath);
      }
    }
  }

  static _compressImages(
    String originPath,
    String destinationPath,
    int quality,
  ) async {
    try {
      await FlutterImageCompress.compressAndGetFile(
        originPath,
        destinationPath,
        quality: quality,
      );
    } catch (error) {
      debugPrint('Error while compressing: $error');
    }
  }
}
