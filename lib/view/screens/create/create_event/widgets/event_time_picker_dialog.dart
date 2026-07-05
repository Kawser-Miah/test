import 'package:flutter/material.dart';

import 'time_picker_column.dart';

class CustomTimePicker extends StatefulWidget {
  final TimeOfDay initialTime;

  const CustomTimePicker({super.key, required this.initialTime});

  static TimeOfDay selectedTime = const TimeOfDay(hour: 0, minute: 0);

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  late int hour;
  late int minute;

  @override
  void initState() {
    super.initState();

    hour = widget.initialTime.hour;
    minute = widget.initialTime.minute;

    CustomTimePicker.selectedTime = widget.initialTime;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 230,
      child: Stack(
        alignment: Alignment.center,
        children: [
          /// Background Card
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.08),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
          ),

          /// Selected Row Highlight
          Positioned(
            left: 10,
            right: 10,
            child: Container(
              height: 42,
              decoration: BoxDecoration(
                color: const Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          /// Hour & Minute Columns
          Row(
            children: [
              Expanded(
                child: TimePickerColumn(
                  initialIndex: hour,
                  values: List.generate(
                    24,
                        (i) => i.toString().padLeft(2, '0'),
                  ),
                  onChanged: (value) {
                    setState(() {
                      hour = value;
                      CustomTimePicker.selectedTime = TimeOfDay(
                        hour: hour,
                        minute: minute,
                      );
                    });
                  },
                ),
              ),
              Expanded(
                child: TimePickerColumn(
                  initialIndex: minute,
                  values: List.generate(
                    60,
                        (i) => i.toString().padLeft(2, '0'),
                  ),
                  onChanged: (value) {
                    setState(() {
                      minute = value;
                      CustomTimePicker.selectedTime = TimeOfDay(
                        hour: hour,
                        minute: minute,
                      );
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
