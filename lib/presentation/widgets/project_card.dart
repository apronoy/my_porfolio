import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/responsive.dart';
import 'package:portfolio/core/theme/app_color.dart';
import 'package:portfolio/data/model/project_model.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const ProjectCard({
    super.key,
    required this.project,
  });

  @override
  State<ProjectCard> createState() =>
      _ProjectCardState();
}

class _ProjectCardState
    extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile =
        Responsive.isMobile(context);

    return MouseRegion(
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

      child: AnimatedContainer(
        duration:
            const Duration(milliseconds: 250),

        transform:
            Matrix4.identity()
              ..scale(
                isHovered ? 1.02 : 1,
              ),

        decoration: BoxDecoration(
          color: AppColors.card,

          borderRadius:
              BorderRadius.circular(20),

          border: Border.all(
            color:
                AppColors.accent.withOpacity(
              .2,
            ),
          ),
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(
                top: Radius.circular(20),
              ),

              child: Image.asset(
                widget.project.image,
                width: double.infinity,
                height: isMobile ? 180 : 250,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.all(24),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.project.title,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    widget.project.description,
                    style: const TextStyle(
                      color:
                          Colors.white70,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Wrap(
                    spacing: 10,
                    children: widget
                        .project
                        .technologies
                        .map(
                          (e) => Chip(
                            label: Text(e),
                          ),
                        )
                        .toList(),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "View Project",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}