import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../controller/data/user_perfil.dart';

class NewContactController extends ValueNotifier<XFile?> {
  NewContactController() : super(null);
  ValueNotifier<bool> onfile = ValueNotifier<bool>(false);

  getImageFile() async {
    final ImagePicker piker = ImagePicker();
    XFile? file = await piker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      value = file;
    } else {
      value = value;
    }
    onfile.value = false;
  }

  getImagePhoto() async {
    final ImagePicker piker = ImagePicker();
    XFile? file = await piker.pickImage(source: ImageSource.camera);

    if (file != null) {
      value = file;
    } else {
      value = value;
    }
    onfile.value = false;
  }

  getprofile(
      {required TextEditingController nameController, required XFile? aquivo}) {
    String image = '';
    if (aquivo == null) {
      image = UserPerfil().getNameUser(name: nameController.text.toUpperCase());
    } else {
      image = aquivo.path;
    }

    return image;
  }
}
