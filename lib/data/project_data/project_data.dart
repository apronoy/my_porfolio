import 'package:portfolio/data/model/project_model.dart';

class ProjectData {
  static const projects = [
    ProjectModel(
      title: "E-Commerce App",
      description:
          "A complete e-commerce application with authentication, payment integration and product management.",

      image: "assets/images/intropage.jpg",

      technologies: ["Flutter", "Firebase", "Stripe"],

      githubUrl: "https://github.com/apronoy",
    ),

    ProjectModel(
      title: "Food Delivery App",
      description:
          "Modern food ordering application with cart, payments and realtime updates.",

      image: "assets/images/intropage.jpg",

      technologies: ["Flutter", "REST API", "GetX"],

      githubUrl: "https://github.com/apronoy",
    ),
  ];
}
