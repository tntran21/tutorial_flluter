import 'package:flutter/material.dart';
import 'package:tutorial_1/assets/styles/app_them.dart';
import 'package:tutorial_1/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify Clone',
      theme: AppTheme.theme,
      home: const HomeScreen(title: 'Home'),
    );
  }
}
