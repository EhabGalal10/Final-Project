import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/features/Auth/presentation/widgets/form_signup.dart';
import 'package:final_project/features/Auth/presentation/widgets/sub_logo_signup.dart';
import 'package:flutter/material.dart';


class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffEFF6FF), Color(0xffFFFFFF)],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              SubLogoSignUp(),
              Text(
                AppStrings.createAccount,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text('Join Mokhi for AI brain analysis'),
              SizedBox(height: 20),
              FormSignUp(),
            ],
          ),
        ),
      ),
    );
  }
}
