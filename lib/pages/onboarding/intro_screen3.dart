import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mxpertz/component/pallete.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF16A2B8), // Set background color
      body: Stack(
        children: [
          // Animation or Illustration
          Positioned(
            top: 120,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/new1.png',
              height: 380,
            ),
          ),

          // Bottom Container with text
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 250,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'ONLINE PAYMENT',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFA500),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Pharetra quam elementum massa, viverra. Ut turpis consectetur.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 20),
              
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
