class Author {
  final String name;
  final String imageUrl;
  final String key; // نفترض وجود معرف للمؤلف
  final String? jobTitle; // أضف هذا السطر

  Author({
    required this.name,
    required this.imageUrl,
    required this.key,
    this.jobTitle,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    String rawUrl = "";

    if (json['key'] != null) {
      rawUrl = "https://covers.openlibrary.org/a/olid/${json['key']}-M.jpg";
    }

    return Author(
      name: json['name'] ?? 'Unknown',
      imageUrl: rawUrl,
      key: json['key'] ?? '',
      jobTitle: "author",
    );
  }
}
