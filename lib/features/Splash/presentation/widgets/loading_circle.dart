import 'package:final_project/features/Splash/presentation/animation/opacity_loading_circle_animation.dart';
import 'package:final_project/features/Splash/presentation/animation/rotation_loading_circle_animation.dart';
import 'package:final_project/features/Splash/presentation/animation/scale_loading_circle_animation.dart';
import 'package:flutter/material.dart';

class LoadingCircle extends StatelessWidget {
  const LoadingCircle({
    super.key,
    required this.controller,
    required this.size,
    required this.image,
    required this.top,
    this.phase = 0.0, // اختلاف التوقيت بين الدواير
  });

  final AnimationController controller;
  final double size;
  final String image;
  final double top;
  final double phase;
  
  @override
  Widget build(BuildContext context) {
    // ===== SCALE (Pulse smooth) =====
    Animation<double> scale = scaleAnimation(controller, phase);

    // ===== OPACITY (Breathing) =====
    Animation<double> opacity = opacityAnimation(controller, phase);

    // ===== ROTATION (Infinite smooth) =====
    Animation<double> rotation = rotaionAnimation(controller);

    return Positioned(
      top: MediaQuery.of(context).size.height * top,
      child: FadeTransition(
        opacity: opacity,
        child: RotationTransition(
          turns: rotation,
          child: ScaleTransition(
            scale: scale,
            child: SizedBox(
              width: size,
              height: size,
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}
