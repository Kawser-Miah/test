import 'package:flutter/material.dart';
import 'package:test_project/view/screens/onboarding/widgets/custom_text_field.dart';
import 'package:test_project/view/screens/onboarding/widgets/onboarding_scaffold.dart';
import 'package:intl/intl.dart';

import 'gender_screen.dart';



class BirthdayScreen extends StatefulWidget {
  final String firstName;

  const BirthdayScreen({
    super.key,
    required this.firstName,
  });

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController =
  TextEditingController();

  DateTime? _selectedDate;

  bool get _isValid => _selectedDate != null;

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  Future<void> _pickBirthday() async {
    FocusScope.of(context).unfocus();

    final now = DateTime.now();

    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(
        now.year - 20,
        now.month,
        now.day,
      ),
      firstDate: DateTime(1950),
      lastDate: now,
    );

    if (picked == null) return;

    setState(() {
      _selectedDate = picked;
      _birthdayController.text =
          DateFormat('dd MMM yyyy').format(picked);
    });
  }

  void _continue() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => GenderScreen(
          firstName: widget.firstName,
          birthday: _selectedDate!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      currentStep: 2,
      totalSteps: 7,

      title: "What's your birthday?",

      subtitle:
      "Your profile will only show your age, never your full birth date.",

      buttonText: "Continue",

      buttonEnabled: _isValid,

      onButtonPressed: _continue,

      child: Column(
        children: [
          CustomTextField(
            controller: _birthdayController,
            hintText: "Select your birthday",
            readOnly: true,
            onTap: _pickBirthday,
            suffixIcon: const Icon(
              Icons.calendar_month_rounded,
            ),
          ),
        ],
      ),
    );
  }
}