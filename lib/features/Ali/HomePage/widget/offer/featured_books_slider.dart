import 'dart:async';

import 'package:bazar/core/api/book_service.dart';
import 'package:bazar/core/models/book_model.dart';
import 'package:flutter/material.dart';

import 'custom_discount_card.dart';

class FeaturedBooksSlider extends StatefulWidget {
  const FeaturedBooksSlider({super.key});

  @override
  State<FeaturedBooksSlider> createState() => _FeaturedBooksSliderState();
}

class _FeaturedBooksSliderState extends State<FeaturedBooksSlider> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;
  List<Book> _books = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final books = await BookService().fetchFictionBooks();
      if (mounted) {
        setState(() {
          _books = books;
          _isLoading = false;
        });
        _startTimer();
      }
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_books.isNotEmpty) {
        int displayCount = _books.length >= 4 ? 4 : _books.length;
        _currentPage = (_currentPage + 1) % displayCount;
        if (_pageController.hasClients) {
          _pageController.animateToPage(
            _currentPage,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SizedBox(
        height: 180,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (_books.isEmpty) {
      return const SizedBox(
        height: 180,
        child: Center(child: Text("لا توجد كتب")),
      );
    }

    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _books.take(4).length,
            onPageChanged: (int index) => setState(() => _currentPage = index),
            itemBuilder: (context, index) =>
                CustomDiscountCard(book: _books[index]),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_books.take(4).length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 8,
              width: _currentPage == index ? 24 : 8,
              decoration: BoxDecoration(
                color: _currentPage == index
                    ? Colors.indigo
                    : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      ],
    );
  }
}
