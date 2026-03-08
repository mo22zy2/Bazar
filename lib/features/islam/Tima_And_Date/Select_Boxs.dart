import 'package:flutter/material.dart';
import 'package:bazar/core/utils/colors/maincolors.dart';

class SelectBox extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback? onTap;

  const SelectBox({
    super.key,
    required this.title,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? MainColors.mainPurple : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
