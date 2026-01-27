import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:final_project/features/Auth/presentation/cubit/auth_state.dart';
import 'package:final_project/features/Auth/presentation/widgets/custom_button.dart';
import 'package:final_project/features/Auth/presentation/widgets/custom_text_field.dart';
import 'package:final_project/features/Auth/presentation/widgets/have_an_account.dart';
import 'package:final_project/features/Auth/presentation/widgets/label_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormSignUp extends StatelessWidget {
  const FormSignUp({super.key});

  @override
  Widget build(BuildContext context) {
        AuthCubit cubit = context.read<AuthCubit>();
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

    if (state is AuthAutoValidate) {
      autoValidateMode = state.autovalidateMode;
    }
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
              key: cubit.formKeySignUp,
              autovalidateMode: autoValidateMode,
              child: Column(
                children: [
                  LabelForm(label: AppStrings.fullName),
                  SizedBox(height: 5),
                  CustomTextField(
                    hintText: AppStrings.enterFullName,
                    icon: Icons.person,
                    fillColor: Colors.grey[100],
                    onChanged: (name) {
                      cubit.name = name;
                    },
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
                    onChanged: (email) {
                      cubit.email = email;
                    },
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
                    onChanged: (password) {
                      cubit.password = password;
                    },
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
                    onChanged: (confirmPassword) {
                      cubit.confirmPassword =
                          confirmPassword;
                    },
                    obscureText: true,
                    fillColor: Colors.grey[100],
                    validator: (confirmPassword) {
                      if (confirmPassword == null || confirmPassword.isEmpty) {
                        return 'Please confirm your password';
                      } else if (confirmPassword !=
                          cubit.password) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25),
                  CustomButton(
                    label: AppStrings.signUpButton,
                    onPressed: () {
                      if (cubit.formKeySignUp.currentState!.validate()) {
                        // Process data.
                      } else {
                        cubit.enableAutoValidate();
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
      },
    );
  }
}
