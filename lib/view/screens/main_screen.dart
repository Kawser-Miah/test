import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_project/view/screens/create/create_event/create_selection_screen.dart';
import 'package:test_project/view/screens/profile/profile_page.dart';
import 'package:test_project/view/screens/widgets/bottom_nav_bar.dart';
import 'package:test_project/config/theme/app_colors.dart';

import 'community_and_event/community_selection_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 1;

  final List<Widget> _pages = const [
    _PlaceholderPage(label: 'Explore'),
    CommunitySelectionScreen(),
    CreateSelectionScreen(),
    _PlaceholderPage(label: 'Messages'),
    ProfileDetailPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.background,
        extendBody: true,
        body: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
        ),
      ),
    );
  }
}

class _PlaceholderPage extends StatelessWidget {
  final String label;

  const _PlaceholderPage({required this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
