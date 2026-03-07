import 'dart:convert';

import 'package:bazar/core/models/book_model.dart';
import 'package:http/http.dart' as http;

class BookService {
  Future<List<Book>> fetchFictionBooks() async {
    final url = Uri.parse(
      'https://openlibrary.org/search.json?q=fiction&limit=40',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        final List<dynamic> docs = data['docs'];

        return docs.map((json) => Book.fromJson(json)).toList();
      } else {
        throw Exception('فشل في جلب البيانات: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('حدث خطأ أثناء الاتصال بالخادم: $e');
    }
  }
}
