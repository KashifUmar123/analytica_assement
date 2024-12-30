import 'package:analytica_assement/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension EContextExtension on BuildContext {
  // media query heigh and width
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  // safe areas
  double get topSafeArea => MediaQuery.of(this).padding.top;
  double get bottomSafeArea => MediaQuery.of(this).padding.bottom;

  // fonts
  TextStyle get label14400 => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.blue,
      );
  TextStyle get label16400 => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.blue,
      );
  TextStyle get label22400 => GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: AppColors.blue,
      );
  TextStyle get label30400 => GoogleFonts.poppins(
        fontSize: 30,
        fontWeight: FontWeight.w400,
        color: AppColors.blue,
      );
}
