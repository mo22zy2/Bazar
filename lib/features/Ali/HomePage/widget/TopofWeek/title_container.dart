// ignore: camel_case_types
import 'package:bazar/core/utils/colors/maincolors.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class title_container extends StatelessWidget {
  const title_container({
    super.key,
    required this.text,
    required this.destination,
  });
  final String text;
  final Widget destination;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => destination),
                  );
                },
                child: Row(
                  children: [
                    Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: MainColors.mainPurple,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: MainColors.mainPurple,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
