import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';
import 'text_styles.dart';

class AppDialog {
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmText,
    String? cancelText,
    bool barrierDismissible = true,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    DialogType type = DialogType.info,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: TextStyles.title1.copyWith(
            color: _getTitleColor(type),
          ),
        ),
        content: Text(
          message,
          style: TextStyles.body1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        backgroundColor: AppColors.surfaceLight,
        actions: [
          if (cancelText != null)
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onCancel?.call();
              },
              child: Text(
                cancelText,
                style: TextStyles.button.copyWith(
                  color: AppColors.textSecondaryLight,
                ),
              ),
            ),
          if (confirmText != null)
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onConfirm?.call();
              },
              child: Text(
                confirmText,
                style: TextStyles.button.copyWith(
                  color: _getButtonColor(type),
                ),
              ),
            ),
        ],
      ),
    );
  }

  static Future<void> showLoading(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: AppColors.surfaceLight,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }

  static Color _getTitleColor(DialogType type) {
    switch (type) {
      case DialogType.success:
        return Colors.green;
      case DialogType.error:
        return AppColors.errorLight;
      case DialogType.warning:
        return Colors.orange;
      case DialogType.info:
        return AppColors.primaryLight;
    }
  }

  static Color _getButtonColor(DialogType type) {
    switch (type) {
      case DialogType.success:
        return Colors.green;
      case DialogType.error:
        return AppColors.errorLight;
      case DialogType.warning:
        return Colors.orange;
      case DialogType.info:
        return AppColors.primaryLight;
    }
  }
}

enum DialogType {
  success,
  error,
  warning,
  info,
}
