import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_styles.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        secondary: AppColors.secondary,
      ),
      scaffoldBackgroundColor: AppColors.quaternary,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.quinary,
        elevation: 0,
        titleTextStyle: AppStyles.heading2,
      ),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.redHatDisplay(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.tertiary,
        ),
        headlineMedium: GoogleFonts.redHatDisplay(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.tertiary,
        ),
        bodyLarge: GoogleFonts.redHatDisplay(
          fontSize: 16,
          color: AppColors.tertiary,
        ),
        bodyMedium: GoogleFonts.redHatDisplay(
          fontSize: 14,
          color: AppColors.tertiary,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: AppStyles.primaryButton,
      ),
      useMaterial3: true,
    );
  }
}
