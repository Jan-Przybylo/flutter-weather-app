import 'package:shared_preferences/shared_preferences.dart';

/// Local storage like in JS
class LocalStorage {
  static late final SharedPreferences _prefs;
  static bool _isPrefsInited = false;

  static Future<void> _init() async{
    if(_isPrefsInited) return; 
    _prefs = await SharedPreferences.getInstance();
    _isPrefsInited = true;
  }

  /// saves [value] in [key] data place
  static Future<void> save({required String key, required String value}) async {
    await _init();
    await _prefs.setString(key, value);
  }

  /// returns [key] from local data (can return null) 
  static Future<String?> load({required String key}) async {
    await _init();
    return _prefs.getString(key);
  }

  /// remove key from local data
  static Future<void> remove({required String key}) async {
    await _init();
    await _prefs.remove(key);
  }

  /// deletes all local data
  static Future<void> clear() async {
    await _init();
    await _prefs.clear();
  }

  /// return true if local data contains [key] value
  static Future<bool> has({required String key}) async {
    await _init();
    return _prefs.containsKey(key);
  }
}
