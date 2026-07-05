import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_project/config/theme/app_colors.dart';
import 'package:test_project/config/theme/app_gradient.dart';
import 'package:test_project/view/screens/onboarding/widgets/dashed_border_painter.dart';

/// Dashed-border "Upload Cover Image" box for the Create Event form.
class UploadCoverImageBox extends StatefulWidget {
  final ValueChanged<File?>? onChanged;

  const UploadCoverImageBox({super.key, this.onChanged});

  @override
  State<UploadCoverImageBox> createState() => _UploadCoverImageBoxState();
}

class _UploadCoverImageBoxState extends State<UploadCoverImageBox> {
  final ImagePicker _picker = ImagePicker();
  File? _coverImage;

  Future<void> _pickImage() async {
    final XFile? picked = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 90,
    );

    if (picked == null) return;

    setState(() => _coverImage = File(picked.path));
    widget.onChanged?.call(_coverImage);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: CustomPaint(
        painter: DashedBorderPainter(radius: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            width: double.infinity,
            height: 150,
            child: _coverImage != null
                ? Image.file(_coverImage!, fit: BoxFit.cover)
                : Container(
                    decoration: const BoxDecoration(
                      gradient: AppGradients.formCard,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/logo/galery.svg',
                          width: 32,
                          height: 32,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Upload Cover Image',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'Click to browse',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
