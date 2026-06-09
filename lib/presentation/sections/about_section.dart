import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/responsive.dart';
import 'package:portfolio/core/theme/app_color.dart';
import 'package:portfolio/core/theme/app_text_style.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,

      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: isMobile ? 80 : 120,
      ),

      color: AppColors.secondaryBackground,

      child: Column(
        children: [
          Text(
            "About Me",
            textAlign: TextAlign.center,
            style: AppTextStyles.sectionTitle.copyWith(
              fontSize: isMobile ? 32 : 42,
            ),
          ),

          const SizedBox(height: 30),

          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: isMobile ? 500 : 900),

            child: Text(
              "I build scalable, production-ready mobile applications that deliver seamless user experiences and business value. My expertise spans Flutter development, Firebase services, REST API integration, Stripe payment processing, RevenueCat subscription management, Google Maps and location-based services, and Google Mobile Ads monetization. I have practical experience managing the complete app lifecycle, from architecture and development to deployment, publishing, and maintenance on both the Apple App Store and Google Play Store.",
              textAlign: TextAlign.center,
              style: AppTextStyles.body.copyWith(fontSize: isMobile ? 16 : 18),
            ),
          ),

          const SizedBox(height: 70),

          isMobile
              ? const Column(
                  children: [
                    _InfoCard(title: "1.5+", subtitle: "Months Experience"),

                    SizedBox(height: 20),

                    _InfoCard(
                      title: "10+",
                      subtitle: "Projects Built and Deployed",
                    ),

                    SizedBox(height: 20),

                    _InfoCard(title: "12+", subtitle: "Technologies"),
                  ],
                )
              : const Row(
                  children: [
                    Expanded(
                      child: _InfoCard(
                        title: "1.5+",
                        subtitle: "Months Experience",
                      ),
                    ),

                    SizedBox(width: 25),

                    Expanded(
                      child: _InfoCard(
                        title: "10+",
                        subtitle: "Projects Built and Deployed",
                      ),
                    ),

                    SizedBox(width: 25),

                    Expanded(
                      child: _InfoCard(
                        title: "12+",
                        subtitle: "Technologies Knowledge",
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const _InfoCard({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,

      height: isMobile ? 150 : 180,

      decoration: BoxDecoration(
        color: AppColors.card,

        borderRadius: BorderRadius.circular(20),

        border: Border.all(color: AppColors.accent.withOpacity(.2)),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 34 : 42,
              fontWeight: FontWeight.bold,
              color: AppColors.accent,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: isMobile ? 14 : 16,
            ),
          ),
        ],
      ),
    );
  }
}
