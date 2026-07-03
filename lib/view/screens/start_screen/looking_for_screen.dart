import 'package:flutter/material.dart';
import 'package:test_project/view/screens/start_screen/widgets/looking_for_card.dart';
import 'package:test_project/view/screens/start_screen/widgets/onboarding_scaffold.dart';

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

      child:  GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 18,
        childAspectRatio: 1.90,
      ),
      itemBuilder: (context, index) {
        final items = [
          (
          title: "Friendship",
          icon: Icons.people_outline,
          value: LookingFor.friendship,
          ),
          (
          title: "Events",
          icon: Icons.calendar_today_outlined,
          value: LookingFor.events,
          ),
          (
          title: "Community",
          icon: Icons.groups_2_outlined,
          value: LookingFor.community,
          ),
          (
          title: "Relationship",
          icon: Icons.favorite_border,
          value: LookingFor.relationship,
          ),
          (
          title: "I'm not sure yet",
          icon: Icons.help_outline,
          value: LookingFor.notSure,
          ),
        ];

        final item = items[index];

        return LookingForCard(
          title: item.title,
          icon: item.icon,
          selected: _selected == item.value,
          onTap: () {
            setState(() {
              _selected = item.value;
            });
          },
        );
      },
    ),
    );
  }
}
