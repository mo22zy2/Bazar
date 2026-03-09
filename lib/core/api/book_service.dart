import 'dart:convert';

import 'package:bazar/core/models/book_model.dart';
import 'package:http/http.dart' as http;

class BookService {
  Future<List<Book>> fetchBooks() async {
    final url = Uri.parse(
      'https://openlibrary.org/search.json?q=fiction&limit=300',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['docs'];
      return data.map((json) => Book.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }
}
