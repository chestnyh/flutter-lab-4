import 'package:shared_preferences/shared_preferences.dart';

class PrefStorage {
  static final String themeDarkModeStoreKey = 'theme_dark_mode_store_key';

  static Future<bool> saveDarkModePref(bool darkMode) async {
    var prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(themeDarkModeStoreKey, darkMode);
  }

  static Future<bool> getDarkModePref() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool(themeDarkModeStoreKey);
  }

}