import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/features/Auth/presentation/widgets/custom_button.dart';
import 'package:final_project/features/Auth/presentation/widgets/custom_text_field.dart';
import 'package:final_project/features/Auth/presentation/widgets/label_form.dart';
import 'package:flutter/material.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            LabelForm(label: AppStrings.email),
            SizedBox(height: 8),
            CustomTextField(
              hintText: AppStrings.enterYourEmail,
              icon: Icons.email,
            ),
            SizedBox(height: 16),
            LabelForm(label: AppStrings.password),
            SizedBox(height: 8),
            CustomTextField(
              hintText: AppStrings.enterYourPassword,
              icon: Icons.lock,
              obscureText: true,
            ),
            SizedBox(height: h * 0.1),
            CustomButton(label: AppStrings.loginButton, onPressed: () {}),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
