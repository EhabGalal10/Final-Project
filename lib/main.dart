import 'package:final_project/features/Auth/presentation/views/signin_view.dart';
import 'package:final_project/features/Auth/presentation/views/signup_view.dart';
import 'package:final_project/features/Splash%20screen/presentation/views/splash_view.dart';
import 'package:final_project/features/diagnosis/presentation/views/diagnosis_view.dart';
import 'package:final_project/features/history/presentation/views/history_view.dart';
import 'package:final_project/features/home/presentation/views/doctors_view.dart';
import 'package:final_project/features/home/presentation/views/home_view.dart';
import 'package:final_project/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
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
        '/home': (context) => const HomeView(),
        '/doctorsView': (context) => const DoctorsView(),
        '/diagnosisView': (context) => const DiagnosisView(),
        '/historyView': (context) => const HistoryView(),
      },
    );
  }
}
