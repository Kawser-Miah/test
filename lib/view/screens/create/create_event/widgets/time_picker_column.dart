import 'package:flutter/material.dart';

class TimePickerColumn extends StatefulWidget {
  final List<String> values;
  final int initialIndex;
  final ValueChanged<int>? onChanged;

  const TimePickerColumn({
    super.key,
    required this.values,
    required this.initialIndex,
    this.onChanged,
  });

  @override
  State<TimePickerColumn> createState() => _TimePickerColumnState();
}

class _TimePickerColumnState extends State<TimePickerColumn> {
  static const double itemHeight = 32;

  late final FixedExtentScrollController _controller;

  late int selectedIndex;

  @override
  void initState() {
    super.initState();

    selectedIndex = widget.initialIndex;

    _controller = FixedExtentScrollController(
      initialItem: widget.initialIndex,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView.useDelegate(
      controller: _controller,
      itemExtent: itemHeight,
      physics: const FixedExtentScrollPhysics(),

      // Makes the wheel almost flat
      diameterRatio: 100,
      perspective: 0.0001,
      squeeze: 1,

      overAndUnderCenterOpacity: 1,

      onSelectedItemChanged: (index) {
        setState(() {
          selectedIndex = index;
        });

        widget.onChanged?.call(index);
      },

      childDelegate: ListWheelChildBuilderDelegate(
        childCount: widget.values.length,
        builder: (context, index) {
          final bool isSelected = index == selectedIndex;

          return Center(
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOut,
              style: TextStyle(
                fontSize: 22,
                fontWeight:
                isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected
                    ? const Color(0xff2C2C2C)
                    : const Color(0xff6D6D6D),
              ),
              child: Text(widget.values[index]),
            ),
          );
        },
      ),
    );
  }
}