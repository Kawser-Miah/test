import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_project/view/screens/onboarding/widgets/onboarding_scaffold.dart';
import 'package:test_project/view/screens/onboarding/widgets/upload_photo_tile.dart';


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

  final List<File?> _photos = List.generate(4, (_) => null);

  int get photoCount => _photos.whereType<File>().length;

  Future<void> _pickImage(int index) async {
    final XFile? picked = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 90,
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

  Widget tile(int index) {
    return UploadPhotoTile(
      image: _photos[index],
      onTap: () => _pickImage(index),
      onRemove: _photos[index] != null
          ? () => _removeImage(index)
          : null,
    );
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

      title: "Upload Photos",

      subtitle:
      "You're almost there! Add at least one\npictures. Also can upload picture later.",

      buttonText: "Continue",

      buttonEnabled: true,

      onButtonPressed: _continue,

      child: SizedBox(
        height: 300,
        child: Stack(
          children: [

            /// Top photo
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: tile(0),
              ),
            ),

            /// Bottom Left
            Positioned(
              top: 150,
              left: 0,
              child: tile(1),
            ),

            /// Bottom Center
            Positioned(
              top: 150,
              left: 0,
              right: 0,
              child: Center(
                child: tile(2),
              ),
            ),

            /// Bottom Right
            Positioned(
              top: 150,
              right: 0,

              child: tile(3),
            ),
          ],
        ),
      ),
    );
  }
}