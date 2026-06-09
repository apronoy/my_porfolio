import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/theme/app_color.dart';


class AppTextStyles {

  static final heroTitle =
      GoogleFonts.montserrat(
    fontSize: 58,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static final heroSubtitle =
      GoogleFonts.montserrat(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.accent,
  );

  static final body =
      GoogleFonts.montserrat(
    fontSize: 18,
    color: AppColors.grey,
    height: 1.8,
  );

  static final sectionTitle =
      GoogleFonts.montserrat(
    fontSize: 42,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
}