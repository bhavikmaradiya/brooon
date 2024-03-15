import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import './file_utils.dart';
import './static_functions.dart';
import '../localdb/isar_service.dart';

class DownloadHelper {
  downloadWatermark(String path) async {
    String? url = StaticFunctions.watermarkServerFullPath(path);
    if (StaticFunctions.isHttpUrl(url)) {
      try {
        var response = await http.get(Uri.parse(url!));
        final filePath =
            await FileUtils.getWatermarkFilePath(extension: extension(path));
        File file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        final userInfo = StaticFunctions.userInfo;
        if (userInfo != null) {
          userInfo.watermarkLogoPath = filePath;
          IsarService().saveOrUpdateUserInfo(userInfo);
        }
      } catch (error) {
        debugPrint('Watermark: $error');
      }
    }
  }
}
