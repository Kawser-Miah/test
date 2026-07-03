import 'package:flutter/material.dart';
import 'splash/splash_screen.dart';

void main() {
  runApp(const VibeNowApp());
}

class VibeNowApp extends StatelessWidget {
  const VibeNowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vibe.Now',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}