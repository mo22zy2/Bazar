import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AuthorItem extends StatelessWidget {
  final String name;
  final String jobTitle;
  final String imageUrl;

  const AuthorItem({
    super.key,
    required this.name,
    required this.jobTitle,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          // استبدل الـ CircleAvatar بالكامل بهذا الـ Container
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Colors
                  .grey[200], // هذا اللون اللي كرهته، تقدر تغيره لـ Colors.transparent
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: (imageUrl.isEmpty || !imageUrl.startsWith('http'))
                  ? const Center(
                      child: Icon(Icons.person, size: 50, color: Colors.grey),
                    )
                  : CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                      // أضفنا center للحماية
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(
                          Icons.error,
                          color: Colors.red,
                        ), // عشان نتأكد لو فيه خطأ يظهر لنا أيقونة واضحة
                      ),
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
            ),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                jobTitle,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
