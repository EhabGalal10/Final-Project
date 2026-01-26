import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class LabelForm extends StatelessWidget {
  const LabelForm({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(label, style: AppTextStyles.interMediumstyle14),
    );
  }
}
