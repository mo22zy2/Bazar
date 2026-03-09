import 'dart:convert';

import 'package:bazar/core/models/author_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AuthorService {
  static const String _baseUrl =
      "https://openlibrary.org/search/authors.json?q=j*";

  Future<List<Author>> fetchAuthors({int limit = 300}) async {
    try {
      final response = await http.get(Uri.parse("$_baseUrl&limit=$limit"));

      if (response.statusCode == 200) {
        final List docs = json.decode(response.body)['docs'];

        List<Author> allAuthors = docs
            .map((doc) => Author.fromJson(doc))
            .toList();

        List<Author> filteredAuthors = allAuthors.where((author) {
          return author.imageUrl.isNotEmpty &&
              !author.imageUrl.contains("static/images/missing");
        }).toList();

        debugPrint(
          "عدد المؤلفين بعد الفلترة المبدئية: ${filteredAuthors.length}",
        );
        return filteredAuthors;
      }
      return [];
    } catch (e) {
      debugPrint("خطأ: $e");
      return [];
    }
  }
}
