import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class CustomProfile extends StatelessWidget {
  final XFile arquivo;
  const CustomProfile({super.key, required this.arquivo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: CircleAvatar(
            backgroundImage: FileImage(File(arquivo.path)),
          ),
        ),
      ),
    );
  }
}
