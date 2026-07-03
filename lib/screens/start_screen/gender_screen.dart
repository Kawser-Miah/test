import 'package:flutter/material.dart';
import 'package:test_project/screens/start_screen/widgets/gender_option.dart';
import 'package:test_project/screens/start_screen/widgets/onboarding_scaffold.dart';
import 'package:test_project/screens/start_screen/widgets/option_card.dart';


import 'looking_for_screen.dart';

enum Gender {
  male,
  female,
  other,
  optional
}

class GenderScreen extends StatefulWidget {
  final String firstName;
  final DateTime birthday;

  const GenderScreen({
    super.key,
    required this.firstName,
    required this.birthday,
  });

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  Gender? _selectedGender;
  bool showGender = false;

  void _continue() {
    if (_selectedGender == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => LookingForScreen(
          firstName: widget.firstName,
          birthday: widget.birthday,
          gender: _selectedGender!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      currentStep: 3,
      totalSteps: 7,

      title: "What's your gender?",

      subtitle:
      "Choose the option that best describes you. This helps personalize your experience.",

      buttonText: "Continue",

      buttonEnabled: _selectedGender != null,

      onButtonPressed: _continue,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GenderOption(
              title: "Man",
              selected: _selectedGender == Gender.male,
              onTap: () {
                setState(() {
                  _selectedGender = Gender.male;
                });
              },
            ),

            GenderOption(
              title: "Woman",
              selected: _selectedGender == Gender.female,
              onTap: () {
                setState(() {
                  _selectedGender = Gender.female;
                });
              },
            ),

            GenderOption(
              title: "Beyond Binary",
              selected: _selectedGender == Gender.other,
              onTap: () {
                setState(() {
                  _selectedGender = Gender.other;
                });
              },
            ),

            GenderOption(
              title: "Prefer not to say (optional)",
              selected: _selectedGender == Gender.optional,
              onTap: () {
                setState(() {
                  _selectedGender = Gender.optional;

                });
              },
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: Checkbox(
                    value: showGender,
                    onChanged: (value) {
                      setState(() {
                        showGender = value!;
                      });
                    },
                    activeColor: const Color(0xFF2F9BFF),
                    side: const BorderSide(
                      color: Color(0xFFA8A8A8),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                const Text(
                  "Show my gender on my profile",
                  style: TextStyle(
                    fontFamily: "Manrope",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }
}