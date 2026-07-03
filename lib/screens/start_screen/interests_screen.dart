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
      "title": "Coffee",
      "icon": Icons.coffee_outlined,
    },
    {
      "title": "Music",
      "icon": Icons.music_note_rounded,
    },
    {
      "title": "Chat",
      "icon": Icons.chat_bubble_outline_rounded,
    },
    {
      "title": "Sports",
      "icon": Icons.sports_gymnastics_rounded,
    },
    {
      "title": "Books",
      "icon": Icons.menu_book_rounded,
    },
    {
      "title": "Photo",
      "icon": Icons.camera_alt_outlined,
    },
    {
      "title": "Art",
      "icon": Icons.palette_outlined,
    },
    {
      "title": "Tech",
      "icon": Icons.hub_outlined,
    },
    {
      "title": "Food",
      "icon": Icons.restaurant_rounded,
    },
    {
      "title": "Travel",
      "icon": Icons.flight_takeoff_rounded,
    },
    {
      "title": "Fitness",
      "icon": Icons.fitness_center_rounded,
    },
    {
      "title": "Gaming",
      "icon": Icons.sports_esports_rounded,
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

  void _skip() {
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

      title: "What are you into?",

      subtitle: "You can update your interests anytime.",

      buttonText: "Skip",

      buttonEnabled: true,

      onButtonPressed: _skip,

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