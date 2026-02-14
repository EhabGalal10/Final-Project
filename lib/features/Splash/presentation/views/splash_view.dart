import 'package:final_project/features/Splash/presentation/functions/custom_navigationwith_animation.dart';
import 'package:final_project/features/Splash/presentation/widgets/custom_brain_image.dart';
import 'package:final_project/features/Splash/presentation/widgets/custom_mokhi_splash.dart';
import 'package:final_project/features/Splash/presentation/widgets/description_splash.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

_controller = AnimationController(
  vsync: this,
  duration: const Duration(seconds: 3),
);
_controller.forward().whenComplete(() {
  if (!mounted) return;
  goToSignIn(context);
});
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (_, __) {
                return CustomMokhiSplash(controller: _controller);
              },
            ),
            const SizedBox(height: 16),
            DescriptionSplash(),
            const SizedBox(height: 60),
            // ===== Image with gradient =====
            CustomBrainImage(),
          ],
        ),
      ),
    );
  }
}

