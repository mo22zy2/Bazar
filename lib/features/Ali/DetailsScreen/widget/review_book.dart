import 'package:flutter/material.dart';

class review_book extends StatelessWidget {
  const review_book({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Review ",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        Row(
          children: [
            ...List.generate(
              3,
              (index) => const Icon(Icons.star, color: Colors.amber, size: 23),
            ),
            const Icon(Icons.star, color: Colors.black, size: 23),
            const Icon(Icons.star, color: Colors.black, size: 23),
            const Text(
              " (3.0)",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }
}
