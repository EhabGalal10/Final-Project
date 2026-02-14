import 'package:final_project/features/home/presentation/widgets/logout_drawer.dart';
import 'package:final_project/features/home/presentation/widgets/top_drawer.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          CustomTopDrawer(),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home', style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          const Spacer(),

          // ===== Logout =====
          LogOutDrawer(),
        ],
      ),
    );
  }
}
