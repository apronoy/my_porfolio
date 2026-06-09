import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/responsive.dart';
import 'package:portfolio/core/theme/app_color.dart';
import 'package:portfolio/core/theme/app_text_style.dart';
import 'package:portfolio/data/project_data/project_data.dart';
import '../widgets/project_card.dart';

class ProjectsSection
    extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile =
        Responsive.isMobile(context);

    return Container(
      width: double.infinity,

      color:
          AppColors.secondaryBackground,

      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: 120,
      ),

      child: Column(
        children: [
          Text(
            "Featured Projects",
            style:
                AppTextStyles.sectionTitle,
          ),

          const SizedBox(height: 60),

          GridView.builder(
            shrinkWrap: true,

            physics:
                const NeverScrollableScrollPhysics(),

            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  isMobile ? 1 : 2,

              crossAxisSpacing: 30,
              mainAxisSpacing: 30,

              childAspectRatio:
                  isMobile ? .9 : .95,
            ),

            itemCount:
                ProjectData.projects.length,

            itemBuilder:
                (context, index) {
              return ProjectCard(
                project:
                    ProjectData.projects[index],
              );
            },
          ),
        ],
      ),
    );
  }
}