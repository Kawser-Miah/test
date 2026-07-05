import 'package:flutter/material.dart';

class AttendingAvatars extends StatelessWidget {
  final List<String> images;
  final int extraCount;

  const AttendingAvatars({
    super.key,
    required this.images,
    this.extraCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    const double size = 36;
    const double overlap = 24;

    return SizedBox(
      height: size,
      width: overlap * (images.length + (extraCount > 0 ? 1 : 0)) + 12,
      child: Stack(
        children: [
          for (int i = 0; i < images.length; i++)
            Positioned(
              left: i * overlap,
              child: Container(
                width: size,
                height: size,
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage(images[i]),
                ),
              ),
            ),

          if (extraCount > 0)
            Positioned(
              left: images.length * overlap,
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: const Color(0xFFD8ECFF),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  '+$extraCount',
                  style: const TextStyle(
                    color: Color(0xFF1E88E5),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}