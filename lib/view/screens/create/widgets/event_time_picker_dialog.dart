import 'package:flutter/material.dart';
import 'package:test_project/config/theme/app_colors.dart';

/// Shows a two-column (hour / minute) wheel time picker, styled to match
/// the Create Event form's Cancel/Save dialogs.
Future<TimeOfDay?> showEventTimePicker(
  BuildContext context, {
  TimeOfDay initialTime = const TimeOfDay(hour: 0, minute: 0),
}) {
  return showDialog<TimeOfDay>(
    context: context,
    builder: (_) => _EventTimePickerDialog(initialTime: initialTime),
  );
}

class _EventTimePickerDialog extends StatefulWidget {
  final TimeOfDay initialTime;

  const _EventTimePickerDialog({required this.initialTime});

  @override
  State<_EventTimePickerDialog> createState() =>
      _EventTimePickerDialogState();
}

class _EventTimePickerDialogState extends State<_EventTimePickerDialog> {
  late int _hour = widget.initialTime.hour;
  late int _minute = widget.initialTime.minute;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Select Time',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: Row(
                children: [
                  Expanded(
                    child: _NumberWheel(
                      itemCount: 24,
                      initial: _hour,
                      onChanged: (v) => _hour = v,
                    ),
                  ),
                  const Text(
                    ':',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Expanded(
                    child: _NumberWheel(
                      itemCount: 60,
                      initial: _minute,
                      onChanged: (v) => _minute = v,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(
                      context,
                      TimeOfDay(hour: _hour, minute: _minute),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        color: AppColors.primaryPurple,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _NumberWheel extends StatelessWidget {
  final int itemCount;
  final int initial;
  final ValueChanged<int> onChanged;

  const _NumberWheel({
    required this.itemCount,
    required this.initial,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView.useDelegate(
      itemExtent: 40,
      diameterRatio: 1.4,
      physics: const FixedExtentScrollPhysics(),
      controller: FixedExtentScrollController(initialItem: initial),
      onSelectedItemChanged: onChanged,
      childDelegate: ListWheelChildBuilderDelegate(
        childCount: itemCount,
        builder: (context, index) => Center(
          child: Text(
            index.toString().padLeft(2, '0'),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
