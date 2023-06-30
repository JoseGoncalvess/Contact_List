import 'package:flutter/material.dart';

import '../../controllers/data/validator_mixin.dart';

class Customfild extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType typekeybord;

  final String label;
  final IconData prefixicons;

  const Customfild({
    super.key,
    required this.controller,
    required this.label,
    required this.prefixicons,
    required this.validator,
    required this.typekeybord,
  });

  @override
  State<Customfild> createState() => _CustomfildState();
}

class _CustomfildState extends State<Customfild> with ValidatorMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: widget.typekeybord,
        validator: widget.validator,
        controller: widget.controller,
        decoration: InputDecoration(
            prefixIcon: Icon(widget.prefixicons),
            prefixIconColor: Colors.green,
            floatingLabelStyle:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            label: Text(widget.label),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
      ),
    );
  }
}
