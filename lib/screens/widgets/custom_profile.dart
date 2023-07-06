import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class CustomProfile extends StatelessWidget {
  final XFile? arquivo;
  final Uint8List? image;
  const CustomProfile({super.key, required this.arquivo, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: arquivo == null
              ? Container(
                  width: 400,
                  height: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: MemoryImage(image!), fit: BoxFit.cover)),
                )
              : CircleAvatar(
                  backgroundImage: FileImage(File(arquivo!.path)),
                ),
        ),
      ),
    );
  }
}
