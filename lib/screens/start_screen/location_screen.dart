import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test_project/screens/start_screen/widgets/gradient_button.dart';

import '../../theme/app_colors.dart';
import 'gender_screen.dart';
import 'looking_for_screen.dart';

class LocationScreen extends StatefulWidget {
  final String firstName;
  final DateTime birthday;
  final Gender gender;
  final LookingFor lookingFor;
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

  Future<void> _allowLocation() async {
    setState(() {
      _loading = true;
    });

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      if (mounted) {
        _showMessage("Please enable location service.");
      }

      setState(() => _loading = false);
      return;
    }

    LocationPermission permission =
    await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission =
      await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission ==
            LocationPermission.deniedForever) {
      if (mounted) {
        _showMessage("Location permission denied.");
      }

      setState(() => _loading = false);
      return;
    }

    final position =
    await Geolocator.getCurrentPosition();

    debugPrint(
      "Latitude : ${position.latitude}",
    );

    debugPrint(
      "Longitude : ${position.longitude}",
    );

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      ),
    );
  }

  void _skip() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      ),
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
              const Spacer(),

              Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.circular(120),
                ),
                child: const Icon(
                  Icons.location_on_rounded,
                  size: 110,
                  color: AppColors.primaryPurple,
                ),
              ),

              const SizedBox(height: 40),

              const Text(
                "Enable Location",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Manrope",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 14),

              const Text(
                "We use your location to help you discover people nearby and improve your matching experience.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Manrope",
                  fontSize: 15,
                  height: 1.6,
                  color: AppColors.textSecondary,
                ),
              ),

              const Spacer(),

              GradientButton(
                title:
                _loading ? "Please wait..." : "Allow Location",
                enabled: !_loading,
                onPressed: _allowLocation,
                margin: EdgeInsets.zero,
              ),

              const SizedBox(height: 18),

              TextButton(
                onPressed: _skip,
                child: const Text(
                  "Skip for now",
                  style: TextStyle(
                    fontFamily: "Manrope",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

///
/// Replace this with your actual Home Screen.
///
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Home Screen",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}