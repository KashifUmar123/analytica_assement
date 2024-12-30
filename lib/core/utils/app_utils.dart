import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppUtils {
  static void showCustomSnackbar({
    required String title,
    required String message,
    Function(GetSnackBar)? onTap,
    Duration? duration,
    bool isError = false,
  }) {
    Get.snackbar(
      title,
      message,
      duration: duration ?? const Duration(seconds: 2),
      onTap: onTap,
      backgroundColor: isError ? Colors.red : Colors.green,
    );
  }
}
