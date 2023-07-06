import 'dart:async';
import 'dart:convert';

import 'package:contact_list/models/contact_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePrefs {
  final String _keylist = "@ContactList";
  final String _keyFavorList = "@ContactFavor";

  // late List<ContactModel> contatos = [];
  late List<String> contatosString = [];

  savelist({required String key, required List<String> listString}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, listString);
  }

  Future<List<String>> loadList({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? [];
  }

  removelist(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  Future saveContact({
    required String key,
    required ContactModel contato,
  }) async {
    loadList(key: key).then((value) => {
          contatosString = value,
          contatosString.add(contato.toJson()),
          savelist(key: key, listString: contatosString)
        });
  }

  Future<List<ContactModel>> loadContact({
    required String key,
  }) async {
    List<ContactModel> contatos = [];
    contatosString = await loadList(key: key);
    for (var e in contatosString) {
      var json = jsonDecode(e);
      var contact = ContactModel.fromMap(json);
      contatos.add(contact);
    }
    return contatos;
  }

  Future editingContact(
      {required String key,
      required int index,
      required ContactModel contact}) async {
    loadList(key: key).then((value) => {
          contatosString = value,
          contatosString.removeAt(index),
          contatosString.add(contact.toJson()),
          savelist(key: key, listString: contatosString)
        });
    loadList(key: keyFavorList).then((value) => {
          if (value.isNotEmpty)
            {
              contatosString = value,
              contatosString.removeAt(index),
              contatosString.insert(index, contact.toJson()),
              savelist(key: key, listString: contatosString)
            }
          else
            {}
        });
  }

  Future deletcontatct({required String key, required int index}) async {
    loadList(key: key).then((value) => {
          contatosString = value,
          contatosString.removeAt(index),
          savelist(key: key, listString: contatosString)
        });
  }
}

// SharedPreferences get prefs => SharePrefs()._prefs;
String get keylist => SharePrefs()._keylist;
String get keyFavorList => SharePrefs()._keyFavorList;
