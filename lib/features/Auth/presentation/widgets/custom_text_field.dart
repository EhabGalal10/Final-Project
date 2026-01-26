import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CutomTextField extends StatelessWidget {
  const CutomTextField({super.key, required this.icon, required this.hintText});
  final IconData icon;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: textBorderStyle(),
        enabledBorder: textBorderStyle(),
        focusedBorder: textBorderStyle(),
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        prefixIcon: Icon(icon, color: Color(0Xff9CA3AF)),
        hintStyle: AppTextStyles.inter400style16.copyWith(
          color: Color(0XffADAEBC),
        ),
      ),
    );
  }

  OutlineInputBorder textBorderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Color(0xffE5E7EB), width: 1.2),
    );
  }
}
