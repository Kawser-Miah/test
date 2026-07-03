import 'package:flutter/material.dart';

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
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
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
                icon: Icons.location_on_outlined,
                index: 0,
                currentIndex: currentIndex,
                onTap: onTap,
              ),

              // 1 - Community (People)
              _NavItem(
                icon: Icons.people_outline_rounded,
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
                icon: Icons.chat_bubble_outline_rounded,
                index: 3,
                currentIndex: currentIndex,
                onTap: onTap,
              ),

              // 4 - Profile
              _NavItem(
                icon: Icons.person_outline_rounded,
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
  final IconData icon;
  final int index;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _NavItem({
    required this.icon,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 52,
        height: 68,
        child: Center(
          child: isActive
              ? ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFF4DB6FF), Color(0xFF8B5CF6)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ).createShader(bounds),
                  blendMode: BlendMode.srcIn,
                  child: Icon(icon, size: 26, color: Colors.white),
                )
              : Icon(icon, size: 26, color: const Color(0xFFB0B0B0)),
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
          child: const Center(
            child: Icon(
              Icons.add_box_outlined,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
