import 'package:flutter/material.dart';

class BookTapListView extends StatelessWidget {
  final String activeCategory;
  final Function(String) onCategoryChanged;

  const BookTapListView({
    super.key,
    required this.activeCategory,
    required this.onCategoryChanged,
  });

  final List<String> _categories = const [
    "All",
    "History",
    "Cooking",
    "Design",
    "Science",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final cat = _categories[index];
          bool isActive = activeCategory == cat;

          return GestureDetector(
            onTap: () => onCategoryChanged(cat), 
            child: Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    cat,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: isActive ? FontWeight.bold : FontWeight.w400,
                      color: isActive ? Colors.black : Colors.grey[400],
                    ),
                  ),
                  const SizedBox(height: 6),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    height: 3,
                    width: isActive ? 22 : 0,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6C63FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
