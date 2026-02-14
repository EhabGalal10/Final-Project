import 'package:final_project/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static final TextStyle inter700style48 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    fontFamily: 'Inter',
  );

  static final TextStyle inter300style18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w300,
    color: Colors.white,
    fontFamily: 'Inter',
  );
  static final TextStyle inter800style40shadow = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w800,
    // color: AppColors.primaryColor,
    fontFamily: 'Inter',
    // shadows: [
    //   Shadow(
    //     color: Colors.grey.shade300,
    //     blurRadius: 1,
    //     offset: const Offset(0, 2),
    //   ),
    // ],
  );
  static final TextStyle inter400style16 = TextStyle(
    fontSize: 16,
    color: Color(0xff4a78b8),
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
  );
  static final TextStyle interMediumstyle16 = TextStyle(
    fontSize: 16,
    color: Colors.black87,
    fontFamily: 'Inter',
  );
  static final TextStyle interRegularstyle12 = TextStyle(
    fontSize: 12,
    color: Color(0xff6B7280),
    fontFamily: 'Inter',
  );
  static final TextStyle inter700style30shadow = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    // color: AppColors.primaryColor,
    fontFamily: 'Inter',
  );
  static final TextStyle inter700style20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryColor,
    fontFamily: 'Inter',
  );
}
