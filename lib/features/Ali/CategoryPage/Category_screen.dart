import 'package:bazar/core/api/book_service.dart';
import 'package:bazar/core/models/book_model.dart';
import 'package:bazar/core/widgets/app_bar.dart';
import 'package:bazar/features/Ali/CategoryPage/widget/book_grid_view.dart';
import 'package:bazar/features/Ali/CategoryPage/widget/bool_tap_list_view.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Book> _books = [];
  bool _isLoading = true;
  String _activeCategory = "All";

  @override
  void initState() {
    super.initState();
    _loadBooks(_activeCategory);
  }

  Future<void> _loadBooks(String category) async {
    setState(() {
      _isLoading = true;
      _activeCategory = category;
    });

    try {
      final books = await BookService().fetchBooksByCategory(category);
      if (mounted) {
        setState(() {
          _books = books;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            app_bar(
              iconDataRight: Icons.notifications_none,
              namePage: "Category",
              iconDataLeft: Icons.search,
              isNotifications: true,
            ),

            BookTapListView(
              activeCategory: _activeCategory,
              onCategoryChanged: (selectedCategory) {
                _loadBooks(selectedCategory);
              },
            ),
            
            
            Expanded(
              child: BookGridView(books: _books, isLoading: _isLoading),
            ),
          ],
        ),
      ),
    );
  }
}
