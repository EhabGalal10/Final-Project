  import 'package:final_project/features/Auth/presentation/views/signin_view.dart';
import 'package:flutter/material.dart';

void goToSignIn(context) {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (_, __, ___) => const SignInView(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }
