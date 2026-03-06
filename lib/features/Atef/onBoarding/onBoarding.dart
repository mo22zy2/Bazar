import 'package:bazar/core/utils/colors/maincolors.dart';
import 'package:bazar/core/utils/images/images.dart';
import 'package:bazar/core/widgets/MainBtn.dart';
import 'package:bazar/features/Atef/SignIn/SignIn.dart';
import 'package:flutter/material.dart';

class onBoarding extends StatefulWidget {
  const onBoarding({super.key});

  @override
  State<onBoarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<onBoarding> {
  final PageController _controller = PageController();
  int current = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      "color": MainColors.mainWhite,
      "image": Images.frame1,
      "title": "Now reading books will be easier",
      "description":
          " Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.",
    },
    {
      "color": MainColors.mainWhite,

      "image": Images.frame2,
      "title": "Your Bookish Soulmate Awaits",
      "description":
          "Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience.",
    },
    {
      "color": MainColors.mainWhite,

      "image": Images.frame3,
      "title": "Start Your Adventure",
      "description":
          "Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let's go!",
    },
  ];

  void _nextPage() {
    if (current < _pages.length - 1) {
      _controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _finishOnboarding() {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (context) => SignIn()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.mainWhite,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(top: 16, right: 291),
              child: GestureDetector(
                onTap: _finishOnboarding,
                child: Text(
                  "Skip",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: MainColors.mainPurple,
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (int index) {
                  setState(() {
                    current = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(height: 65),
                      SizedBox(
                        height: 322,
                        width: 320,
                        child: Image.asset(
                          _pages[index]['image']!,
                          fit: BoxFit.fitWidth,
                          width: double.infinity,
                        ),
                      ),
                      SizedBox(height: 14),
                      Container(
                        width: double.infinity,

                        padding: const EdgeInsets.symmetric(horizontal: 66),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _pages[index]["title"]!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 26,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(height: 14),

                            Text(
                              _pages[index]["description"]!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black.withAlpha(80),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 68),
                      MainBtm(
                        txt: current < _pages.length - 2
                            ? "Continue"
                            : "Get Started",
                        onPressed: current < _pages.length - 1
                            ? _nextPage
                            : _finishOnboarding,
                        radius: 12,
                      ),
                      SizedBox(height: 24),
                      GestureDetector(
                        onTap: _finishOnboarding,
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: MainColors.mainPurple,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
