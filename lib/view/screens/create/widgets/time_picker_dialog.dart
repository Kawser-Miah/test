import 'package:flutter/material.dart';

import 'event_time_picker_dialog.dart';

class TimePickerDialogWidget extends StatelessWidget {
  final TimeOfDay initialTime;

  const TimePickerDialogWidget({
    super.key,
    required this.initialTime,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTimePicker(
            initialTime: initialTime,
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        CustomTimePicker.selectedTime,
                      );
                    },
                    child: const Text("Save"),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}