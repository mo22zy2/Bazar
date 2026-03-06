import 'package:bazar/core/utils/colors/maincolors.dart';
import 'package:flutter/material.dart';

class MainBtm extends StatelessWidget {
  const MainBtm({
    super.key,
    required this.txt,
    required this.onPressed,
    required this.radius,
  });

  final String txt;
  final VoidCallback onPressed;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: MainColors.mainPurple,
        fixedSize: Size(327, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        txt,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: MainColors.mainWhite,
        ),
      ),
    );
  }
}
