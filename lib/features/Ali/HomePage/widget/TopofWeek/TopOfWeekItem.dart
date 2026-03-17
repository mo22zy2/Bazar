import 'package:bazar/core/api/book_service.dart';
import 'package:bazar/core/models/book_model.dart';
import 'package:bazar/features/Ali/CategoryPage/Category_screen.dart';
import 'package:bazar/features/Ali/HomePage/widget/TopofWeek/BookItem.dart';
import 'package:bazar/features/Ali/HomePage/widget/TopofWeek/title_container.dart';
import 'package:flutter/material.dart';

class TopOfWeekItem extends StatefulWidget {
  const TopOfWeekItem({super.key});

  @override
  State<TopOfWeekItem> createState() => _TopOfWeekItemState();
}

class _TopOfWeekItemState extends State<TopOfWeekItem> {
  List<Book> _books = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchBooks();
  }

  Future<void> _fetchBooks() async {
    try {
      final books = await BookService().fetchBooks();
      final validBooks = books
          .where((book) => book.imageUrl.isNotEmpty)
          .toList();
      if (mounted) {
        setState(() {
          _books = validBooks;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SizedBox(
        height: 220,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return Column(
      children: [
        title_container(text: "Top of Week", destination: CategoryScreen()),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 16),
            scrollDirection: Axis.horizontal,
            itemCount: _books.take(10).length,
            itemBuilder: (context, index) {
              final book = _books[index];
              String priceString = book.price.toString().replaceAll(
                RegExp(r'[^\d.]'),
                '',
              );
              return Bookitem(
                title: book.title,
                price: (double.tryParse(priceString)?.toInt()) ?? 0,
                imageUrl: book.imageUrl,
              );
            },
          ),
        ),
      ],
    );
  }
}
