 import 'package:flutter/material.dart';

Animation<double> scaleAnimation(AnimationController controller, double phase) {
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
    return scale;
  }