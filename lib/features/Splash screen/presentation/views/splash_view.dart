import 'package:final_project/features/Auth/presentation/views/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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

    // ===== Animation Controller =====
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    // ===== الانتقال للصفحة الرئيسية بعد 5 ثواني =====
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SignInView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 800), // مدة الـ fade
        ),
      );
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
            stops: [0.1, 0.2, 0.75, 1.0],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ===== Animated Gradient Text =====
            AnimatedBuilder(
              animation: _controller,
              builder: (_, __) {
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
              },
            ),
            const SizedBox(height: 16),
            const Text(
              "AI-Powered Brain MRI Analysis",
              style: TextStyle(fontSize: 24, color: Color(0xff4a78b8)),
            ),
            const SizedBox(height: 60),
            // ===== Image with gradient =====
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 152, 96, 189),
                    Color(0xffc8e4fe),
                    Color.fromARGB(255, 255, 255, 255),
                    Color(0xff549de3),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ).createShader(bounds);
              },
              blendMode: BlendMode.modulate,
              child: Opacity(
                opacity: 0.9,
                child: Image.asset('assets/images/9479213.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
