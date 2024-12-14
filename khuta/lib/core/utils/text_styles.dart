import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class TextStyles {
  // Headers
  static TextStyle get header1 => TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        height: 1.5,
      );

  static TextStyle get header2 => TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
        height: 1.5,
      );

  static TextStyle get header3 => TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        height: 1.5,
      );

  // Titles
  static TextStyle get title1 => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        height: 1.5,
      );

  static TextStyle get title2 => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        height: 1.5,
      );

  static TextStyle get title3 => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        height: 1.5,
      );

  // Body Text
  static TextStyle get body1 => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        height: 1.5,
      );

  static TextStyle get body2 => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        height: 1.5,
      );

  static TextStyle get body3 => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        height: 1.5,
      );

  // Button Text
  static TextStyle get buttonLarge => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        height: 1.5,
      );

  static TextStyle get buttonMedium => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        height: 1.5,
      );

  static TextStyle get buttonSmall => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        height: 1.5,
      );

  static TextStyle get button => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        height: 1.5,
        letterSpacing: 0.5,
      );

  // Caption
  static TextStyle get caption => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        height: 1.5,
        color: AppColors.textSecondaryLight,
      );

  // Helper Functions
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  static TextStyle withWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }

  static TextStyle withSize(TextStyle style, double size) {
    return style.copyWith(fontSize: size.sp);
  }
}
