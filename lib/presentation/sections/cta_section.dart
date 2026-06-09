import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/responsive.dart';
import 'package:portfolio/core/theme/app_color.dart';
import 'package:portfolio/core/theme/app_text_style.dart';

class CtaSection extends StatelessWidget {
  const CtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: 120,
      ),
      color: AppColors.background,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 1200,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 25 : 60,
            vertical: isMobile ? 50 : 70,
          ),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppColors.accent.withOpacity(.2),
            ),
          ),
          child: Column(
            children: [
              Text(
                "Have A Project In Mind?",
                textAlign: TextAlign.center,
                style: AppTextStyles.sectionTitle.copyWith(
                  fontSize: isMobile ? 32 : 48,
                ),
              ),

              const SizedBox(height: 25),

              Text(
                "Let's discuss your idea and turn it into a professional mobile application.",
                textAlign: TextAlign.center,
                style: AppTextStyles.body,
              ),

              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  child: Text(
                    "Let's Talk",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}