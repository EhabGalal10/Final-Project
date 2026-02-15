import 'package:final_project/features/Splash/presentation/widgets/custom_brain_image.dart';
import 'package:final_project/features/Splash/presentation/widgets/custom_mokhi_splash.dart';
import 'package:final_project/features/Splash/presentation/widgets/description_splash.dart';
import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({
    super.key,
    required AnimationController controller,
  }) : _controller = controller;

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xffc8e4fe),
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 255, 255, 255),
            Color(0xffc1e1fd),
          ],
          stops: [0.1, 0.25, 0.75, 1.0],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (_, __) {
              return CustomMokhiSplash(controller: _controller);
            },
          ),
          const SizedBox(height: 16),
          DescriptionSplash(),
          // ===== Image with gradient =====
          CustomBrainImage(),
        ],
      ),
    );
  }
}
