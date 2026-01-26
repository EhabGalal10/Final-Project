import 'package:final_project/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class CutomLogo extends StatelessWidget {
  const CutomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 80,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Image.asset(
          height: 150,
          width: 150,
          Assets.assetsImagesLogo,
        ),
      ),
    );
  }
}
