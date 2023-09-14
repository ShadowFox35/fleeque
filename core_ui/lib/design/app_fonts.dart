import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppFonts {
  static TextStyle welcome = GoogleFonts.montserrat(
    fontSize: 25,
    fontWeight: FontWeight.w800,
  );

  static TextStyle title = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.w800,
  );

  static TextStyle titleWhite = GoogleFonts.montserrat(
    color: AppColors.white,
    fontSize: 24,
    fontWeight: FontWeight.w800,
  );

  static TextStyle regularText = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle singGoogleText = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle skipText = GoogleFonts.roboto(
    decoration: TextDecoration.underline,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle underlinedText = GoogleFonts.roboto(
    decoration: TextDecoration.underline,
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle authText = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w800,
  );

  static TextStyle authTexGray = GoogleFonts.roboto(
    decoration: TextDecoration.underline,
    color: AppColors.darkGrey,
    fontSize: 14,
    fontWeight: FontWeight.w800,
  );

  static TextStyle authTextRed = GoogleFonts.roboto(
    decoration: TextDecoration.underline,
    color: AppColors.red,
    fontSize: 14,
    fontWeight: FontWeight.w800,
  );

  static TextStyle buttonWhite = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static TextStyle buttonBlack = GoogleFonts.roboto(
    color: AppColors.white,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static TextStyle loginButton = GoogleFonts.roboto(
    color: AppColors.white,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static TextStyle rights = GoogleFonts.roboto(
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );
  static TextStyle homePopular = GoogleFonts.roboto(
    color: AppColors.white,
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );

  static TextStyle homeFollowers = GoogleFonts.roboto(
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );

  static TextStyle homeFollowerAmount = GoogleFonts.roboto(
    fontSize: 11,
    fontWeight: FontWeight.w700,
  );

  static TextStyle labelText = GoogleFonts.roboto(
    color: AppColors.black,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );

  static TextStyle labelTextWhite = GoogleFonts.roboto(
    color: AppColors.white,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );

  static TextStyle appBarText = GoogleFonts.roboto(
    color: AppColors.white,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );
}
