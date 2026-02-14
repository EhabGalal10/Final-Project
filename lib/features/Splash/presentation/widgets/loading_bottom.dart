import 'package:final_project/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingBottom extends StatelessWidget {
  const LoadingBottom({super.key, required this.bottomFade});
  final Animation<double> bottomFade;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      child: FadeTransition(
        opacity: bottomFade,
        child: LoadingAnimationWidget.threeRotatingDots(
          color: AppColors.registerGradientbackgroundColorBottom.withAlpha(155),
          size: 40,
        ),
      ),
    );
  }
}
