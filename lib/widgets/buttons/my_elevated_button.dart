import 'package:edu_vista/utils/color_utility.dart';
import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final Color color;
  const MyElevatedButton(
      {required this.label,
      required this.onPressed,
      this.color = ColorUtility.secondary,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(double.maxFinite, 50),
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ));
  }
}
