import 'package:flutter/material.dart';
import 'package:test_project/screens/start_screen/widgets/custom_text_field.dart';
import 'package:test_project/screens/start_screen/widgets/onboarding_scaffold.dart';


import 'birthday_screen.dart';

class FirstNameScreen extends StatefulWidget {
  const FirstNameScreen({super.key});

  @override
  State<FirstNameScreen> createState() => _FirstNameScreenState();
}

class _FirstNameScreenState extends State<FirstNameScreen> {
  final TextEditingController _nameController = TextEditingController();

  bool get _isValid => _nameController.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();

    _nameController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _continue() {
    FocusScope.of(context).unfocus();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BirthdayScreen(
          firstName: _nameController.text.trim(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      currentStep: 1,
      totalSteps: 7,

      title: "What's your first name?",

      subtitle:
      "This is how it'll appear on your profile. You can always change it later.",

      buttonText: "Continue",

      buttonEnabled: _isValid,

      onButtonPressed: _continue,

      child: Column(
        children: [
          CustomTextField(
            controller: _nameController,
            hintText: "Enter your first name",
            textInputAction: TextInputAction.done,
            onSubmitted: (_) {
              if (_isValid) {
                _continue();
              }
            },
          ),
        ],
      ),
    );
  }
}