import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

/// "Create Event or Community" selection screen.
/// Pixel-matched to the provided design (gradient cards, sparkle icon, pro tip).
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
              _CreationOptionCard(
                gradientColors: const [Color(0xFFF472B6), Color(0xFFC084FC)],
                icon: Icons.calendar_today_outlined,
                title: 'Event',
                description:
                    'Organize gatherings, meetups, or special occasions that bring people together',
                borderColor: const Color(0xFFC084FC),
                onTap: () {},
              ),

              const SizedBox(height: 16),

              // Community card
              _CreationOptionCard(
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

class _CreationOptionCard extends StatelessWidget {
  final List<Color> gradientColors;
  final IconData icon;
  final String title;
  final String description;
  final Color? borderColor;
  final VoidCallback onTap;

  const _CreationOptionCard({
    super.key,
    required this.gradientColors,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            // border: const GradientBoxBorder(
            //   width: 2.04,
            //   gradient: LinearGradient(
            //     begin: Alignment.topRight,
            //     end: Alignment.bottomLeft,
            //     colors: [
            //       Color.fromRGBO(134, 99, 246, 0.5),
            //       Color.fromRGBO(196, 112, 245, 0.5),
            //       Color.fromRGBO(87, 194, 255, 0.5),
            //     ],
            //     stops: [0.1164, 0.4874, 0.8704],
            //   ),
            // ),
            border: borderColor != null
                ? const GradientBoxBorder(
                    width: 2,
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromRGBO(134, 99, 246, 0.5),
                        Color.fromRGBO(196, 112, 245, 0.5),
                        Color.fromRGBO(87, 194, 255, 0.5),
                      ],
                      stops: [0.1164, 0.4874, 0.8704],
                    ),
                  )
                : Border.all(color: Colors.black12, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Gradient
              Container(
                width: double.infinity,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),

                  gradient: LinearGradient(
                    colors: gradientColors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                alignment: Alignment.center,
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.3),
                  ),
                  child: Icon(icon, size: 26, color: Colors.black87),
                ),
              ),

              // Bottom Content
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 13.5,
                        color: Colors.black54,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
