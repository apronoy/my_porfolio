import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/responsive.dart';
import 'package:portfolio/core/theme/app_color.dart';
import 'package:portfolio/core/theme/app_text_style.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    final skills = [
      "Flutter",
      "Firebase",
      "REST API",
      "GetX",
      "Stripe",
      "RevenueCat",
      "Google Maps",
      "Git",
      "GitHub",
      "Play Store",
      "App Store",
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: isMobile ? 80 : 120,
      ),
      color: AppColors.background,
      child: Column(
        children: [
          Text(
            "My Skills",
            textAlign: TextAlign.center,
            style: AppTextStyles.sectionTitle.copyWith(
              fontSize: isMobile ? 32 : 42,
            ),
          ),

          const SizedBox(height: 60),

          Wrap(
            alignment: WrapAlignment.center,
            spacing: isMobile ? 12 : 20,
            runSpacing: isMobile ? 12 : 20,
            children: skills.map((skill) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 18 : 25,
                  vertical: isMobile ? 12 : 15,
                ),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: AppColors.accent.withOpacity(.2),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accent.withOpacity(.05),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Text(
                  skill,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isMobile ? 14 : 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 60),

          Container(
            width: double.infinity,
            constraints: const BoxConstraints(
              maxWidth: 1000,
            ),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.accent.withOpacity(.2),
              ),
            ),
            child: Column(
              children: [
                Text(
                  "Technologies I Work With",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.accent,
                    fontSize: isMobile ? 20 : 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  "I specialize in building cross-platform mobile applications using Flutter and modern backend services. My focus is creating scalable, maintainable, and production-ready applications with clean architecture and excellent user experience.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: isMobile ? 14 : 16,
                    height: 1.8,
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