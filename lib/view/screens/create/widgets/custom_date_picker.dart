import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_project/config/theme/app_gradient.dart';

Future<DateTime?> showCustomDatePicker(
  BuildContext context, {
  DateTime? initialDate,
}) {
  return showDialog<DateTime>(
    context: context,
    barrierDismissible: false,
    builder: (_) =>
        _CustomDatePickerDialog(initialDate: initialDate ?? DateTime.now()),
  );
}

class _CustomDatePickerDialog extends StatefulWidget {
  final DateTime initialDate;

  const _CustomDatePickerDialog({required this.initialDate});

  @override
  State<_CustomDatePickerDialog> createState() =>
      _CustomDatePickerDialogState();
}

class _CustomDatePickerDialogState extends State<_CustomDatePickerDialog> {
  late DateTime displayedMonth;
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
    displayedMonth = DateTime(
      widget.initialDate.year,
      widget.initialDate.month,
    );
  }

  List<DateTime> _days() {
    final firstDay = DateTime(displayedMonth.year, displayedMonth.month, 1);

    final lastDay = DateTime(displayedMonth.year, displayedMonth.month + 1, 0);

    final firstWeekday = firstDay.weekday % 7;

    final total = firstWeekday + lastDay.day <= 35 ? 35 : 42;

    final firstGridDay = firstDay.subtract(Duration(days: firstWeekday));

    return List.generate(
      total,
      (index) => firstGridDay.add(Duration(days: index)),
    );
  }

  bool _sameDay(DateTime a, DateTime b) {
    return a.day == b.day && a.month == b.month && a.year == b.year;
  }

  @override
  Widget build(BuildContext context) {
    final days = _days();

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 370,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// HEADER
            DropdownButtonHideUnderline(
              child: DropdownButton<DateTime>(
                value: displayedMonth,
                icon: const Icon(Icons.keyboard_arrow_down),
                borderRadius: BorderRadius.circular(16),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                items: List.generate(12 * 11, (index) {
                  final year = 2020 + (index ~/ 12);
                  final month = (index % 12) + 1;

                  final date = DateTime(year, month);

                  return DropdownMenuItem<DateTime>(
                    value: date,
                    child: Text(DateFormat('MMMM yyyy').format(date)),
                  );
                }),
                onChanged: (value) {
                  if (value == null) return;

                  setState(() {
                    displayedMonth = value;

                    // Keep the selected day if possible
                    selectedDate = DateTime(
                      value.year,
                      value.month,
                      selectedDate.day,
                    );
                  });
                },
              ),
            ),

            const SizedBox(height: 26),

            /// WEEK DAYS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _WeekDay("S"),
                _WeekDay("M"),
                _WeekDay("T"),
                _WeekDay("W"),
                _WeekDay("T"),
                _WeekDay("F"),
                _WeekDay("S"),
              ],
            ),

            const SizedBox(height: 16),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: days.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: 1,
              ),
              itemBuilder: (_, index) {
                final day = days[index];

                final isCurrent = day.month == displayedMonth.month;

                final isSelected = _sameDay(day, selectedDate);

                return InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    setState(() {
                      selectedDate = day;
                    });
                  },
                  child: Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      width: 38,
                      height: 38,
                      decoration: isSelected
                          ? const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: AppGradients.fab,
                            )
                          : null,
                      alignment: Alignment.center,
                      child: Text(
                        "${day.day}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: isSelected
                              ? Colors.white
                              : isCurrent
                              ? Colors.black87
                              : Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),

                const SizedBox(width: 18),

                TextButton(
                  onPressed: () {
                    Navigator.pop(context, selectedDate);
                  },
                  child: ShaderMask(
                    shaderCallback: (bounds) {
                      return AppGradients.fab.createShader(bounds);
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Color(0xff8A6BFF), fontSize: 18),
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

class _WeekDay extends StatelessWidget {
  final String text;

  const _WeekDay(this.text);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
