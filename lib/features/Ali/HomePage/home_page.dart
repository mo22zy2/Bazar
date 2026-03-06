import 'package:bazar/core/widgets/app_bar.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Home_page extends StatelessWidget {
  const Home_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: app_bar(
          iconDataLeft: Icons.search,
          namePage: "Home",
          iconDataRight: Icons.notifications_none,
        ),
      ),
    );
  }
}
