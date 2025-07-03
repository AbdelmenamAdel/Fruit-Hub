// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final SharedPreferences sharedInstance;
  LocalStorage({
    required this.sharedInstance,
  });

  void setString(String key, String value) {
    sharedInstance.setString(key, value);
  }

  getString(String key) {
    return sharedInstance.getString(key);
  }

  void setBool(String key, bool value) {
    sharedInstance.setBool(key, value);
  }

  bool getBool(String key) {
    return sharedInstance.getBool(key) ?? false;
  }

  static final String _cachedCode = 'cachedCode';

  String getCachedLanguage() {
    final code = sharedInstance.getString(_cachedCode);
    return code ?? 'en';
  }

  void changLanguage(String code) {
    sharedInstance.setString(_cachedCode, code);
  }

  void clearSecureStorage() {
    sharedInstance.clear();
  }
}
