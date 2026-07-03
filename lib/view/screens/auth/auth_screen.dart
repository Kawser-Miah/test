import 'package:flutter/material.dart';
import 'package:test_project/view/screens/auth/widgets/notification_dialog.dart';
import 'package:test_project/view/screens/auth/widgets/social_login_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSignUp = false;

  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF5FB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 150),

              Text(
                isSignUp ? "Sign Up" : "Sign In",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff202124),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Create an Account",
                style: TextStyle(fontSize: 16, color: Color(0xff303030)),
              ),

              const Spacer(),

              const SizedBox(
                width: 310,
                child: Text(
                  "By signing up or creating an account, you agree to our Terms and Event. Learn more about how we process your data in our privacy and Cookies Policy",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff727272),
                    height: 1.6,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              SocialLoginButton(
                icon: Icons.facebook,
                title: "Facebook",
                iconColor: const Color(0xff1877F2),
                onPressed: () {
                  Future.delayed(const Duration(milliseconds: 500), () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) => const NotificationDialog(),
                    );
                  });
                },
              ),

              const SizedBox(height: 14),

              SocialLoginButton(
                icon: Icons.g_mobiledata,
                title: "Google",
                iconColor: Colors.red,
                onPressed: () {},
              ),

              const SizedBox(height: 14),

              SocialLoginButton(
                icon: Icons.apple,
                title: "Apple",
                iconColor: Colors.black,
                onPressed: () {},
              ),

              const SizedBox(height: 28),

              const Text(
                "Having trouble in sign in?",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),

              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}
