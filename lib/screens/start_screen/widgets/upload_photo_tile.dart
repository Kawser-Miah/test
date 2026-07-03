import 'dart:io';

import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

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
    return AspectRatio(
      aspectRatio: 1,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.border,
              ),
            ),
            child: image == null
                ? _buildPlaceholder()
                : _buildImage(),
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade100,
            ),
            child: const Icon(
              Icons.add,
              size: 30,
              color: AppColors.icon,
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            "Add Photo",
            style: TextStyle(
              fontFamily: "Manrope",
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
        ],
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
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }
}