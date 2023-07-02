import 'package:contact_list/controllers/data/share_prefs.dart';
import 'package:contact_list/models/contact_model.dart';

import 'homecontroller.dart';

class EditingContactController {
  final SharePrefs prefs = SharePrefs();
  final _controlle = Homecontroller();

  editingContact(
      {required String key,
      required int index,
      required ContactModel contact}) {
    prefs
        .editingContact(key: key, index: index, contact: contact)
        .then((value) => {_controlle.getcontacts(key: keylist)});
  }
}
