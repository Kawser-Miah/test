import 'package:flutter/material.dart';
import 'screens/create/create_community_screen.dart';
import 'screens/create/create_event_screen.dart';
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
      routes: {
        '/create-event': (context) => const CreateEventScreen(),
        '/create-community': (context) => const CreateCommunityScreen(),
      },
    );
  }
}