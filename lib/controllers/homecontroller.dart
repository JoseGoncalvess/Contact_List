import 'package:contact_list/controllers/share_prefs.dart';
import 'package:contact_list/models/contact_model.dart';

import 'package:flutter/material.dart';

class Homecontroller extends ValueNotifier {
  Homecontroller() : super([]);

  getcontacts() {
    SharePrefs().loadContact(key: keylist).then((v) => value = v);
  }

  deletcontatc({required int index}) {
    SharePrefs()
        .deletcontatct(key: keylist, index: index)
        .then((value) => {getcontacts()});
  }

  Future savecontact({required ContactModel contact}) async {
    SharePrefs().saveContact(key: keylist, contato: contact).then((value) => {
          getcontacts(),
        });
  }
}
