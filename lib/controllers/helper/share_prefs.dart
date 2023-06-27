import 'package:shared_preferences/shared_preferences.dart';

class SharePrefs {
  late final SharedPreferences _prefs;

  Future<SharedPreferences> get init async {
    return _prefs = await SharedPreferences.getInstance();
  }
}

SharedPreferences get prefs => SharePrefs()._prefs;
