import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constants/section_key.dart';

import '../../core/constants/responsive.dart';
import '../../core/theme/app_color.dart';
import '../../core/utils/scroll_helper.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          height: 90,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.isMobile(context) ? 20 : 80,
          ),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.15),
            border: Border(
              bottom: BorderSide(color: Colors.white.withOpacity(.05)),
            ),
          ),
          child: Responsive.isMobile(context)
              ? const _MobileNavbar()
              : const _DesktopNavbar(),
        ),
      ),
    );
  }
}

class _DesktopNavbar extends StatelessWidget {
  const _DesktopNavbar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Pronoy Sarkar",
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),

        const Spacer(),

        _NavItem(
          title: "Home",
          onTap: () {
            ScrollHelper.scrollTo(SectionKeys.heroKey);
          },
        ),

        _NavItem(
          title: "About",
          onTap: () {
            ScrollHelper.scrollTo(SectionKeys.aboutKey);
          },
        ),

        _NavItem(
          title: "Skills",
          onTap: () {
            ScrollHelper.scrollTo(SectionKeys.skillsKey);
          },
        ),

        _NavItem(
          title: "Projects",
          onTap: () {
            ScrollHelper.scrollTo(SectionKeys.projectsKey);
          },
        ),

        _NavItem(
          title: "Contact",
          onTap: () {
            ScrollHelper.scrollTo(SectionKeys.contactKey);
          },
        ),
      ],
    );
  }
}

class _MobileNavbar extends StatelessWidget {
  const _MobileNavbar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Pronoy Sarkar",
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        PopupMenuButton<String>(
          color: AppColors.secondaryBackground,
          icon: const Icon(Icons.menu, color: Colors.white),

          onSelected: (value) {
            switch (value) {
              case "Home":
                ScrollHelper.scrollTo(SectionKeys.heroKey);
                break;

              case "About":
                ScrollHelper.scrollTo(SectionKeys.aboutKey);
                break;

              case "Skills":
                ScrollHelper.scrollTo(SectionKeys.skillsKey);
                break;

              case "Projects":
                ScrollHelper.scrollTo(SectionKeys.projectsKey);
                break;

              case "Contact":
                ScrollHelper.scrollTo(SectionKeys.contactKey);
                break;
            }
          },

          itemBuilder: (context) => [
            PopupMenuItem(
              value: "Home",
              child: Text(
                "Home",
                style: GoogleFonts.montserrat(color: Colors.white),
              ),
            ),

            PopupMenuItem(
              value: "About",
              child: Text(
                "About",
                style: GoogleFonts.montserrat(color: Colors.white),
              ),
            ),

            PopupMenuItem(
              value: "Skills",
              child: Text(
                "Skills",
                style: GoogleFonts.montserrat(color: Colors.white),
              ),
            ),

            PopupMenuItem(
              value: "Projects",
              child: Text(
                "Projects",
                style: GoogleFonts.montserrat(color: Colors.white),
              ),
            ),

            PopupMenuItem(
              value: "Contact",
              child: Text(
                "Contact",
                style: GoogleFonts.montserrat(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _NavItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavItem({required this.title, required this.onTap});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
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

          margin: const EdgeInsets.only(left: 35),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: isHovered ? AppColors.accent : Colors.white,
                ),
              ),

              const SizedBox(height: 5),

              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: isHovered ? 25 : 0,
                color: AppColors.accent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
