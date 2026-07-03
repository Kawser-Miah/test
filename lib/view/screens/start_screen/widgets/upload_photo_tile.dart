import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_project/view/screens/start_screen/widgets/upload_placeholder_icon.dart';

import 'dashed_border_painter.dart';

class UploadPhotoTile extends StatelessWidget {
  final File? image;
  final VoidCallback onTap;
  final VoidCallback? onRemove;

  const UploadPhotoTile({
    super.key,
    required this.image,
    required this.onTap,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 104,
      height: 129,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: onTap,
          child: image == null
              ? _buildPlaceholder()
              : _buildImage(),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return CustomPaint(
      painter: DashedBorderPainter(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Icon(
            Icons.add_photo_alternate_outlined,
            size: 30,
            color: Color(0xffB4B4B4),
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.file(
              image!,
              fit: BoxFit.cover,
            ),
          ),
        ),

        if (onRemove != null)
          Positioned(
            top: 6,
            right: 6,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: const UploadPlaceholderIcon()
              ),
            ),
          ),
      ],
    );
  }
}