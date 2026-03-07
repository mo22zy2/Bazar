import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class Book {
  final String title;
  final String imageUrl;
  final String author;
  final String isbn;

  Book({
    required this.title,
    required this.imageUrl,
    required this.author,
    required this.isbn,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    // 1. معالجة المؤلفين
    String authorName = 'Unknown Author';
    if (json.containsKey('author_name') && json['author_name'] is List) {
      authorName = (json['author_name'] as List).first.toString();
    }

    // 2. معالجة الغلاف (هنا يكمن سر المشكلة!)
    // Open Library تستخدم مفتاح 'cover_i' لجلب صورة الغلاف
    String image = 'https://via.placeholder.com/150';
    if (json.containsKey('cover_i') && json['cover_i'] != null) {
      image = 'https://covers.openlibrary.org/b/id/${json['cover_i']}-L.jpg';
    } else if (json.containsKey('isbn') && (json['isbn'] as List).isNotEmpty) {
      image = 'https://covers.openlibrary.org/b/isbn/${json['isbn'][0]}-M.jpg';
    }

    return Book(
      title: json['title'] ?? 'Unknown Title',
      author: authorName,
      imageUrl: image,
      isbn: (json['isbn'] != null && (json['isbn'] as List).isNotEmpty)
          ? json['isbn'][0].toString()
          : '',
    );
  }
}

class BookService {
  Future<List<Book>> fetchFictionBooks() async {
    final url = Uri.parse(
      'https://openlibrary.org/search.json?q=fiction&limit=10',
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
