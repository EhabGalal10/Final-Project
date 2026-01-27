import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/features/Auth/presentation/widgets/custom_button.dart';
import 'package:final_project/features/Auth/presentation/widgets/custom_text_field.dart';
import 'package:final_project/features/Auth/presentation/widgets/label_form.dart';
import 'package:flutter/material.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  AutovalidateMode autovalidateModeLogin = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Form(
      key: formKeyLogin,
      autovalidateMode: autovalidateModeLogin,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            LabelForm(label: AppStrings.email),
            SizedBox(height: 8),
            CustomTextField(
              hintText: AppStrings.enterYourEmail,
              icon: Icons.email,
              validator: (email) {
                if (email == null || email.isEmpty) {
                  return 'Please enter your email';
                } else if (!RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                ).hasMatch(email)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            LabelForm(label: AppStrings.password),
            SizedBox(height: 8),
            CustomTextField(
              hintText: AppStrings.enterYourPassword,
              icon: Icons.lock,
              obscureText: true,
              validator: (password) {
                if (password == null || password.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            SizedBox(height: h * 0.1),
            CustomButton(
              label: AppStrings.loginButton,
              onPressed: () {
                if (formKeyLogin.currentState!.validate()) {
                } else {
                  setState(() {
                    autovalidateModeLogin = AutovalidateMode.always;
                  });
                }
              },
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
