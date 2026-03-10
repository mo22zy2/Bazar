import 'package:flutter/material.dart';
import 'package:bazar/core/utils/colors/maincolors.dart';
import 'package:bazar/core/widgets/app_bar.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.mainWhite,
      body: SafeArea(
        child: Column(
          children: [
            const app_bar(
              iconDataLeft: Icons.menu, // أيقونة المنيو اللي على الشمال
              namePage: "Categories",
              iconDataRight: Icons.search, // أيقونة السيرش اللي على اليمين
            ),
            const SizedBox(height: 24),
            // 2. قائمة التصنيفات (الـ Horizontal List)
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildTab("History", isActive: true),
                  _buildTab("Cooking"),
                  _buildTab("Design"),
                  _buildTab("Science"),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 25,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.6, // عشان يظبط حجم كارت الكتاب
                ),
                itemCount: 8,
                itemBuilder: (context, index) => _buildBookItem(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String text, {bool isActive = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: isActive ? MainColors.mainPurple : MainColors.mainGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? MainColors.mainWhite : MainColors.mainBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // ويدجت كارت الكتاب (Book Item)
  Widget _buildBookItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: MainColors.mainGrey,
              borderRadius: BorderRadius.circular(12),
            ),
            // هنا هتحط صورة الكتاب من الـ assets
            // child: Image.asset(Images.book1, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          "The Kite Runner",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Text(
          "Khaled Hosseini",
          style: TextStyle(color: MainColors.mainDarkGrey, fontSize: 12),
        ),
        const SizedBox(height: 4),
        Text(
          "\$14.99",
          style: TextStyle(
            color: MainColors.mainPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
