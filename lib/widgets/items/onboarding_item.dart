import 'package:edu_vista/utils/color_utility.dart';
import 'package:flutter/material.dart';

class OnBoardingItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final double sizedBoxHeight;
  final double imageHeight;

  const OnBoardingItem(
      {required this.imagePath,
      required this.title,
      required this.description,
      this.sizedBoxHeight = 100,
      this.imageHeight = 370,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: sizedBoxHeight),
        Image.asset(
          imagePath,
          height: imageHeight,
        ),
        const SizedBox(height: 30),
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: ColorUtility.grey),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
