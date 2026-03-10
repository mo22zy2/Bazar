import 'package:bazar/features/Ali/DetailsScreen/DetailsScreen.dart';
import 'package:flutter/material.dart';

class Bookitem extends StatelessWidget {
  final String title;
  final int price;
  final String imageUrl;

  const Bookitem({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  // في ملف Bookitem.dart
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.95,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: DetailsScreen(
                title: title,
                price: price,
                imageUrl: imageUrl,
              ),
            );
          },
        );
      },
      child: Container(
        width: 130,
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey.shade300,
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text(
              " $price  \$",
              style: const TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
