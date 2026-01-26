import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({super.key, required this.actionLabel, required this.label,required this.onTap});
  final String actionLabel;
  final String label;
  final VoidCallback? onTap ;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: AppTextStyles.inter400style16,
        ),
        GestureDetector(
          onTap:onTap,
          child: Text(
            actionLabel,
            style: AppTextStyles.inter300style18.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
