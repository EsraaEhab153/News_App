import 'package:flutter/material.dart';
import 'package:news_app/style/app_colors.dart';

class MyThemeData {
  static final ThemeData lightModeStyle = ThemeData(
    appBarTheme: const AppBarTheme(
      color: AppColors.primaryColor,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 26,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 23,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
