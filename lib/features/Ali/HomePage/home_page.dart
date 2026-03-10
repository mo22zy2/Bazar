import 'package:bazar/core/widgets/app_bar.dart';
import 'package:bazar/features/Ali/HomePage/widget/Author/AuthorsSection.dart';
import 'package:bazar/features/Ali/HomePage/widget/TopofWeek/TopOfWeekItem.dart';
import 'package:bazar/features/Ali/HomePage/widget/offer/featured_books_slider.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Home_page extends StatelessWidget {
  const Home_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              app_bar(
                iconDataLeft: Icons.search,
                namePage: "Home",
                iconDataRight: Icons.notifications_none,
                isNotifications: true,
              ),
              SizedBox(height: 200, child: FeaturedBooksSlider()),
              TopOfWeekItem(),
              const SizedBox(height: 20),
              AuthorsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
