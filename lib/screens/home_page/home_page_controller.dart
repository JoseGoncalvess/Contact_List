import 'package:contact_list/models/contact_model.dart';

import 'package:flutter/material.dart';

import '../../controller/data/share_prefs.dart';

class Homecontroller extends ValueNotifier<List<ContactModel>> {
  Homecontroller() : super([]);
  ValueNotifier<bool> drop = ValueNotifier<bool>(false);
  ValueNotifier<bool> listselect = ValueNotifier<bool>(false);

  getcontacts({required String key}) {
    SharePrefs().loadContact(key: key).then((v) => value = v);
  }

  deletcontatc({required int index, required String key}) {
    SharePrefs()
        .deletcontatct(key: key, index: index)
        .then((value) => {getcontacts(key: key)});
  }

  Future savecontact(
      {required ContactModel contact, required String key}) async {
    SharePrefs().saveContact(key: key, contato: contact).then((value) => {
          getcontacts(key: keylist),
        });
  }
}
