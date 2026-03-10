import 'package:flutter/material.dart';
import 'package:bazar/core/utils/colors/maincolors.dart'; //
import 'package:bazar/core/widgets/MainBtn.dart'; //

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.mainWhite,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // هنا بنستخدم الـ Image اللي زمايلك عرفوها
              // Image.asset(Images.groupps),
              Icon(
                Icons.check_box_outline_blank,
                size: 100,
                color: Colors.purple,
              ),
              const SizedBox(height: 24),
              const Text(
                "You Received The Order!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Order #2930541",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 40),
              // استخدام الـ MainBtm بتاع زمايلك بالظبط
              MainBtm(txt: "Done", onPressed: () {}, radius: 12),
            ],
          ),
        ),
      ),
    );
  }
}
