import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/features/Auth/presentation/widgets/custom_button.dart';
import 'package:final_project/features/Auth/presentation/widgets/custom_text_field.dart';
import 'package:final_project/features/Auth/presentation/widgets/have_an_account.dart';
import 'package:final_project/features/Auth/presentation/widgets/label_form.dart';
import 'package:flutter/material.dart';

class FormSignUp extends StatefulWidget {
  const FormSignUp({super.key});

  @override
  State<FormSignUp> createState() => _FormSignUpState();
}

class _FormSignUpState extends State<FormSignUp> {
  GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();
  AutovalidateMode autovalidateModeSignUp = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Form(
          key: formKeySignUp,
          autovalidateMode: autovalidateModeSignUp,
          child: Column(
            children: [
              LabelForm(label: AppStrings.fullName),
              SizedBox(height: 5),
              CustomTextField(
                hintText: AppStrings.enterFullName,
                icon: Icons.person,
                fillColor: Colors.grey[100],
                validator: (name) {
                  if (name == null || name.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              LabelForm(label: AppStrings.email),
              SizedBox(height: 5),
              CustomTextField(
                hintText: AppStrings.enterYourEmail,
                icon: Icons.email,
                fillColor: Colors.grey[100],
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
              SizedBox(height: 15),
              LabelForm(label: AppStrings.password),
              SizedBox(height: 5),
              CustomTextField(
                hintText: AppStrings.enterYourPassword,
                icon: Icons.lock,
                obscureText: true,
                fillColor: Colors.grey[100],
                validator: (password) {
                  if (password == null || password.isEmpty) {
                    return 'Please enter your password';
                  } else if (password.length < 8) {
                    return 'Password must be Strong';
                  } else if (!RegExp(r'\d').hasMatch(password)) {
                    return 'Password must be Strong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              LabelForm(label: AppStrings.confirmPassword),
              SizedBox(height: 5),
              CustomTextField(
                hintText: AppStrings.confirmYourPassword,
                icon: Icons.lock,
                obscureText: true,
                fillColor: Colors.grey[100],
                validator: (confirmPassword) {
                  if (confirmPassword == null || confirmPassword.isEmpty) {
                    return 'Please confirm your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 25),
              CustomButton(
                label: AppStrings.signUpButton,
                onPressed: () {
                  if (formKeySignUp.currentState!.validate()) {
                    // Process data.
                  } else {
                    setState(() {
                      autovalidateModeSignUp = AutovalidateMode.always;
                    });
                  }
                },
              ),
              SizedBox(height: 15),
              HaveAnAccount(
                onTap: () {
                  Navigator.pop(context);
                },
                label: AppStrings.alreadyHaveAnAccount,
                actionLabel: AppStrings.logIn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
