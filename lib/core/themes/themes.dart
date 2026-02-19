import 'package:final_project/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Themes {
  // ================= LIGHT THEME =================
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,

    scaffoldBackgroundColor: const Color(0xffF9FAFB),

    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: const Color(0xff3B82F6),
      surface: Colors.white,
      onPrimary: Colors.white,
      surfaceContainerHighest: Color(0xffEFF6FF),
      secondaryContainer: Color(0xffF9FAFB),
      onSurface: const Color(0xff111827),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      foregroundColor: Color(0xff111827),
    ),

    drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),

    cardColor: Colors.white,

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),

    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(AppColors.primaryColor),
      trackColor: WidgetStateProperty.all(const Color(0xffc8e4fe)),
    ),
  );

  // ================= DARK THEME =================
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,

    scaffoldBackgroundColor: const Color(0xff0F172A),

    colorScheme: ColorScheme.dark(
      primary: const Color(0xff3B82F6),
      secondary: const Color(0xff60A5FA),
      surface: const Color(0xff1E293B),
      secondaryContainer: Color(0xff1E293B),
      onPrimary: Colors.white,
      onSurface: Colors.white,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff1E293B),
      elevation: 0,
      foregroundColor: Colors.white,
    ),

    drawerTheme: const DrawerThemeData(backgroundColor: Color(0xff1E293B)),

    cardColor: const Color(0xff1E293B),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff3B82F6),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),

    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(const Color(0xff3B82F6)),
      trackColor: WidgetStateProperty.all(const Color(0xff334155)),
    ),
  );
}
