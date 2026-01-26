import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SubLogoSignUp extends StatelessWidget {
  const SubLogoSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: SizedBox(
          width: 40,
          height: 40,
          child: SvgPicture.asset(
            Assets.assetsImagesSubLogo,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
