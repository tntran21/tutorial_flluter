import 'package:flutter/material.dart';
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
      textTheme: const TextTheme(
        headlineLarge: AppStyles.heading1,
        headlineMedium: AppStyles.heading2,
        bodyLarge: AppStyles.bodyText,
        bodySmall: AppStyles.caption,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: AppStyles.primaryButton,
      ),
      useMaterial3: true,
    );
  }
}
