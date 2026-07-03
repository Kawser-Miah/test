import 'package:flutter/material.dart';
import 'package:test_project/screens/start_screen/widgets/onboarding_scaffold.dart';
import 'package:test_project/screens/start_screen/widgets/option_card.dart';

import 'gender_screen.dart';
import 'interests_screen.dart';

enum LookingFor {
  relationship,
  friendship,
  casualDating,
  networking,
  chatting,
  events,
  community,
  notSure,
}

class LookingForScreen extends StatefulWidget {
  final String firstName;
  final DateTime birthday;
  final Gender gender;

  const LookingForScreen({
    super.key,
    required this.firstName,
    required this.birthday,
    required this.gender,
  });

  @override
  State<LookingForScreen> createState() => _LookingForScreenState();
}

class _LookingForScreenState extends State<LookingForScreen> {
  LookingFor? _selected;

  void _skip() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => InterestsScreen(
          firstName: widget.firstName,
          birthday: widget.birthday,
          gender: widget.gender,
          lookingFor: _selected ?? LookingFor.notSure,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      currentStep: 4,
      totalSteps: 7,

      title: "What are you looking for?",

      subtitle: "No pressure — you can change this anytime.",

      buttonText: "Skip",

      buttonEnabled: true,

      onButtonPressed: _skip,

      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
        childAspectRatio: 1.55,
        children: [
          OptionCard(
            title: "Friendship",
            icon: Icons.people_outline,
            selected: _selected == LookingFor.friendship,
            onTap: () {
              setState(() {
                _selected = LookingFor.friendship;
              });
            },
          ),

          OptionCard(
            title: "Events",
            icon: Icons.calendar_today_outlined,
            selected: _selected == LookingFor.events,
            onTap: () {
              setState(() {
                _selected = LookingFor.events;
              });
            },
          ),

          OptionCard(
            title: "Community",
            icon: Icons.groups_2_outlined,
            selected: _selected == LookingFor.community,
            onTap: () {
              setState(() {
                _selected = LookingFor.community;
              });
            },
          ),

          OptionCard(
            title: "Relationship",
            icon: Icons.favorite_border,
            selected: _selected == LookingFor.relationship,
            onTap: () {
              setState(() {
                _selected = LookingFor.relationship;
              });
            },
          ),

          OptionCard(
            title: "I'm not sure yet",
            icon: Icons.help_outline,
            selected: _selected == LookingFor.notSure,
            onTap: () {
              setState(() {
                _selected = LookingFor.notSure;
              });
            },
          ),
        ],
      ),
    );
  }
}
