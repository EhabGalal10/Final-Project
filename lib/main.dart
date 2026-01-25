import 'package:final_project/features/Splash%20screen/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Mokhi());
}

class Mokhi extends StatelessWidget {
  const Mokhi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mokhi App',
      home:SplashScreen(),
    );
  }
}