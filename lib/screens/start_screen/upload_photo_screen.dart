import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_project/screens/start_screen/widgets/onboarding_scaffold.dart';
import 'package:test_project/screens/start_screen/widgets/upload_photo_tile.dart';


import 'gender_screen.dart';

import 'location_screen.dart';
import 'looking_for_screen.dart';

class UploadPhotoScreen extends StatefulWidget {
  final String firstName;
  final DateTime birthday;
  final Gender gender;
  final LookingFor lookingFor;
  final List<String> interests;

  const UploadPhotoScreen({
    super.key,
    required this.firstName,
    required this.birthday,
    required this.gender,
    required this.lookingFor,
    required this.interests,
  });

  @override
  State<UploadPhotoScreen> createState() => _UploadPhotoScreenState();
}

class _UploadPhotoScreenState extends State<UploadPhotoScreen> {
  final ImagePicker _picker = ImagePicker();

  final List<File?> _photos = List.generate(6, (_) => null);

  int get _photoCount =>
      _photos.where((element) => element != null).length;

  Future<void> _pickImage(int index) async {
    final XFile? picked = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );

    if (picked == null) return;

    setState(() {
      _photos[index] = File(picked.path);
    });
  }

  void _removeImage(int index) {
    setState(() {
      _photos[index] = null;
    });
  }

  void _continue() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => LocationScreen(
          firstName: widget.firstName,
          birthday: widget.birthday,
          gender: widget.gender,
          lookingFor: widget.lookingFor,
          interests: widget.interests,
          photos: _photos.whereType<File>().toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      currentStep: 6,
      totalSteps: 7,

      title: "Upload your photos",

      subtitle:
      "Add at least 2 photos to complete your profile. Your first photo will be your profile picture.",

      buttonText: "Continue",

      buttonEnabled: _photoCount >= 2,

      onButtonPressed: _continue,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return UploadPhotoTile(
                image: _photos[index],
                onTap: () => _pickImage(index),
                onRemove: _photos[index] != null
                    ? () => _removeImage(index)
                    : null,
              );
            },
          ),

          const SizedBox(height: 24),

          Text(
            "$_photoCount / 6 photos selected",
            style: const TextStyle(
              fontFamily: "Manrope",
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}