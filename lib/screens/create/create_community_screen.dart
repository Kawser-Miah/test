import 'package:flutter/material.dart';

/// Placeholder destination for the `/create-community` route.
///
/// Replace with the real "create community" form. Kept minimal so the
/// navigation from [CreateSelectionPage] works out of the box.
class CreateCommunityScreen extends StatelessWidget {
  const CreateCommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Community')),
      body: const Center(
        child: Text('Create Community form goes here'),
      ),
    );
  }
}
