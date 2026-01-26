import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,required this.onPressed, required this.label,
  });
final void Function()? onPressed;
final String label;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 60),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(
        label,
        style: AppTextStyles.inter300style18.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
