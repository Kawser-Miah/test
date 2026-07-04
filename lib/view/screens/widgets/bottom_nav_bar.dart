import 'package:flutter/material.dart';
import 'package:test_project/config/theme/app_colors.dart';
import 'package:test_project/config/theme/app_gradient.dart';
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
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowBlack8,
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
                assetName: 'community',
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
          gradient: AppGradients.fab,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowBlue,
              blurRadius: 36,
              offset: const Offset(0, 0),
            ),
          ],
        ),
          child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36),
            color: AppColors.transparent,
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
