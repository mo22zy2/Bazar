import 'package:bazar/core/utils/colors/maincolors.dart';
import 'package:bazar/core/utils/images/images.dart';
import 'package:bazar/features/islam/Notifications/notifications_empty.dart';
import 'package:flutter/material.dart';

class CartsPage extends StatelessWidget {
  const CartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "my Cart",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.notifications_none_rounded,
                  color: MainColors.mainBlack,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationsEmpty(),
                    ),
                  );
                },
              ),
              Positioned(
                top: 12,
                right: 12,
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.Cart_products),
            const SizedBox(height: 16),
            const Text(
              "There is no products",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
