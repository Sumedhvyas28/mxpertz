import 'dart:async';


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mxpertz/auth/login_screen.dart';
import 'package:mxpertz/home_page.dart';
import 'package:mxpertz/pages/onboarding/onboarding_screen.dart';

class SplashScreenRepo {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if (user != null) {
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage())));
    } else {
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => OnboardingScreen())));
    }
  }
}