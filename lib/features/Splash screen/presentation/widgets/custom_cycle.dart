import 'package:flutter/material.dart';

class CustomCycle extends StatelessWidget {
  const CustomCycle({
    super.key,
    required this.size,
    required this.image,
    required this.opacity,
    this.top,
  });
  final double size;
  final String image;
  final double opacity;
  final double? top;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top != null ? MediaQuery.of(context).size.height * top! : null,
      child: Opacity(
        opacity: opacity,
        child: SizedBox(
          width: size,
          height: size,
          child: Image.asset(height: size, width: size, image, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
