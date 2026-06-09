import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_color.dart';


class AppTheme {

  static ThemeData darkTheme() {
    return ThemeData(
      scaffoldBackgroundColor:
          AppColors.background,

      useMaterial3: true,
    );
  }
}