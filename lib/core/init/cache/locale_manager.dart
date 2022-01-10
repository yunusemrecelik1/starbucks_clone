// Package imports:
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starbucks_clone/core/constants/enums/locale_keys_enum.dart';

class LocaleManager {
  static LocaleManager _instance = LocaleManager._init();

  SharedPreferences? _preferences;
  static LocaleManager get instance => _instance;

  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }
  static preferencesInit() async {
    if (instance._preferences == null) {
      instance._preferences = await SharedPreferences.getInstance();
    }
    return;
  }

  Future<void> clearAll() async {
    await _preferences!.clear();
  }
  ///TOKENİ ALIP BURAYA KAYDEDECEĞİZ
  Future<void> setStringValue(PreferencesKeys key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }

  Future<void> setBoolValue(PreferencesKeys key, bool value) async {
    await _preferences!.setBool(key.toString(), value);
  }

}
