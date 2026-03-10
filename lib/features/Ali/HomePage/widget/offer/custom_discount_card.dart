import 'package:bazar/core/models/book_model.dart';
import 'package:bazar/core/utils/colors/maincolors.dart';
import 'package:bazar/core/widgets/MainBtn.dart';
import 'package:bazar/features/islam/Confirm_Order/Confirm_Order_visaAdded.dart';
import 'package:flutter/material.dart';

class CustomDiscountCard extends StatelessWidget {
  final Book book;
  const CustomDiscountCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: MainColors.mainWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Special Offer',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: MainColors.mainBlack,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Discount 25%',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: MainColors.mainBlack,
                    ),
                  ),
                  const SizedBox(height: 16),

                  SizedBox(
                    width: 120,
                    height: 36,
                    child: MainBtm(
                      txt: "Order Now",
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ConfirmOrderVisaadded(),
                          ),
                        );
                      },
                      radius: 10,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              child: Image.network(
                book.imageUrl,
                fit: BoxFit.cover,
                height: 160,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, size: 48),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
