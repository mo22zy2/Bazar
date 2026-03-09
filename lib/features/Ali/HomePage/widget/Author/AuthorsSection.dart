import 'package:bazar/core/api/author_service.dart';
import 'package:bazar/core/models/author_model.dart';
import 'package:bazar/features/Ali/HomePage/home_page.dart';
import 'package:bazar/features/Ali/HomePage/widget/Author/AuthorItem.dart';
import 'package:bazar/features/Ali/HomePage/widget/TopofWeek/title_container.dart';
import 'package:flutter/material.dart';

class AuthorsSection extends StatefulWidget {
  const AuthorsSection({super.key});

  @override
  State<AuthorsSection> createState() => _AuthorsSectionState();
}

class _AuthorsSectionState extends State<AuthorsSection> {
  List<Author> _authors = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAuthors();
  }

  Future<void> _loadAuthors() async {
    final authors = await AuthorService().fetchAuthors(limit: 20);
    if (mounted) {
      setState(() {
        _authors = authors;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const Center(child: CircularProgressIndicator());

    return Column(
      children: [
        title_container(text: "Authors", destination: Home_page()),

        const SizedBox(height: 15),
        SizedBox(
          height: 170,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 16),
            scrollDirection: Axis.horizontal,
            itemCount: _authors.take(10).length,
            itemBuilder: (context, index) {
              final author = _authors[index];
              return AuthorItem(
                name: author.name,
                jobTitle: author.jobTitle ?? "Writer",
                imageUrl: author.imageUrl,
              );
            },
          ),
        ),
      ],
    );
  }
}
