import 'package:flutter/material.dart';
import 'package:f1_app/home.dart';
import 'package:f1_app/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F1 App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Manrope',
          appBarTheme: AppBarTheme(
            backgroundColor: Color.fromARGB(255, 251, 29, 4),
          )),
      home: SplashScreenPage(),
    );
  }
}
