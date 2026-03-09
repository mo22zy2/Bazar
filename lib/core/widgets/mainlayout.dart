import 'package:bazar/features/Ali/HomePage/home_page.dart';
import 'package:bazar/features/islam/My_Cart/my_cart.dart';
import 'package:flutter/material.dart';
import 'package:bazar/core/widgets/bottom_nav_bar.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;

  final List<Widget> pages = [
    Home_page(),
    // categorys(),
    CartsPage(),
    // ProfilePage(),
  ];

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavBar(
        initialIndex: currentIndex,
        onTap: changePage,
      ),
    );
  }
}
