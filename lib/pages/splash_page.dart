import 'package:flutter/material.dart';

import '../utils/image_utility.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(ImageUtility.logo),
      ),
    );
  }
}
