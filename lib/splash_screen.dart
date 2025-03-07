import 'package:flutter/material.dart';
import 'package:mxpertz/repo/splash_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   SplashScreenRepo splashScreenRepo = SplashScreenRepo();

  @override
  void initState() {
    super.initState();
    splashScreenRepo.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       body: Center(
        child: Image.asset(
          'assets/splash_logo.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}