import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SubLogoSignin extends StatelessWidget {
  const SubLogoSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: AppColors.primaryColor,
      child: SvgPicture.asset(
        Assets.assetsImagesSubLogo,
        width: 40,
        height: 40,
        fit: BoxFit.cover,
      ),
    );
  }
}
