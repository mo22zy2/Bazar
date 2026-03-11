import 'package:bazar/core/models/author_model.dart';
import 'package:bazar/features/Ali/AuthorsPage/widget/author_item.dart';
import 'package:flutter/material.dart';

class AuthorList extends StatelessWidget {
  final List<Author> authors;
  const AuthorList({super.key, required this.authors});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: authors.length,
      itemBuilder: (context, index) => AuthorItem(author: authors[index]),
    );
  }
}
