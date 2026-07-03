import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/view/screens/comunity/widget/creation_option_card.dart';

import '../create_event_post/create_event_post.dart';

class CreateEventCommunityPage extends StatelessWidget {
  const CreateEventCommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black87,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Text(
          'Create Event or Community',
          style: TextStyle(
            color: Colors.black87,
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
                  color: Color(0xFFF3E8FF),
                ),
                child: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFFEC4899), Color(0xFFA855F7)],
                  ).createShader(bounds),
                  child: SvgPicture.asset(
                    'assets/logo/star.svg',
                    width: 32,
                    height: 32,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
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
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Choose the type of vibe you want to share',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),

              const SizedBox(height: 24),

              // Event card
              CreationOptionCard(
                gradientColors: const [Color(0xFFF472B6), Color(0xFFC084FC)],
                icon: Icons.calendar_today_outlined,
                title: 'Event',
                description:
                    'Organize gatherings, meetups, or special occasions that bring people together',
                borderColor: const Color(0xFFC084FC),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreatePostPage()),
                  );
                },
              ),

              const SizedBox(height: 16),

              // Community card
              CreationOptionCard(
                gradientColors: const [Color(0xFF67E8F9), Color(0xFF60A5FA)],
                icon: Icons.people_outline,
                title: 'Community',
                description:
                    'Build a space where people with shared interests can connect and grow together',
                onTap: () {},
              ),

              const SizedBox(height: 20),

              // Pro tip box
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDF2F8),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFF3D9EE)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: Color(0xFFC026D3),
                      size: 18,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 13,
                            height: 1.4,
                            color: Colors.black87,
                          ),
                          children: [
                            TextSpan(
                              text: 'Pro tip:\n',
                              style: TextStyle(
                                color: Color(0xFFC026D3),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'Communities are for long-term connections, Events are for specific occasions, and Vibes are for capturing fleeting moments.',
                              style: TextStyle(color: Colors.black54),
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
