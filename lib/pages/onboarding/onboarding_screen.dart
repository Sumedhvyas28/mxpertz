import 'package:flutter/material.dart';
import 'package:mxpertz/auth/login_screen.dart';
import 'package:mxpertz/component/pallete.dart';
import 'package:mxpertz/pages/onboarding/intro_screen1.dart';
import 'package:mxpertz/pages/onboarding/intro_screen2.dart';
import 'package:mxpertz/pages/onboarding/intro_screen3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                currentPageIndex = index;
                onLastPage = (index == 2);
              });
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),

         // Bottom Navigation Controls
          // Bottom Navigation Controls
Positioned(
  bottom: 30,
  left: 20,
  right: 20,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // Empty space to push "Skip" to center
      const SizedBox(width: 50), 

      // SKIP Button (Centered)
      Expanded(
        child: Center(
          child: GestureDetector(
            onTap: () {
              if (currentPageIndex == 0) {
                _controller.jumpToPage(2);
              } else {
                _controller.previousPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: const Text(
              'Skip >>',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFFA500), // Orange color
              ),
            ),
          ),
        ),
      ),

      // NEXT Button as Circular Icon (Right Side)
      GestureDetector(
        onTap: () {
          if (onLastPage) {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          } else {
            _controller.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFFFFA500), // Orange color
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    ],
  ),
),


        ],
      ),
    );
  }
}
