// ignore_for_file: camel_case_types

import 'package:bazar/core/utils/colors/maincolors.dart';
import 'package:bazar/features/Ahmed/NotificationScreen.dart';
import 'package:flutter/material.dart';

class app_bar extends StatelessWidget {
  const app_bar({
    super.key,
    required this.iconDataRight,
    required this.namePage,
    required this.iconDataLeft,
  });
  final IconData iconDataLeft;
  final String namePage;
  final IconData iconDataRight;

  @override
  Widget build(BuildContext context) {
    final bool isNotifications = true;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop(context);
          },
          icon: Icon(iconDataLeft, color: MainColors.mainBlack, size: 40),
        ),
        Text(
          namePage,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
                );
              },
              icon: Icon(iconDataRight, color: MainColors.mainBlack, size: 40),
            ),
            if (isNotifications)
              Positioned(
                top: 14,
                right: 16,
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: MainColors.mainWhite,
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: MainColors.mainRed,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
