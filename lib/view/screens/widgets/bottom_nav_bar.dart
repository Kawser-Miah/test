import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 20,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 68,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 0 - Location
              _NavItem(
                assetName: 'location',
                index: 0,
                currentIndex: currentIndex,
                onTap: onTap,
              ),

              // 1 - Community (People)
              _NavItem(
                assetName: 'comunity',
                index: 1,
                currentIndex: currentIndex,
                onTap: onTap,
              ),

              // 2 - Center FAB (Create)
              _CenterFab(
                isActive: currentIndex == 2,
                onTap: () => onTap(2),
              ),

              // 3 - Messages (Chat)
              _NavItem(
                assetName: 'chat',
                index: 3,
                currentIndex: currentIndex,
                onTap: onTap,
              ),

              // 4 - Profile
              _NavItem(
                assetName: 'profile',
                index: 4,
                currentIndex: currentIndex,
                onTap: onTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String assetName;
  final int index;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _NavItem({
    required this.assetName,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = currentIndex == index;

    final assetPath = 'assets/nav_icon/$assetName${isActive ? '_fill' : ''}.svg';

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 52,
        height: 68,
        child: Center(
          child: SvgPicture.asset(
            assetPath,
            width: 26,
            height: 26,
          ),
        ),
      ),
    );
  }
}

class _CenterFab extends StatelessWidget {
  final VoidCallback onTap;
  final bool isActive;

  const _CenterFab({
    super.key,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 54,
        height: 54,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: const LinearGradient(
            begin: Alignment(0.75, -1.0), // ≈232.79°
            end: Alignment(-0.75, 1.0),
            colors: [
              Color(0xFF8663F6),
              Color(0xFFC470F5),
              Color(0xFF57C2FF),
            ],
            stops: [
              0.1164,
              0.4874,
              0.8704,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0x804CBBFF), // #4CBBFF80
              blurRadius: 36,
              offset: const Offset(0, 0),
            ),
          ],
        ),
          child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36),
            color: Colors.transparent,
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/nav_icon/plus.svg',
              width: 20,
              height: 20,
            ),
          ),
        ),
      ),
    );
  }
}
