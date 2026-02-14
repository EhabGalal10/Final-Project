import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMokhiSplash extends StatelessWidget {
  const CustomMokhiSplash({
    super.key,
    required AnimationController controller,
  }) : _controller = controller;

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
          begin: Alignment(-1 + _controller.value * 2, -1),
          end: Alignment(1 + _controller.value * 2, 1),
          colors: const [
            Color(0xff549de3),
            Color(0xffc8e4fe),
            Color.fromARGB(255, 152, 96, 189),
          ],
        ).createShader(bounds);
      },
      child: Text(
        "Mokhi",
        style: GoogleFonts.nunito(
          fontSize: 90,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.5,
          color: Colors.white,
          shadows: const [
            Shadow(
              blurRadius: 5,
              color: Color(0xff549de3),
              offset: Offset(3, 5),
            ),
          ],
        ),
      ),
    );
  }
}

