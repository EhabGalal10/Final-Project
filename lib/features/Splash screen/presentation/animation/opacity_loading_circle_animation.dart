import 'package:flutter/material.dart';

Animation<double> opacityAnimation(AnimationController controller, double phase) {
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
    return opacity;
  }