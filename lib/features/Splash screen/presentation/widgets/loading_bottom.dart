import 'package:final_project/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingBottom extends StatelessWidget {
  const LoadingBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      child: LoadingAnimationWidget.waveDots(
        color: AppColors.registerGradientbackgroundColorBottom.withAlpha(155),
        size: 70,
      ),
    );
  }
}
