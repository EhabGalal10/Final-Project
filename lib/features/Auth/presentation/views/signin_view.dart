import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:final_project/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:final_project/features/Auth/presentation/widgets/form_login.dart';
import 'package:final_project/features/Auth/presentation/widgets/have_an_account.dart';
import 'package:final_project/features/Auth/presentation/widgets/sub_logo_signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xffc8e4fe),
                Color(0xffc1e1fd),
                Color.fromARGB(255, 255, 255, 255),
              ],
              stops: [0, 0.4, 1.0],
            ),
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: h * 0.12)),
              SliverToBoxAdapter(child: SubLogoSignin()),
              SliverToBoxAdapter(child: SizedBox(height: 24)),
              SliverToBoxAdapter(
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      colors: [Color(0xff549de3), Color(0xffc8e4fe)],
                    ).createShader(bounds);
                  },

                  child: Text(
                    AppStrings.welcomeBack,
                    style: AppTextStyles.inter800style40shadow,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 5)),
              SliverToBoxAdapter(
                child: Text(
                  AppStrings.signInToContinue,
                  style: AppTextStyles.inter400style16,
                  textAlign: TextAlign.center,
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: h * 0.05)),
              SliverToBoxAdapter(child: FormLogin()),
              SliverToBoxAdapter(
                child: HaveAnAccount(
                  onTap: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  label: AppStrings.dontHaveAnAccount,
                  actionLabel: AppStrings.signUp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
