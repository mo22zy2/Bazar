import 'package:bazar/core/api/author_service.dart';
import 'package:bazar/core/models/author_model.dart';
import 'package:bazar/core/widgets/app_bar.dart';
import 'package:bazar/features/Ali/AuthorsPage/widget/author_list.dart';
import 'package:flutter/material.dart';

class AuthorsPage extends StatefulWidget {
  const AuthorsPage({super.key});

  @override
  State<AuthorsPage> createState() => _AuthorsPageState();
}

class _AuthorsPageState extends State<AuthorsPage> {
  late Future<List<Author>> _authorsFuture;

  @override
  void initState() {
    super.initState();
    _authorsFuture = AuthorService().fetchAuthors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            app_bar(
              iconDataRight: Icons.search,
              namePage: 'Authors',
              iconDataLeft: Icons.arrow_back,
            ),
            Expanded(
              child: FutureBuilder<List<Author>>(
                future: _authorsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return const Center(child: Text('Error occurred'));
                  }

                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return AuthorList(authors: snapshot.data!);
                  }

                  return const Center(child: Text('No authors found'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
