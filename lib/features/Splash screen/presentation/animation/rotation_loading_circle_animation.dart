  import 'package:flutter/material.dart';

Animation<double> rotaionAnimation(AnimationController controller) {
    final rotation = Tween<double>(begin: 0, end: 1).animate(
      controller,
    );
    return rotation;
  } 