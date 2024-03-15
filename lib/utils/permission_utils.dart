import 'package:permission_handler/permission_handler.dart';

class PermissionUtils {
  static Future<bool?> getStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      return true;
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
      return null;
    } else if (await Permission.storage.request().isDenied) {
      return false;
    }
    return false;
  }
}
