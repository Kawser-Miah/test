import 'package:flutter/material.dart';
import 'package:test_project/core/services/preference_keys.dart';
import 'package:test_project/view/screens/main_screen.dart';
import 'core/services/shared_preferences_service.dart';
import 'view/screens/create/create_community/create_community_screen.dart';
import 'view/screens/create/create_event/create_event_screen.dart';
import 'view/screens/intro/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferencesService.instance.init();
  runApp(const VibeNowApp());
}

class VibeNowApp extends StatelessWidget {
  const VibeNowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vibe.Now',
      theme: ThemeData(useMaterial3: true),
      // home: const SplashScreen(),
      home:
          SharedPreferencesService.instance.getBool(
            PreferenceKeys.isNotFirstTime,
          )
          ? const MainScreen()
          : const SplashScreen(),
    );
  }
}
