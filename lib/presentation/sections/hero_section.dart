import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/responsive.dart';
import 'package:portfolio/core/constants/section_key.dart';
import 'package:portfolio/core/theme/app_color.dart';
import 'package:portfolio/core/theme/app_text_style.dart';
import 'package:portfolio/core/utils/scroll_helper.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF071B2E), Color(0xFF0A2238)],
        ),
      ),
      child: Responsive.isMobile(context)
          ? _mobileLayout(context)
          : _desktopLayout(context),
    );
  }

  Widget _desktopLayout(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Row(
          children: [
            Expanded(child: _heroContent(context)),
            Expanded(child: _heroImage()),
          ],
        ),
      ),
    );
  }

  Widget _mobileLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: Column(
        children: [
          const SizedBox(height: 50),

          _heroImage(size: 250),

          const SizedBox(height: 40),

          _heroContent(context, mobile: true),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _heroContent(BuildContext context, {bool mobile = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: mobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          "Hi, I'm Pronoy Sarkar",
          textAlign: mobile ? TextAlign.center : TextAlign.left,
          style: AppTextStyles.heroTitle.copyWith(fontSize: mobile ? 36 : 58),
        ),

        const SizedBox(height: 15),

        Text(
          "Jr. Flutter Developer",
          textAlign: mobile ? TextAlign.center : TextAlign.left,
          style: AppTextStyles.heroSubtitle.copyWith(
            fontSize: mobile ? 22 : 28,
          ),
        ),

        const SizedBox(height: 25),

        SizedBox(
          width: mobile ? double.infinity : 600,
          child: Text(
            "Flutter Developer with 1.5+ years of experience turning ideas into high-quality mobile applications. Passionate about building scalable, user-focused products that deliver seamless experiences across Android and iOS.",
            textAlign: mobile ? TextAlign.center : TextAlign.left,
            style: AppTextStyles.body,
          ),
        ),

        const SizedBox(height: 40),

        mobile
            ? Column(
                children: [
                  SizedBox(
                    width: 220,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        ScrollHelper.scrollTo(SectionKeys.projectsKey);
                      },
                      child: const Text("View Projects"),
                    ),
                  ),

                  const SizedBox(height: 15),

                  SizedBox(
                    width: 220,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: () {
                        ScrollHelper.scrollTo(SectionKeys.contactKey);
                      },
                      child: const Text("Contact Me"),
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        ScrollHelper.scrollTo(SectionKeys.projectsKey);
                      },
                      child: const Text("View Projects"),
                    ),
                  ),

                  const SizedBox(width: 20),

                  SizedBox(
                    height: 50,
                    child: OutlinedButton(
                      onPressed: () {
                        ScrollHelper.scrollTo(SectionKeys.contactKey);
                      },
                      child: const Text("Contact Me"),
                    ),
                  ),
                ],
              ),
      ],
    );
  }

  Widget _heroImage({double size = 420}) {
    return Center(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,

          border: Border.all(color: AppColors.accent, width: 4),

          image: const DecorationImage(
            image: AssetImage("assets/images/pic_for_portfolio.PNG"),
            fit: BoxFit.cover,
          ),

          boxShadow: [
            BoxShadow(
              color: AppColors.accent.withValues(alpha: 0.35),
              blurRadius: 100,
              spreadRadius: 10,
            ),
          ],
        ),
      ),
    );
  }
}
