import 'package:better_one/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.coolPrimary,

    brightness: Brightness.light,
    // scaffoldBackgroundColor: AppColors.coolSecondary.withOpacity(0.9),
    fontFamily: 'Grandstander', // Grandstander,Tajawal
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.coolPrimary,
    ),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: AppColors.coolSecondary),
    textTheme: textTheme(),
  );

  static TextTheme textTheme() {
    return const TextTheme(
      titleLarge: TextStyle(
        color: AppColors.coolPrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: AppColors.coolPrimary,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        color: AppColors.warmSecondary,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        height: 1.2,
      ),
      bodySmall: TextStyle(
        color: AppColors.warmSecondary,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        height: 1.2,
      ),
    );
  }

  static ThemeData darkTheme = ThemeData.dark();
}
