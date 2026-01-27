import 'package:final_project/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:final_project/features/Auth/presentation/cubit/auth_state.dart';
import 'package:final_project/features/Auth/presentation/views/signin_view.dart';
import 'package:final_project/features/Auth/presentation/views/signup_view.dart';
import 'package:final_project/features/Splash%20screen/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Mokhi());
}

class Mokhi extends StatelessWidget {
  const Mokhi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mokhi App',
      home: SplashView(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/signin': (context) => const SignInView(),
        '/signup': (context) => const SignupView(),
      },
    );
  }
}
