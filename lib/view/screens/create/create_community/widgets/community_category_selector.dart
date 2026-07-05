import 'package:flutter/material.dart';
import 'package:test_project/config/theme/app_colors.dart';

class CommunityCategorySelector extends StatefulWidget {
  final List<String> categories;
  final ValueChanged<Set<String>>? onChanged;
  final bool multiSelect;

  const CommunityCategorySelector({
    super.key,
    this.categories = const [
      'Social',
      'Music',
      'Wellness',
      'Sports',
      'Learning',
      'Food',
      'Art',
      'Tech',
      'Gaming',
    ],
    this.onChanged,
    this.multiSelect = false,
  });

  @override
  State<CommunityCategorySelector> createState() =>
      _CommunityCategorySelectorState();
}

class _CommunityCategorySelectorState
    extends State<CommunityCategorySelector> {
  final Set<String> _selected = {};

  void _onTap(String category) {
    setState(() {
      if (widget.multiSelect) {
        _selected.contains(category)
            ? _selected.remove(category)
            : _selected.add(category);
      } else {
        _selected
          ..clear()
          ..add(category);
      }
    });
    widget.onChanged?.call(_selected);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Community Category',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: widget.categories.map((category) {
            final bool isSelected = _selected.contains(category);
            return _buildChip(category, isSelected);
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildChip(String label, bool isSelected) {
    return Material(
      color: isSelected ? AppColors.textPrimary : AppColors.surfaceChipInactive,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () => _onTap(label),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isSelected ? AppColors.white : AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}