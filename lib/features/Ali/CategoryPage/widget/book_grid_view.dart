import 'package:bazar/core/models/book_model.dart';
import 'package:bazar/features/Ali/CategoryPage/widget/BookItemCategory.dart';
import 'package:flutter/material.dart';

class BookGridView extends StatelessWidget {
  final List<Book> books;
  final bool isLoading;

  const BookGridView({super.key, required this.books, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (books.isEmpty) {
      return const Center(child: Text("No books found"));
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) => BookItemCategory(book: books[index]),
    );
  }
}
