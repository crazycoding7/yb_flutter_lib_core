import 'package:shared_preferences/shared_preferences.dart';

/// 缓存
class YbSharePreference {
  static late SharedPreferences _prefs;

  /// 初始化(一次)
  static init() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _prefs = sp;
  }

  static setIntCache({required String name, int? value, int defaultValue = 0}) {
    _prefs.setInt(name, value ?? defaultValue);
  }

  static setDoubleCache(
      {required String name, double? value, double defaultValue = 0}) {
    _prefs.setDouble(name, value ?? defaultValue);
  }

  static setBoolCache(
      {required String name, bool? value, bool defaultValue = false}) {
    _prefs.setBool(name, value ?? defaultValue);
  }

  static setStringCache(
      {required String name, String? value, String defaultValue = ''}) {
    _prefs.setString(name, value ?? defaultValue);
  }

  static int? getIntCache({required String name}) {
    return _prefs.getInt(name);
  }

  static double? getDoubleCache({required String name}) {
    return _prefs.getDouble(name);
  }

  static bool? getBoolCache({required String name}) {
    return _prefs.getBool(name);
  }

  static String? getStringCache({required String name}) {
    return _prefs.getString(name);
  }
}
