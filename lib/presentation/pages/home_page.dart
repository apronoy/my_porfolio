import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/section_key.dart';
import 'package:portfolio/presentation/sections/about_section.dart';
import 'package:portfolio/presentation/sections/contact_section.dart';
import 'package:portfolio/presentation/sections/projects_section.dart';
import 'package:portfolio/presentation/sections/skills_section.dart';
import 'package:portfolio/presentation/widgets/custom_navbar.dart';
import '../sections/hero_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(key: SectionKeys.heroKey, child: const HeroSection()),

                Container(
                  key: SectionKeys.aboutKey,
                  child: const AboutSection(),
                ),

                Container(
                  key: SectionKeys.skillsKey,
                  child: const SkillsSection(),
                ),

                Container(
                  key: SectionKeys.projectsKey,
                  child: const ProjectsSection(),
                ),

                Container(
                  key: SectionKeys.contactKey,
                  child: const ContactSection(),
                ),
              ],
            ),
          ),
          const Positioned(top: 0, left: 0, right: 0, child: CustomNavbar()),
        ],
      ),
    );
  }
}
