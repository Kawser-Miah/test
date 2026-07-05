import 'package:flutter/material.dart';

class WheelPicker extends StatefulWidget {
  final int itemCount;
  final int initialIndex;
  final ValueChanged<int> onChanged;

  const WheelPicker({
    super.key,
    required this.itemCount,
    required this.initialIndex,
    required this.onChanged,
  });

  @override
  State<WheelPicker> createState() => _WheelPickerState();
}

class _WheelPickerState extends State<WheelPicker> {
  late final FixedExtentScrollController controller;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    currentIndex = widget.initialIndex;

    controller = FixedExtentScrollController(
      initialItem: widget.initialIndex,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [

        /// Selected Item Background
        IgnorePointer(
          child: Center(
            child: Container(
              height: 46,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: const Color(0xffF2F2F2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.03),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
        ),

        /// Wheel
        ListWheelScrollView.useDelegate(
          controller: controller,
          itemExtent: 46,
          diameterRatio: 2.2,
          perspective: .002,
          physics: const FixedExtentScrollPhysics(),
          onSelectedItemChanged: (index) {
            setState(() {
              currentIndex = index;
            });

            widget.onChanged(index);
          },
          childDelegate: ListWheelChildBuilderDelegate(
            childCount: widget.itemCount,
            builder: (_, index) {
              final selected = index == currentIndex;

              return Center(
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 120),
                  style: TextStyle(
                    fontSize: selected ? 24 : 20,
                    fontWeight:
                    selected ? FontWeight.w700 : FontWeight.w400,
                    color: selected
                        ? const Color(0xff333333)
                        : Colors.grey.shade400,
                  ),
                  child: Text(
                    index.toString().padLeft(2, '0'),
                  ),
                ),
              );
            },
          ),
        ),

        /// Top Fade
        IgnorePointer(
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 55,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white70,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ),

        /// Bottom Fade
        IgnorePointer(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 55,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.white,
                    Colors.white70,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}