import 'package:bazar/core/utils/colors/maincolors.dart';
import 'package:bazar/core/widgets/MainBtn.dart';
import 'package:bazar/features/Ali/DetailsScreen/widget/Number_book.dart';
import 'package:bazar/features/Ali/DetailsScreen/widget/review_book.dart';
import 'package:bazar/features/Ali/DetailsScreen/widget/title_book.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String title;
  final String price;
  final String imageUrl;

  const DetailsScreen({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool initialFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          Expanded(
            flex: 2,
            child: Image.network(widget.imageUrl, fit: BoxFit.contain),
          ),

          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleBook(
                    title: widget.title,
                    initialFavorite: initialFavorite,
                  ),
                  const SizedBox(height: 8),

                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus...",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),

                  review_book(),
                  const SizedBox(height: 16),

                  Number_book(widget: widget),
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: MainBtm(
                          txt: "Continue shopping",
                          onPressed: () {},
                          radius: 48,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: MainBtm(
                          txt: "View cart",
                          onPressed: () {},
                          radius: 48,
                          bgColor: MainColors.mainGrey,
                          txtColor: MainColors.mainPurple,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
