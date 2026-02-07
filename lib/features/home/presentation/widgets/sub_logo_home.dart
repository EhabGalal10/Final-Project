import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_images.dart';
import 'package:flutter/material.dart';


class SubLogoHome extends StatelessWidget {
  const SubLogoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: AppColors.findDoctorContainerColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Image.asset(height: 40, width: 50, Assets.assetsImagesLogo),
      ),
    );
  }
}
