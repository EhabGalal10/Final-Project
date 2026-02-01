import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SubLogoHome extends StatelessWidget {
  const SubLogoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: AppColors.findDoctorContainerColor,
      child: SvgPicture.asset(
        Assets.assetsImagesSubLogo,
        width: 22,
        height: 22,
        colorFilter: ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
        fit: BoxFit.cover,
      ),
    );
  }
}
