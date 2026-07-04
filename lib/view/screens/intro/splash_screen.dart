import 'package:flutter/material.dart';

import 'animated_background.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  // Background phases
  late final Animation<double> _introBackground; // cyan-blue → white
  late final Animation<double> _finalBackground; // white → light blue

  // Bubble animations
  late final Animation<double> _bubble1;
  late final Animation<double> _bubble2;
  late final Animation<double> _bubble3;
  late final Animation<double> _bubble4;

  // UI element animations
  late final Animation<double> _logoText;
  late final Animation<double> _moveUp;
  late final Animation<double> _bodyText;
  late final Animation<double> _button;

  @override
  void initState() {
    super.initState();

    // Total duration: 5.5s
    // 0.00 → 0.15  : cyan-blue intro screen (holds)
    // 0.15 → 0.25  : fades to white
    // 0.25 → 0.35  : bubble4 drops (first, fast)
    // 0.38 → 0.50  : bubble2 + bubble3 drop simultaneously
    // 0.52 → 0.63  : bubble1 drops (last)
    // 0.63 → 0.71  : "vibe.now" fades up
    // 0.71 → 0.79  : logo + text move up
    // 0.79 → 0.90  : body text fades in
    // 0.90 → 1.00  : Next button slides up + white→light-blue background

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5500),
    );

    // ── Background: cyan-blue → white (0.15 → 0.25) ──────────────────
    _introBackground = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.15, 0.25, curve: Curves.easeInOut),
    );

    // ── Background: white → light blue (0.63 → 1.00) ─────────────────
    _finalBackground = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.63, 1.00, curve: Curves.easeInOut),
    );

    // ── Bubbles ───────────────────────────────────────────────────────

    // bubble4 — FIRST, FAST: 0.25 → 0.35
    _bubble4 = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.25, 0.35, curve: Curves.easeOut),
    );

    // bubble2 + bubble3 — SIMULTANEOUS: 0.38 → 0.50
    _bubble2 = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.38, 0.50, curve: Curves.easeOut),
    );
    _bubble3 = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.38, 0.50, curve: Curves.easeOut),
    );

    // bubble1 — LAST: 0.52 → 0.63
    _bubble1 = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.52, 0.63, curve: Curves.easeOut),
    );

    // ── UI elements ───────────────────────────────────────────────────

    // "vibe.now" fades up: 0.63 → 0.71
    _logoText = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.63, 0.71, curve: Curves.easeOut),
    );

    // Logo + text move up: 0.71 → 0.79
    _moveUp = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.71, 0.79, curve: Curves.easeInOut),
    );

    // Body text fades in: 0.79 → 0.90
    _bodyText = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.79, 0.90, curve: Curves.easeOut),
    );

    // Next button slides up: 0.90 → 1.00
    _button = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.90, 1.00, curve: Curves.easeOutBack),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBackground(
            introAnimation: _introBackground,
            finalAnimation: _finalBackground,
          ),

          WelcomeScreen(
            bubble1: _bubble1,
            bubble2: _bubble2,
            bubble3: _bubble3,
            bubble4: _bubble4,
            logoTextAnimation: _logoText,
            moveUpAnimation: _moveUp,
            bodyAnimation: _bodyText,
            buttonAnimation: _button,
          ),
        ],
      ),
    );
  }
}
