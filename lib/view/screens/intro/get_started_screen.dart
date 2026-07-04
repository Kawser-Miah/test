import 'package:flutter/material.dart';
import 'package:test_project/config/theme/app_colors.dart';
import 'package:test_project/config/theme/app_gradient.dart';
import 'package:test_project/view/screens/auth/auth_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Spacer(flex: 2),

              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Connect with real people nearby",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                ),
              ),

              const SizedBox(height: 36),

              const FeatureTile(
                icon: Icons.location_on_outlined,
                title: "Discover vibes happening around you",
              ),

              const SizedBox(height: 16),

              const FeatureTile(
                icon: Icons.person_outline,
                title: "Make spontaneous real-life connections",
              ),

              const SizedBox(height: 16),

              const FeatureTile(
                icon: Icons.calendar_month_outlined,
                title: "Create your own events",
              ),

              const SizedBox(height: 16),

              const FeatureTile(
                icon: Icons.groups_outlined,
                title: "Create your own communitys",
              ),

              const SizedBox(height: 16),

              const FeatureTile(
                icon: Icons.shield_outlined,
                title: "Safe & privacy-first by design",
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 58,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: AppGradients.fab,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AuthScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.transparent,
                      shadowColor: AppColors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  ),
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

class FeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const FeatureTile({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.surfaceFeatureTile,
        borderRadius: BorderRadius.circular(36),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: const BoxDecoration(
              color: AppColors.surfaceIconCircle,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.iconFeature, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textFeatureTile,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
