import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogOutDrawer extends StatelessWidget {
  const LogOutDrawer({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        leading: const Icon(
          Icons.logout,
          color: Colors.red,
        ),
        title: const Text(
          'Logout',
          style: TextStyle(
            color: Colors.red,
            fontSize: 16,
          ),
        ),
        onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacementNamed('/signin');
              },
      ),
    );
  }
}

