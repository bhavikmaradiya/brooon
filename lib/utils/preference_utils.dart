import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static const activeBackupAccountKey = 'active_backup_account';

  static saveToPreference(String key, dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is int) {
      await prefs.setInt(key, value);
    }
    if (value is bool) {
      await prefs.setBool(key, value);
    }
    if (value is double) {
      await prefs.setDouble(key, value);
    }
    if (value is String) {
      await prefs.setString(key, value);
    }
    if (value is List<String>) {
      await prefs.setStringList(key, value);
    }
  }

  static Future<String?> getActiveBackupAccount() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(activeBackupAccountKey);
  }
}
