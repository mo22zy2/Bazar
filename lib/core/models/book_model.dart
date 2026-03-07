import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class Book {
  final String title;
  final String imageUrl;
  final String author;
  final String isbn;
  final String price;

  Book({
    required this.title,
    required this.imageUrl,
    required this.author,
    required this.isbn,
    required this.price,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    // 1. معالجة المؤلفين
    String authorName = 'Unknown Author';
    if (json.containsKey('author_name') && json['author_name'] is List) {
      authorName = (json['author_name'] as List).first.toString();
    }

    String image = '';
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
      price: "\$${(10 + (json['title']?.length ?? 0) % 20).toStringAsFixed(2)}",
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

  Future<List<Book>> fetchRecentBooks() async {
    // هذا الرابط كمثال لجلب بيانات من Open Library، استبدله بالرابط الذي تستخدمه فعلياً
    final url = Uri.parse(
      'https://openlibrary.org/search.json?q=subject:fiction&sort=new&limit=10',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['docs'];
      return data.map((json) => Book.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load recent books');
    }
  }
}
