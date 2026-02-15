import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:final_project/core/widgets/no_intenet_view.dart';
import 'package:final_project/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:final_project/features/Auth/presentation/widgets/form_login.dart';
import 'package:final_project/features/Auth/presentation/widgets/have_an_account.dart';
import 'package:final_project/features/Auth/presentation/widgets/sub_logo_signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return OfflineBuilder(
      connectivityBuilder:
          (
            BuildContext context,
            List<ConnectivityResult> connectivity,
            Widget child,
          ) {
            final bool connected = !connectivity.contains(
              ConnectivityResult.none,
            );

            return connected ? child : const Center(child: NoInternetView());
          },
      child: BlocProvider(
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
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 255, 255, 255),
                  Color(0xffc1e1fd),
                ],
                stops: [0.1, 0.22, 0.75, 1.0],
              ),
            ),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: h * 0.12)),
                SliverToBoxAdapter(
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromARGB(255, 5, 2, 172),
                          Color.fromARGB(255, 85, 165, 241),
                        ],
                        stops: [0, 0.7],
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.srcIn,
                    child: SubLogoSignin(),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 24)),
                SliverToBoxAdapter(
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 5, 2, 172),
                          Color.fromARGB(255, 85, 165, 241),
                        ],
                        stops: [0, 0.9],
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.srcIn,
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
      ),
    );
  }
}