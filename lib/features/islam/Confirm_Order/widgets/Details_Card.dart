import 'package:bazar/core/utils/colors/maincolors.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    super.key,
    required this.title,
    required this.icon,
    required this.mainText,
    required this.subText,
    required this.trailingIcon,
    this.onTap,
    this.onChange,
    this.showChange = false,
  });

  final String title;
  final IconData icon;
  final String mainText;
  final String subText;
  final IconData trailingIcon;

  final VoidCallback? onTap;
  final VoidCallback? onChange;
  final bool showChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: MainColors.mainWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.grey.shade200,
                child: Icon(icon, color: MainColors.mainPurple),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mainText,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subText,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),

              GestureDetector(
                onTap: onTap,
                child: Icon(trailingIcon, size: 18),
              ),
            ],
          ),

          if (showChange) ...[
            const SizedBox(height: 12),
            GestureDetector(
              onTap: onChange,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: MainColors.mainPurple.withAlpha(30),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Change",
                  style: TextStyle(
                    color: MainColors.mainPurple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
