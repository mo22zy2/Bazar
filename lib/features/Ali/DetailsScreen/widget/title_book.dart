import 'package:bazar/core/utils/colors/maincolors.dart';
import 'package:flutter/material.dart';

class TitleBook extends StatefulWidget {
  final String title;
  final bool initialFavorite;

  const TitleBook({
    super.key,
    required this.title,
    required this.initialFavorite,
  });

  @override
  State<TitleBook> createState() => _TitleBookState();
}

class _TitleBookState extends State<TitleBook> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.initialFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            widget.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? MainColors.mainPurple : Colors.indigo,
          ),
        ),
      ],
    );
  }
}
