import 'package:final_project/core/themes/provider/mode_provider.dart';
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
    final theme = Theme.of(context);

    return Drawer(
      backgroundColor: theme.colorScheme.surface,
      child: Column(
        children: [
          const CustomTopDrawer(),
          const SizedBox(height: 20),

          // ================= Home =================
          ListTile(
            leading: Icon(
              Icons.home_outlined,
              color: theme.colorScheme.onSurface,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 16,
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          // ================= Dark Mode =================
          ListTile(
            dense: true,
            leading: Icon(
              Icons.dark_mode_outlined,
              size: 22,
              color: theme.colorScheme.onSurface,
            ),
            title: Text(
              'Dark Mode',
              style: TextStyle(
                fontSize: 14,
                color: theme.colorScheme.onSurface,
              ),
            ),
            trailing: Transform.scale(
              scale: 0.88,
              child: Switch(
                value: pvalue,

                // لما يكون شغال
                activeThumbColor: theme.colorScheme.primary,

                // لون الـ track في light
                inactiveTrackColor: theme.brightness == Brightness.dark
                    ? const Color(0xffc8e4fe)
                    : theme.colorScheme.surfaceContainerHighest,

                onChanged: (value) {
                  provider.changeMode();
                },
              ),
            ),
          ),

          const Spacer(),

          // ================= Logout =================
          const LogOutDrawer(),
        ],
      ),
    );
  }
}
