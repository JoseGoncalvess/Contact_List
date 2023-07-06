import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
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
      image = converImaB64(fileImage: aquivo);
    }

    return image;
  }

  Future getimageContact() async {
    final ImagePicker piker = ImagePicker();
    XFile? file = await piker.pickImage(
        source: ImageSource.gallery, maxHeight: 600, maxWidth: 600);

    if (file != null) {
      List<int> imageBytes = File(file.path).readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      return base64Image;
    } else {
      return null;
    }
  }

  converImaB64({
    required XFile fileImage,
  }) {
    List<int> imageBytes = File(fileImage.path).readAsBytesSync();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
  }

  convert64ToInmage(String base64) {
    Uint8List bytImage = base64Decode(base64);

    return bytImage;
  }
}
