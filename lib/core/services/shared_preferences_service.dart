import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferencesService._();

  static final SharedPreferencesService instance =
  SharedPreferencesService._();

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //==========================
  // String
  //==========================

  Future<bool> setString(String key, String value) {
    return _prefs.setString(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  //==========================
  // Bool
  //==========================

  Future<bool> setBool(String key, bool value) {
    return _prefs.setBool(key, value);
  }

  bool getBool(String key, {bool defaultValue = false}) {
    return _prefs.getBool(key) ?? defaultValue;
  }

  //==========================
  // Int
  //==========================

  Future<bool> setInt(String key, int value) {
    return _prefs.setInt(key, value);
  }

  int getInt(String key, {int defaultValue = 0}) {
    return _prefs.getInt(key) ?? defaultValue;
  }

  //==========================
  // Double
  //==========================

  Future<bool> setDouble(String key, double value) {
    return _prefs.setDouble(key, value);
  }

  double getDouble(String key, {double defaultValue = 0}) {
    return _prefs.getDouble(key) ?? defaultValue;
  }

  //==========================
  // String List
  //==========================

  Future<bool> setStringList(String key, List<String> value) {
    return _prefs.setStringList(key, value);
  }

  List<String> getStringList(String key) {
    return _prefs.getStringList(key) ?? [];
  }

  //==========================
  // Remove
  //==========================

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }

  //==========================
  // Clear
  //==========================

  Future<bool> clear() {
    return _prefs.clear();
  }

  //==========================
  // Contains
  //==========================

  bool containsKey(String key) {
    return _prefs.containsKey(key);
  }
}