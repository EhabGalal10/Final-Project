import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_images.dart';
import 'package:final_project/features/Splash%20screen/presentation/functions/custom_navigationWith_Animation.dart';
import 'package:final_project/features/Splash%20screen/presentation/widgets/custom_logo.dart';
import 'package:final_project/features/Splash%20screen/presentation/widgets/loading_circle.dart';
import 'package:final_project/features/Splash%20screen/presentation/widgets/text_splash.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _mainController;
  late AnimationController _loadingController;

  // LOGO
  late Animation<double> logoScale;
  late Animation<double> logoFade;

  // TEXT
  late Animation<Offset> textSlide;
  late Animation<double> textFade;

  // LOADING BOTTOM
  late Animation<double> bottomFade;
  late Animation<Offset> bottomSlide;

  @override
  void initState() {
    super.initState();

    // ===== MAIN SEQUENCE =====
    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2600),
    );

    _loadingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();

    // LOGO
    logoScale = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOutBack),
      ),
    );

    logoFade = CurvedAnimation(
      parent: _mainController,
      curve: const Interval(0.0, 0.25),
    );

    // TEXT
    textSlide = Tween<Offset>(begin: const Offset(0, 0.4), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _mainController,
            curve: const Interval(0.3, 0.55, curve: Curves.easeOut),
          ),
        );

    textFade = CurvedAnimation(
      parent: _mainController,
      curve: const Interval(0.35, 0.6),
    );

    // LOADING BOTTOM
    bottomSlide = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _mainController,
            curve: const Interval(0.6, 0.85, curve: Curves.easeOut),
          ),
        );

    bottomFade = CurvedAnimation(
      parent: _mainController,
      curve: const Interval(0.6, 0.85),
    );

    _mainController.forward();

    Future.delayed(
      const Duration(milliseconds: 5600),
      // ignore: use_build_context_synchronously
      () => goToSignIn(context),
    );
  }

  @override
  void dispose() {
    _mainController.dispose();
    _loadingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.gradientColorTop,
              AppColors.gradientColorMiddle,
              AppColors.gradientColorBottom,
            ],
            stops: [0.0, 0.2, 1.0],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // ===== LOADING CIRCLES =====
            LoadingCircle(
              controller: _loadingController,
              size: 340,
              image: Assets.assetsImagesLargeCycle,
              top: 0.145,
              phase: 0.4,
            ),
            LoadingCircle(
              controller: _loadingController,
              size: 280,
              image: Assets.assetsImagesMediumCycle,
              top: 0.18,
              phase: 0.2,
            ),
            LoadingCircle(
              controller: _loadingController,
              size: 230,
              image: Assets.assetsImagesSmallCycle,
              top: 0.21,
              phase: 0.0,
            ),

            CutomLogo(logoFade: logoFade, logoScale: logoScale),
            TextSplashWidget(h: h, textSlide: textSlide, textFade: textFade),
          ],
        ),
      ),
    );
  }
}
