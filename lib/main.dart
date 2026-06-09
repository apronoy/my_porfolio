import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/theme/app_color.dart';
import 'package:portfolio/presentation/pages/home_page.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      home: const HomePage(),
      theme: ThemeData(
        scaffoldBackgroundColor:
          AppColors.background,
        textTheme: GoogleFonts.montserratTextTheme(),
        useMaterial3: true,
      ),
    );
  }
}
