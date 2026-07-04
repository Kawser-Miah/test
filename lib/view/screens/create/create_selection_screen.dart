import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_project/config/theme/app_colors.dart';
import 'package:test_project/config/theme/app_gradient.dart';

const String _eventRoute = '/create-event';
const String _communityRoute = '/create-community';

/// Selection screen body for the "Create" tab.
///
/// Lets the user choose between creating an [Event] or a [Community] and
/// navigates to the corresponding named route via [Navigator.pushNamed].
///
/// This widget intentionally returns only the body content (no [Scaffold],
/// [AppBar] or bottom navigation bar). Drop it into a parent [Scaffold] that
/// already provides chrome and navigation.
class CreateSelectionScreen extends StatelessWidget {
  const CreateSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBox(
      gradient: AppGradients.createBackground,
      child: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          // Bottom padding clears the floating bottom navigation bar.
          padding: const EdgeInsets.fromLTRB(20, 28, 20, 116),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 460),
              child: _FrostedCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // --- Header -------------------------------------------------
                    const Text(
                      'Create Event or Community',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Choose the type of vibe you want to share',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // --- Option cards ------------------------------------------
                    _CreateOptionCard(
                      icon: Icons.event_rounded,
                      accent: AppColors.accentEvent,
                      title: 'Event',
                      description:
                          'Plan a one-time gathering and invite people to join the moment.',
                      routeName: _eventRoute,
                    ),
                    const SizedBox(height: 14),
                    _CreateOptionCard(
                      icon: Icons.groups_rounded,
                      accent: AppColors.accentCommunity,
                      title: 'Community',
                      description:
                          'Start an ongoing space where members connect and share.',
                      routeName: _communityRoute,
                    ),

                    const SizedBox(height: 22),
                    const Divider(height: 1, color: AppColors.shadowBlack8),
                    const SizedBox(height: 18),

                    // --- Footer / pro tip --------------------------------------
                    const _ProTip(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// A frosted-glass container with a 32px corner radius.
class _FrostedCard extends StatelessWidget {
  final Widget child;

  const _FrostedCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: AppColors.surfaceWhite50, // white @ 50%
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: AppColors.borderWhite40, width: 1),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadowBlack8, // black @ 8%
                blurRadius: 28,
                offset: Offset(0, 14),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

/// A single selectable option (Event or Community) with a "Create" action.
class _CreateOptionCard extends StatelessWidget {
  final IconData icon;
  final Color accent;
  final String title;
  final String description;
  final String routeName;

  const _CreateOptionCard({
    required this.icon,
    required this.accent,
    required this.title,
    required this.description,
    required this.routeName,
  });

  void _navigate(BuildContext context) => Navigator.pushNamed(context, routeName);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => _navigate(context),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surfaceWhite80, // white @ 80%
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.borderBlack10), // black @ 10%
          ),
          child: Row(
            children: [
              // Icon badge
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.surfaceIconBadge,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: Icon(icon, color: accent, size: 26),
              ),
              const SizedBox(width: 14),

              // Title + description
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 13,
                        height: 1.35,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),

              // Create action
              _CreateButton(
                accent: accent,
                onPressed: () => _navigate(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Compact "Create" pill button used inside an option card.
class _CreateButton extends StatelessWidget {
  final Color accent;
  final VoidCallback onPressed;

  const _CreateButton({required this.accent, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: accent,
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Create',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
              SizedBox(width: 4),
              Icon(Icons.arrow_forward_rounded, color: AppColors.white, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}

/// Footer "Pro tip" callout.
class _ProTip extends StatelessWidget {
  const _ProTip();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.shadowAmber8, // amber @ 8%
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderAmber20), // amber @ 20%
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.lightbulb_outline_rounded,
            color: AppColors.iconAmber,
            size: 22,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Pro tip',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textAmber,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Communities keep conversations going, while events are perfect for one-time meetups.',
                  style: TextStyle(
                    fontSize: 12.5,
                    height: 1.4,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
