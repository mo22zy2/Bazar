import 'package:flutter/material.dart';

/// A reusable bottom navigation bar widget that can be placed in any
/// [Scaffold.bottomNavigationBar].
///
/// It keeps track of the selected tab internally and exposes an
/// [onTap] callback so parent widgets can respond to the change.
/// The caller may also provide an [initialIndex] to start with a
/// particular tab selected.
class BottomNavBar extends StatefulWidget {
  /// The initial index that should be selected when the widget first builds.
  final int initialIndex;

  /// A callback that is invoked when the user taps one of the items.
  final ValueChanged<int>? onTap;

  const BottomNavBar({super.key, this.initialIndex = 0, this.onTap});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        if (widget.onTap != null) {
          widget.onTap!(index);
        }
      },
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.article_rounded),
          label: 'Category',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
