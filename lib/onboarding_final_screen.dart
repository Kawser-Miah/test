import 'package:flutter/material.dart';
import 'package:test_project/view/screens/auth/auth_screen.dart';

class OnboardingFinalScreen extends StatelessWidget {
  const OnboardingFinalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    gradient: const LinearGradient(
                      colors: [Color(0xff5EC6FF), Color(0xff9658FF)],
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AuthScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
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
        color: const Color(0xffF5F7FB),
        borderRadius: BorderRadius.circular(36),
        border: Border.all(color: const Color(0xffECECEC)),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: const BoxDecoration(
              color: Color(0xffEDF4FF),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Color(0xff4AA7FF), size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff23233C),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
