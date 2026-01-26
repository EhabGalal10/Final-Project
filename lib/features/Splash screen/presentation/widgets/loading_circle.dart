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
    final scale = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0.95, end: 1.05),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.05, end: 0.95),
        weight: 50,
      ),
    ]).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          phase,
          1.0,
          curve: Curves.easeInOut,
        ),
      ),
    );

    // ===== OPACITY (Breathing) =====
    final opacity = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0.25, end: 0.55),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 0.55, end: 0.25),
        weight: 50,
      ),
    ]).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          phase,
          1.0,
          curve: Curves.easeInOut,
        ),
      ),
    );

    // ===== ROTATION (Infinite smooth) =====
    final rotation = Tween<double>(begin: 0, end: 1).animate(
      controller,
    );

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
