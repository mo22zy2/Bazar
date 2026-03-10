import 'package:bazar/core/models/author_model.dart';
import 'package:flutter/material.dart';

class AuthorItem extends StatelessWidget {
  final Author author;
  const AuthorItem({super.key, required this.author});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey.shade200,
          backgroundImage: author.imageUrl.isNotEmpty
              ? NetworkImage(author.imageUrl)
              : null,
          child: author.imageUrl.isEmpty
              ? const Icon(Icons.person, size: 30)
              : null,
        ),
        title: Text(
          author.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          author.jobTitle ?? 'Author',
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ),
    );
  }
}
