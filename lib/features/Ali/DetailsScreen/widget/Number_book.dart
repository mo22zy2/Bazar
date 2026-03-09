// ignore: camel_case_types
import 'package:bazar/core/utils/colors/maincolors.dart';
import 'package:bazar/features/Ali/DetailsScreen/DetailsScreen.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Number_book extends StatefulWidget {
  const Number_book({super.key, required this.widget});

  final DetailsScreen widget;

  @override
  State<Number_book> createState() => _Number_bookState();
}

// ignore: camel_case_types
class _Number_bookState extends State<Number_book> {
  int numBook = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              // زر -
              CircleAvatar(
                radius: 12,
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    setState(() {
                      if (numBook > 1) {
                        numBook--;
                      }
                    });
                  },
                  child: const Center(child: Icon(Icons.remove, size: 16)),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  numBook.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MainColors.mainBlack,
                  ),
                ),
              ),

              CircleAvatar(
                backgroundColor: MainColors.mainPurple,
                radius: 12,
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    setState(() {
                      numBook++;
                    });
                  },
                  child: Center(
                    child: Icon(
                      Icons.add,
                      size: 16,
                      color: MainColors.mainWhite,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(width: 20),
        Text(
          widget.widget.price,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: MainColors.mainPurple,
          ),
        ),
      ],
    );
  }
}
