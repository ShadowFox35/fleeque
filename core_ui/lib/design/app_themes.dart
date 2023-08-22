import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      splashColor: AppColors.lightGrey,
      scaffoldBackgroundColor: AppColors.white,
      primaryColor: AppColors.white,
      iconTheme: const IconThemeData(
        color: AppColors.white,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: AppColors.black,
        ),
      ),
    );
  }
}
