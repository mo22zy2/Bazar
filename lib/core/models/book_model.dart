// ignore_for_file: unused_local_variable

class Book {
  final String title;
  final String imageUrl;
  final String author;
  final String authorImage;
  final String isbn;
  final double price;

  Book({
    required this.title,
    required this.imageUrl,
    required this.author,
    required this.authorImage,
    required this.isbn,
    required this.price,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    String authorName = 'Unknown Author';
    if (json.containsKey('author_name') && json['author_name'] is List) {
      authorName = (json['author_name'] as List).first.toString();
    }

    String authorImage = '';
    if (json['author_key'] != null && json['author_key'] is List) {
      String authorId = json['author_key'][0];
      authorImage = 'https://covers.openlibrary.org/a/olid/$authorId-M.jpg';
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
      authorImage: authorImage,
      imageUrl: image,
      isbn: (json['isbn'] != null && (json['isbn'] as List).isNotEmpty)
          ? json['isbn'][0].toString()
          : '',
      price: (10 + (json['title']?.length ?? 0) % 20).toDouble(),
    );
  }
}
