import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:f1_app/home.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        'assets/logof1.png',
        height: 150,
      ),
      logoWidth: 250,
      backgroundColor: Color.fromARGB(255, 20, 20, 29),
      showLoader: true,
      loadingText: Text("Loading..."),
      loaderColor: Color.fromARGB(255, 251, 29, 4),
      navigator: HomePage(),
      durationInSeconds: 5,
    );
  }
}
