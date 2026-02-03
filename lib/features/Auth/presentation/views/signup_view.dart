import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:final_project/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:final_project/features/Auth/presentation/widgets/form_signup.dart';
import 'package:final_project/features/Auth/presentation/widgets/sub_logo_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
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
                SizedBox(height: h * 0.06),
                SubLogoSignUp(),
                Text(
                  AppStrings.createAccount,
                  style: AppTextStyles.inter700style30,
                  textAlign: TextAlign.center,
                ),
                Text(
                  AppStrings.joinMokhi,
                  style: AppTextStyles.inter400style16,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                FormSignUp(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
