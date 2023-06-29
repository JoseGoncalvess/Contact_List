import 'package:flutter/material.dart';

class EditingContactController {
  final ValueNotifier name = ValueNotifier('');
  final ValueNotifier emaail = ValueNotifier('');
  final ValueNotifier number = ValueNotifier('');
}
