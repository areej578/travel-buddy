import 'package:flutter/material.dart';
import 'theme/colors.dart';
import 'InputScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _navigateToInputScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const InputScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // === Gradient Background ===
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.lilac,
                  AppColors.purple,
                  AppColors.softBlue,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // === Background Image (over gradient, slightly transparent) ===
          Opacity(
            opacity: 0.12, // Adjust for desired fade effect
            child: Image.asset(
              'assets/images/map.png', // Change path to your background image
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),

          // === Main Content ===
          SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // === Main Title ===
                  const Text(
                    'Time To Travel',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                      color: AppColors.deepText,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // === App Logo ===
                  Image.asset(
                    'assets/images/business-trip.png',
                    height: 180,
                    width: 180,
                  ),
                  const SizedBox(height: 32),

                  // === Text + Arrow Icon (Navigation) ===
                  GestureDetector(
                    onTap: () => _navigateToInputScreen(context),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Find Your Perfect Trip ',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: AppColors.deepText,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.deepText,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
