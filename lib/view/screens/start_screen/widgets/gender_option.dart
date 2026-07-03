import 'package:flutter/material.dart';

class GenderOption extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const GenderOption({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1.5,
                  color: selected
                      ? const Color(0xFF2F9BFF)
                      : const Color(0xFFA8A8A8),
                ),
                color: selected
                    ? const Color(0xFF2F9BFF)
                    : Colors.transparent,
              ),
              child: selected
                  ? const Icon(
                Icons.check,
                size: 12,
                color: Colors.white,
              )
                  : null,
            ),

            const SizedBox(width: 8),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: "Manrope",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF555555),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}