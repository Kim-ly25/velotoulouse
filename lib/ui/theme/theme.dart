import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFFFF6A00); // orange
  static const background = Color(0xFFF5F5F5);
  static const surface = Colors.white;

  static const textPrimary = Color(0xFF222222);
  static const textSecondary = Color(0xFF757575);

  static const border = Color(0xFFE0E0E0);
  static const success = Color(0xFF4CAF50);
}

class AppTextStyles {
  static const title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const subtitle = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );

  static const button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const price = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
}
