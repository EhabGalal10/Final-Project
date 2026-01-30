import 'package:flutter/material.dart';

Drawer customDrawer({
  required String userName,
  required String avatarUrl,
  required VoidCallback onHomeTap,
  required VoidCallback onLogoutTap,
}) {
  return Drawer(
    child: Column(
      children: [
        // ===== Header =====
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 40),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff6A11CB),
                Color(0xff2575FC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(avatarUrl),
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 12),
              Text(
                userName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // ===== Home =====
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text(
            'Home',
            style: TextStyle(fontSize: 16),
          ),
          onTap: onHomeTap,
        ),

        const Spacer(),

        // ===== Logout =====
        Padding(
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
            onTap: onLogoutTap,
          ),
        ),
      ],
    ),
  );
}
