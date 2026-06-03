import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const String fontInter = 'Inter';
  static const String fontGeorgia = 'Georgia';
  
  static TextStyle heading(String font, {double size = 20, Color color = AppColors.textDark, FontWeight weight = FontWeight.bold}) {
    return TextStyle(
      fontFamily: font == 'Inter' ? fontInter : fontGeorgia,
      fontSize: size,
      fontWeight: weight,
      color: color,
    );
  }

  static TextStyle body(String font, {double size = 14, Color color = AppColors.textDark, FontWeight weight = FontWeight.normal, double height = 1.5}) {
    return TextStyle(
      fontFamily: font == 'Inter' ? fontInter : fontGeorgia,
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height,
    );
  }

  static TextStyle caption(String font, {double size = 11, Color color = AppColors.textLight, FontWeight weight = FontWeight.normal}) {
    return TextStyle(
      fontFamily: font == 'Inter' ? fontInter : fontGeorgia,
      fontSize: size,
      fontWeight: weight,
      color: color,
    );
  }
}
