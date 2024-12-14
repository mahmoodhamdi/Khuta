import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'text_styles.dart';

class UIUtils {
  // Spacing constants
  static final double xs = 4.w;
  static final double sm = 8.w;
  static final double md = 16.w;
  static final double lg = 24.w;
  static final double xl = 32.w;

  // Common button styles
  static ButtonStyle primaryButton({
    Color? backgroundColor,
    Color? foregroundColor,
    double? elevation,
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? AppColors.primaryLight,
      foregroundColor: foregroundColor ?? AppColors.textPrimaryDark,
      elevation: elevation ?? 2,
      padding: EdgeInsets.symmetric(
        horizontal: md,
        vertical: sm,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      textStyle: TextStyles.buttonMedium,
    );
  }

  static ButtonStyle secondaryButton({
    Color? backgroundColor,
    Color? foregroundColor,
    double? elevation,
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? AppColors.secondaryLight,
      foregroundColor: foregroundColor ?? AppColors.textPrimaryDark,
      elevation: elevation ?? 1,
      padding: EdgeInsets.symmetric(
        horizontal: md,
        vertical: sm,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      textStyle: TextStyles.buttonMedium,
    );
  }

  // Common card styles
  static BoxDecoration cardDecoration({
    Color? backgroundColor,
    double? elevation,
    BorderRadius? borderRadius,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? AppColors.surfaceLight,
      borderRadius: borderRadius ?? BorderRadius.circular(16.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: elevation ?? 4,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  // Common input decoration
  static InputDecoration inputDecoration({
    String? labelText,
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? errorText,
  }) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      errorText: errorText,
      filled: true,
      fillColor: AppColors.surfaceLight,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(
          color: AppColors.borderLight,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(
          color: AppColors.borderLight,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(
          color: AppColors.primaryLight,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(
          color: AppColors.errorLight,
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(
          color: AppColors.errorLight,
          width: 2,
        ),
      ),
    );
  }

  // Loading overlay
  static Widget loadingOverlay({
    required Widget child,
    required bool isLoading,
    Color? barrierColor,
  }) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: barrierColor ?? Colors.black.withOpacity(0.3),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }

  // Spacing widgets
  static SizedBox get verticalSpaceXS => SizedBox(height: xs);
  static SizedBox get verticalSpaceSM => SizedBox(height: sm);
  static SizedBox get verticalSpaceMD => SizedBox(height: md);
  static SizedBox get verticalSpaceLG => SizedBox(height: lg);
  static SizedBox get verticalSpaceXL => SizedBox(height: xl);

  static SizedBox get horizontalSpaceXS => SizedBox(width: xs);
  static SizedBox get horizontalSpaceSM => SizedBox(width: sm);
  static SizedBox get horizontalSpaceMD => SizedBox(width: md);
  static SizedBox get horizontalSpaceLG => SizedBox(width: lg);
  static SizedBox get horizontalSpaceXL => SizedBox(width: xl);
}
