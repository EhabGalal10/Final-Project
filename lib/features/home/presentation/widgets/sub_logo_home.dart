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
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 5, 2, 172),
                Color.fromARGB(255, 85, 165, 241),
              ],
              stops: [0, 0.7],
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcIn,
          child: Image.asset(height: 40, width: 50, Assets.assetsImagesLogo),
        ),
      ),
    );
  }
}
