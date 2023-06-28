import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'data/user_perfil.dart';

class NewContactController extends ValueNotifier<XFile?> {
  NewContactController() : super(null);

  getImage() async {
    final ImagePicker piker = ImagePicker();
    XFile? file = await piker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      value = file;
    } else {
      value = value;
    }
  }

  getprofile(
      {required TextEditingController nameController, required XFile? aquivo}) {
    String image = '';
    if (aquivo == null) {
      image = UserPerfil().getNameUser(name: nameController.text);
    } else {
      image = value!.path;
    }

    return image;
  }
}
