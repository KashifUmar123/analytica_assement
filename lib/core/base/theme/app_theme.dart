import 'package:analytica_assement/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.black,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.blue,
        //for appbar color
        titleTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        elevation: 1,
        titleSpacing: 40,
        centerTitle: false,
      ),
      indicatorColor: AppColors.blue,
      // TODO: design according to the theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(),
      // TODO: design according to the theme
      outlinedButtonTheme: const OutlinedButtonThemeData(),
      // TODO: design according to the theme
      inputDecorationTheme: const InputDecorationTheme(),
    );
  }
}
