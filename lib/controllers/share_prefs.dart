import 'package:contact_list/models/contact_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePrefs {
  late final SharedPreferences _prefs;
  final String _keylist = "@ContactList";
  final String _keyFavorList = "@ContactFavor";

  late List<ContactModel> contatos;

  Future<SharedPreferences> get init async {
    return _prefs = await SharedPreferences.getInstance();
  }

  savelist(String key, List<String> listcontatct) {
    prefs.setStringList(key, listcontatct);
  }

  Future<List<String>?> loadList(String key) async {
    return prefs.getStringList(key);
  }
}

SharedPreferences get prefs => SharePrefs()._prefs;
