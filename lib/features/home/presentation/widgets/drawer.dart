import 'package:final_project/core/themes/provider/mode_provider.dart';
import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/features/home/presentation/widgets/logout_drawer.dart';
import 'package:final_project/features/home/presentation/widgets/top_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ModeProvider>(context);
    bool pvalue = provider.lightModeEnabled;
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
          ListTile(
            dense: true,
            leading: const Icon(Icons.dark_mode_outlined, size: 22),
            title: const Text('Dark Mode', style: TextStyle(fontSize: 14)),
            trailing: Transform.scale(
              scale: 0.88, // 👈 صغر الرقم أكتر عشان يصغر الزرار
              child: Switch(
                value: pvalue,
                activeThumbColor: Colors.black,
                inactiveThumbColor: AppColors.primaryColor,
                inactiveTrackColor: const Color(0xffc8e4fe),
                onChanged: (value) {
                  setState(() {
                    pvalue = value;
                  });
                  provider.changeMode();
                },
              ),
            ),
          ),

          const Spacer(),

          // ===== Logout =====
          LogOutDrawer(),
        ],
      ),
    );
  }
}
