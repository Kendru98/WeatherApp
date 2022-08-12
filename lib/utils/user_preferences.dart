import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;
  static const _keyLanguage = 'en';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setLanguage(String language) async =>
      await _preferences.setString(_keyLanguage, language);

  static String? getLanguage() => _preferences.getString(_keyLanguage);
}
