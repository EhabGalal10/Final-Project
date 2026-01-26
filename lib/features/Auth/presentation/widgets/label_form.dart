import 'package:flutter/material.dart';

class LabelForm extends StatelessWidget {
  const LabelForm({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(label, style: TextStyle(fontSize: 16)),
    );
  }
}
