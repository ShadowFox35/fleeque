import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      primaryColor: AppColors.white,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: AppColors.black,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.black),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.pink),
        ),
      ),
    );
  }
}
