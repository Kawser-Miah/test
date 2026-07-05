import 'package:flutter/material.dart';
import 'package:test_project/core/services/preference_keys.dart';
import 'package:test_project/core/services/shared_preferences_service.dart';
import 'package:test_project/view/screens/main_screen.dart';
import 'package:test_project/view/screens/onboarding/widgets/location_icon.dart';
import 'package:test_project/view/screens/onboarding/widgets/onboarding_scaffold.dart';

import '../../../config/theme/app_colors.dart';

class LocationScreen extends StatefulWidget {
  final String firstName;
  final DateTime birthday;
  final dynamic gender;
  final dynamic lookingFor;
  final List<String> interests;
  final List photos;

  const LocationScreen({
    super.key,
    required this.firstName,
    required this.birthday,
    required this.gender,
    required this.lookingFor,
    required this.interests,
    required this.photos,
  });

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  bool _loading = false;

  Future<void> _allow() async {
    setState(() {
      _loading = true;
    });

    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;
    SharedPreferencesService.instance.setBool(
      PreferenceKeys.isNotFirstTime,
      true,
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const MainScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      currentStep: 7,
      totalSteps: 7,

      title: "Choose Location",

      headerChild: const LocationIcon(),

      subtitle:
          "Allow location to connect with people, "
          "events, and communities around you. "
          "We only use your location while you're using "
          "the app.",

      buttonText: _loading ? "Please wait..." : "Allow",

      buttonEnabled: !_loading,

      onButtonPressed: _allow,

      child: const SizedBox.shrink(),
    );
  }
}
