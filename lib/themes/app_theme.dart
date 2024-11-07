import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.backgroundLight,
    scaffoldBackgroundColor: AppColors.backgroundPrimary,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundPrimary,
    ),
    colorScheme: const ColorScheme.light(
      secondary: AppColors.accentGreen,
      onSecondary: Colors.black,
      surface: AppColors.backgroundLight,
      error: Colors.redAccent,
      onError: Colors.white,
      primaryContainer: AppColors.highlightPurple,
      onPrimaryContainer: Colors.white,
      secondaryContainer: AppColors.bottomNavBackground,
      onSecondaryContainer: Colors.black54,
      inversePrimary: AppColors.iconPrimary,
    ),
    textTheme: AppTextStyles.textTheme,
    iconTheme: const IconThemeData(color: AppColors.iconPrimary),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.bottomNavBackground,
      selectedItemColor: AppColors.iconPrimary,
    ),
    cardColor: AppColors.highlightPurple,
    fontFamily: 'Roboto',
    splashColor: AppColors.accentGreen,
    highlightColor: AppColors.accentGreen,
    hoverColor: Colors.amber
  );
}
