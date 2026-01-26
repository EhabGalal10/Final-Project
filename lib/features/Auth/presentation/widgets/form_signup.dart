import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/features/Auth/presentation/widgets/custom_button.dart';
import 'package:final_project/features/Auth/presentation/widgets/custom_text_field.dart';
import 'package:final_project/features/Auth/presentation/widgets/have_an_account.dart';
import 'package:final_project/features/Auth/presentation/widgets/label_form.dart';
import 'package:flutter/material.dart';

class FormSignUp extends StatelessWidget {
  const FormSignUp({super.key});

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
          child: Column(
            children: [
              LabelForm(label: AppStrings.fullName),
              SizedBox(height: 5),
              CustomTextField(
                hintText: AppStrings.enterFullName,
                icon: Icons.person,
                fillColor: Colors.grey[100],
              ),
              SizedBox(height: 15),
              LabelForm(label: AppStrings.email),
              SizedBox(height: 5),
              CustomTextField(
                hintText: AppStrings.enterYourEmail,
                icon: Icons.email,
                fillColor: Colors.grey[100],
              ),
              SizedBox(height: 15),
              LabelForm(label: AppStrings.password),
              SizedBox(height: 5),
              CustomTextField(
                hintText: AppStrings.enterYourPassword,
                icon: Icons.lock,
                obscureText: true,
                fillColor: Colors.grey[100],
              ),
              SizedBox(height: 15),
              LabelForm(label: AppStrings.confirmPassword),
              SizedBox(height: 5),
              CustomTextField(
                hintText: AppStrings.confirmYourPassword,
                icon: Icons.lock,
                obscureText: true,
                fillColor: Colors.grey[100],
              ),
              SizedBox(height: 25),
              CustomButton(label: AppStrings.signUp, onPressed: () {}),
              SizedBox(height: 15),
              HaveAnAccount(
                onTap: () {
                  Navigator.pop(context);
                },
                label: AppStrings.dontHaveAnAccount,
                actionLabel: AppStrings.signUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
