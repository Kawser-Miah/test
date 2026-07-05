import 'package:flutter/material.dart';
import 'package:test_project/config/theme/app_colors.dart';
import 'package:test_project/config/theme/app_gradient.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/view/screens/community_and_event/widgets/creation_option_card.dart';
import 'package:test_project/view/screens/community_home/community_home.dart';

import '../event_post/create_post_screen.dart';

class CommunitySelectionScreen extends StatelessWidget {
  const CommunitySelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.textBlackPrimary,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Text(
          'Create Event or Community',
          style: TextStyle(
            color: AppColors.textBlackPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8),

              // Top sparkle icon
              Container(
                width: 72,
                height: 72,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.surfaceSparkle,
                ),
                child: ShaderMask(
                  shaderCallback: (bounds) =>
                      AppGradients.event.createShader(bounds),
                  child: SvgPicture.asset(
                    'assets/logo/star.svg',
                    width: 32,
                    height: 32,
                    colorFilter: const ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'What do you want to create?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textBlackPrimary,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Choose the type of vibe you want to share',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textBlackSecondary,
                ),
              ),

              const SizedBox(height: 24),

              // Event card
              CreationOptionCard(
                gradient: AppGradients.eventLight,
                icon: Icons.calendar_today_outlined,
                title: 'Event',
                description:
                    'Organize gatherings, meetups, or special occasions that bring people together',
                borderColor: AppColors.gradientEventLightPurple,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreatePostScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 16),

              // Community card
              CreationOptionCard(
                gradient: AppGradients.community,
                icon: Icons.people_outline,
                title: 'Community',
                description:
                    'Build a space where people with shared interests can connect and grow together',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CommunityPostScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              // Pro tip box
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.surfaceProTip,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.borderProTip),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: AppColors.iconInfo,
                      size: 18,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 13,
                            height: 1.4,
                            color: AppColors.textBlackPrimary,
                          ),
                          children: [
                            TextSpan(
                              text: 'Pro tip:\n',
                              style: TextStyle(
                                color: AppColors.iconInfo,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'Communities are for long-term connections, Events are for specific occasions, and Vibes are for capturing fleeting moments.',
                              style: TextStyle(
                                color: AppColors.textBlackSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
