import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:edu_vista/pages/onboarding_page.dart';
import 'package:flutter/material.dart';

import '../utils/image_utility.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            ImageUtility.eduVista,
            width: double.infinity,
          ),
        ),
        Positioned(
          right: 250,
          left: 0,
          top: 0,
          bottom: 75,
          child: AnimatedSplashScreen(
            backgroundColor: Colors.transparent,
            duration: 1400,
            splash: ImageUtility.cap,
            nextScreen: const OnBoardingPage(),
            splashTransition: SplashTransition.rotationTransition,
          ),
        )
      ],
    );
  }
}
