import 'package:flutter/material.dart';

class CategoryFilterCard extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryFilterCard({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        alignment: Alignment.center,
        width: 112,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF262626) : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: const Color(0xFFE7E7E7), width: 1),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : const Color(0xFF5A5A5A),
          ),
        ),
      ),
    );
  }
}
