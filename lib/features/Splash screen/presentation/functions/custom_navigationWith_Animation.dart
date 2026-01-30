import 'package:final_project/features/Auth/presentation/views/signin_view.dart';
import 'package:final_project/features/home/presentation/views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void goToSignIn(context) {
  Navigator.of(context).pushReplacement(
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        if(FirebaseAuth.instance.currentUser != null&& FirebaseAuth.instance.currentUser!.emailVerified){
          return const HomeView();
        }else{
          return const SignInView();
        }
        
      },
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    ),
  );
}
