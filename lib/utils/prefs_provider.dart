import 'package:shared_preferences/shared_preferences.dart';

Future<void> savePrefsValue(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

Future<String?> getPrefsValue(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}
