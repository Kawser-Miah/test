import 'package:flutter/material.dart';
import 'package:test_project/screens/start_screen/upload_photo_screen.dart';
import 'package:test_project/screens/start_screen/widgets/interest_card.dart';
import 'package:test_project/screens/start_screen/widgets/onboarding_scaffold.dart';
import 'package:test_project/screens/start_screen/widgets/option_card.dart';


import 'gender_screen.dart';
import 'looking_for_screen.dart';

class InterestsScreen extends StatefulWidget {
  final String firstName;
  final DateTime birthday;
  final Gender gender;
  final LookingFor lookingFor;

  const InterestsScreen({
    super.key,
    required this.firstName,
    required this.birthday,
    required this.gender,
    required this.lookingFor,
  });

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final List<String> _selectedInterests = [];

  final List<Map<String, dynamic>> _interests = [
    {
      "title": "Music",
      "icon": Icons.music_note_rounded,
    },
    {
      "title": "Travel",
      "icon": Icons.flight_takeoff_rounded,
    },
    {
      "title": "Food",
      "icon": Icons.restaurant_rounded,
    },
    {
      "title": "Gaming",
      "icon": Icons.sports_esports_rounded,
    },
    {
      "title": "Reading",
      "icon": Icons.menu_book_rounded,
    },
    {
      "title": "Fitness",
      "icon": Icons.fitness_center_rounded,
    },
    {
      "title": "Movies",
      "icon": Icons.movie_creation_outlined,
    },
    {
      "title": "Photography",
      "icon": Icons.camera_alt_outlined,
    },
    {
      "title": "Sports",
      "icon": Icons.sports_soccer_rounded,
    },
    {
      "title": "Pets",
      "icon": Icons.pets_outlined,
    },
  ];

  void _toggleInterest(String interest) {
    setState(() {
      if (_selectedInterests.contains(interest)) {
        _selectedInterests.remove(interest);
      } else {
        _selectedInterests.add(interest);
      }
    });
  }

  void _continue() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => UploadPhotoScreen(
          firstName: widget.firstName,
          birthday: widget.birthday,
          gender: widget.gender,
          lookingFor: widget.lookingFor,
          interests: _selectedInterests,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      currentStep: 5,
      totalSteps: 7,

      title: "Select your interests",

      subtitle:
      "Choose at least one interest to help us personalize your matches.",

      buttonText: "Continue",

      buttonEnabled: _selectedInterests.isNotEmpty,

      onButtonPressed: _continue,

      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),

        itemCount: _interests.length,

        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: .95,
        ),

        itemBuilder: (context, index) {
          final item = _interests[index];

          final title = item["title"] as String;

          final icon = item["icon"] as IconData;

          return OptionCard(
            title: title,
            icon: icon,
            selected: _selectedInterests.contains(title),
            onTap: () => _toggleInterest(title),
          );
        },
      ),
    );
  }
}