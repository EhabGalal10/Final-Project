import 'package:final_project/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class CutomLogo extends StatelessWidget {
  const CutomLogo({super.key, required this.logoScale, required this.logoFade});
 final Animation<double> logoScale;
 final Animation<double> logoFade;
  @override
  Widget build(BuildContext context) {
   double h=MediaQuery.of(context).size.height;
    return Positioned(
      top: h * 0.25,
      child: FadeTransition(
        opacity: logoFade,
        child: ScaleTransition(
          scale: logoScale,
          child: CircleAvatar(
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
          ),
        ),
      ),
    );
  }
}
