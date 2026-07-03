import 'package:flutter/material.dart';

/// Placeholder destination for the `/create-event` route.
///
/// Replace with the real "create event" form. Kept minimal so the navigation
/// from [CreateSelectionPage] works out of the box.
class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Event')),
      body: const Center(
        child: Text('Create Event form goes here'),
      ),
    );
  }
}
