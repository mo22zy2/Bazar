import 'package:bazar/core/utils/colors/maincolors.dart';
import 'package:flutter/material.dart';

class MainBtm extends StatelessWidget {
  const MainBtm({
    super.key,
    required this.txt,
    required this.onPressed,
    required this.radius,
    this.fontSize = 16,
    this.bgColor,
    this.txtColor,
  });
  final double? fontSize;
  final String txt;
  final Color? txtColor;
  final VoidCallback onPressed;
  final double radius;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? MainColors.mainPurple,
        fixedSize: Size(327, 56),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        visualDensity: VisualDensity.compact,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        txt,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
          color: txtColor ?? MainColors.mainWhite,
        ),
      ),
    );
  }
}
