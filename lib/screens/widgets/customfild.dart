import 'package:flutter/material.dart';

class Customfild extends StatefulWidget {
  final TextEditingController controller;

  final String label;

  const Customfild({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  State<Customfild> createState() => _CustomfildState();
}

class _CustomfildState extends State<Customfild> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
            floatingLabelStyle:
                TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            label: Text(widget.label),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
      ),
    );
  }
}
