import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/constants/responsive.dart';
import 'package:portfolio/core/theme/app_color.dart';
import 'package:portfolio/core/theme/app_text_style.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await canLaunchUrl(uri)) return;

    if (kIsWeb) {
      await launchUrl(uri, webOnlyWindowName: '_blank');
    } else {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.secondaryBackground,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: 120,
      ),
      child: Column(
        children: [
          Text(
            "Let's Work Together ",
            textAlign: TextAlign.center,
            style: AppTextStyles.sectionTitle,
          ),

          const SizedBox(height: 20),

          Text(
            " Interested in working together ? Feel free to reach out.",
            textAlign: TextAlign.center,
            style: AppTextStyles.body,
          ),

          const SizedBox(height: 60),

          Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 1000),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.accent.withOpacity(.2)),
            ),
            child: isMobile
                ? Column(
                    children: [
                      _contactInfo(),
                      const SizedBox(height: 30),
                      _socialSection(context),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(child: _contactInfo()),
                      const SizedBox(width: 50),
                      Expanded(child: _socialSection(context)),
                    ],
                  ),
          ),

          const SizedBox(height: 20),

          Divider(color: Colors.white.withOpacity(.15)),

          const SizedBox(height: 20),

          const Text(
            "© 2026 Pronoy Sarkar. All Rights Reserved.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white54),
          ),
        ],
      ),
    );
  }

  Widget _contactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Contact Information",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 30),

        _infoTile(Icons.phone_outlined, "Phone", "+880 1846 624175"),
        const SizedBox(height: 20),
        _infoTile(Icons.email_outlined, "Email", "pronoysarkar1020@gmail.com"),

        const SizedBox(height: 20),

        _infoTile(Icons.location_on_outlined, "Location", "Bangladesh"),

        const SizedBox(height: 20),

        _infoTile(
          Icons.work_outline,
          "Availability",
          "Open for Freelance & Full-time",
        ),
      ],
    );
  }

  Widget _infoTile(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, color: AppColors.accent),

        const SizedBox(width: 15),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              Text(value, style: const TextStyle(color: Colors.white70)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _socialSection(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 15,
      runSpacing: 15,
      children: [
        SocialButton(
          icon: FontAwesomeIcons.github,
          label: "GitHub",
          onTap: () => _launchUrl("https://github.com/apronoy"),
        ),

        SocialButton(
          icon: FontAwesomeIcons.linkedin,
          label: "LinkedIn",
          onTap: () => _launchUrl("https://linkedin.com/in/yourprofile"),
        ),

        SocialButton(
          icon: FontAwesomeIcons.facebook,
          label: "Facebook",
          onTap: () => _launchUrl("https://facebook.com/yourprofile"),
        ),

        SocialButton(
          icon: FontAwesomeIcons.telegram,
          label: "Telegram",
          onTap: () => _launchUrl("https://t.me/yourusername"),
        ),

        SocialButton(
          icon: FontAwesomeIcons.whatsapp,
          label: "WhatsApp",
          onTap: () => _launchUrl("https://wa.me/01846624175"),
        ),

        SocialButton(
          icon: FontAwesomeIcons.envelope,
          label: "Email",
          onTap: () => _launchUrl("pronoysarkar1020@gmail.com"),
        ),
      ],
    );
  }
}

class SocialButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const SocialButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,

      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },

      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },

      child: GestureDetector(
        onTap: widget.onTap,

        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),

          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),

          decoration: BoxDecoration(
            color: isHovered
                ? AppColors.accent.withOpacity(.15)
                : AppColors.card,

            borderRadius: BorderRadius.circular(15),

            border: Border.all(color: AppColors.accent.withOpacity(.2)),
          ),

          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(widget.icon, color: AppColors.accent, size: 18),

              const SizedBox(width: 10),

              Text(
                widget.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
