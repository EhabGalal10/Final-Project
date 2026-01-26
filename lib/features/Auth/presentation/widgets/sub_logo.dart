import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SubLogo extends StatelessWidget {
  const SubLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 35,
      backgroundColor: AppColors.primaryColor,
      child: SvgPicture.asset(
        Assets.assetsImagesSubLogo,
        width: 24,
        height: 24,
        fit: BoxFit.cover,
      ),
    );
  }
}
