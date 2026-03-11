// ignore_for_file: depend_on_referenced_packages
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

  // 2. الدالة لجلب كتب الخيال
  Future<List<Book>> fetchFictionBooks() async {
    final url = Uri.parse(
      'https://openlibrary.org/search.json?q=fiction&limit=10',
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['docs'];
      return data.map((json) => Book.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load fiction books');
    }
  }

  Future<List<Book>> fetchBooksByCategory(String category) async {
    if (category == "All") {
      return await fetchBooks();
    }

    final url = Uri.parse(
      'https://openlibrary.org/search.json?q=$category&limit=20',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['docs'];
      return data.map((json) => Book.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load books for category: $category');
    }
  }
}
