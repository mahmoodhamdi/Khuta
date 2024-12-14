import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_strings.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primaryLight,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      fontFamily: AppStrings.fontFamily,
      brightness: Brightness.light,

      // Text Theme
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryLight,
        ),
        displayMedium: TextStyle(
          fontSize: 28.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryLight,
        ),
        displaySmall: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryLight,
        ),
        headlineMedium: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryLight,
        ),
        headlineSmall: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryLight,
        ),
        titleLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryLight,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.textSecondaryLight,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.textSecondaryLight,
        ),
        bodySmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.textSecondaryLight,
        ),
      ),

      // Color Scheme
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryLight,
        secondary: AppColors.secondaryLight,
        surface: AppColors.surfaceLight,
        error: AppColors.errorLight,
      ),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryLight,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: AppStrings.fontFamily,
        ),
      ),

      // Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryLight,
          foregroundColor: Colors.white,
          elevation: 0,
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            fontFamily: AppStrings.fontFamily,
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: AppColors.borderLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: AppColors.borderLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: AppColors.primaryLight, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: AppColors.errorLight),
        ),
        labelStyle: TextStyle(
          color: AppColors.textSecondaryLight,
          fontSize: 14.sp,
          fontFamily: AppStrings.fontFamily,
        ),
        hintStyle: TextStyle(
          color: AppColors.textSecondaryLight,
          fontSize: 14.sp,
          fontFamily: AppStrings.fontFamily,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: AppColors.primaryDark,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      fontFamily: AppStrings.fontFamily,
      brightness: Brightness.dark,

      // Text Theme
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryDark,
        ),
        displayMedium: TextStyle(
          fontSize: 28.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryDark,
        ),
        displaySmall: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryDark,
        ),
        headlineMedium: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryDark,
        ),
        headlineSmall: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryDark,
        ),
        titleLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryDark,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.textSecondaryDark,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.textSecondaryDark,
        ),
        bodySmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.textSecondaryDark,
        ),
      ),

      // Color Scheme
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryDark,
        secondary: AppColors.secondaryDark,
        surface: AppColors.surfaceDark,
        error: AppColors.errorDark,
      ),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryDark,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryDark,
          fontFamily: AppStrings.fontFamily,
        ),
      ),

      // Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryDark,
          foregroundColor: AppColors.textPrimaryDark,
          elevation: 0,
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            fontFamily: AppStrings.fontFamily,
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceDark,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: AppColors.borderDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: AppColors.borderDark),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: AppColors.primaryDark, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: AppColors.errorDark),
        ),
        labelStyle: TextStyle(
          color: AppColors.textSecondaryDark,
          fontSize: 14.sp,
          fontFamily: AppStrings.fontFamily,
        ),
        hintStyle: TextStyle(
          color: AppColors.textSecondaryDark,
          fontSize: 14.sp,
          fontFamily: AppStrings.fontFamily,
        ),
      ),
    );
  }
}
