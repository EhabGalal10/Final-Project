import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class TextSplashWidget extends StatelessWidget {
  const TextSplashWidget({
    super.key,
    required this.h,
    required this.textSlide,
    required this.textFade,
  });

  final double h;
  final Animation<Offset> textSlide;
  final Animation<double> textFade;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: h * 0.4),
        Positioned(
          top: h * 0.56,
          child: SlideTransition(
            position: textSlide,
            child: FadeTransition(
              opacity: textFade,
              child: Text(
                AppStrings.appName,
                style: AppTextStyles.inter700style48,
              ),
            ),
          ),
        ),
        Positioned(
          top: h * 0.64,
          child: SlideTransition(
            position: textSlide,
            child: FadeTransition(
              opacity: textFade,
              child: Text(
                AppStrings.subtitleSplash,
                style: AppTextStyles.inter300style18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}