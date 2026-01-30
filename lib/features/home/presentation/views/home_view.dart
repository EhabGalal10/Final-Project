import 'package:final_project/features/home/presentation/widgets/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: customDrawer(
        userName: 'Ahmed ElQady',
        avatarUrl: 'https://i.pravatar.cc/300',
        onHomeTap: () {
          Navigator.pop(context);
        },
        onLogoutTap: () {
          FirebaseAuth.instance.signOut();
          Navigator.of(context).pushReplacementNamed('/signin');
        },
      ),
      appBar: AppBar(title: const Text('Home'), centerTitle: true),
      body: const Center(child: Text('Welcome to the Home Screen!')),
    );
  }
}
