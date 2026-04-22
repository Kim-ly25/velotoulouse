import 'package:flutter/material.dart';


class AppColors {
  // Brand
  static const Color primary      = Color(0xFFE8580A); // orange
  static const Color primaryLight = Color(0xFFFFF3EC);

  // Neutrals
  static const Color textDark     = Color(0xFF1A1A1A);
  static const Color textMedium   = Color(0xFF555555);
  static const Color textLight    = Color(0xFF888888);
  static const Color background   = Color(0xFFF7F7F7);
  static const Color surface      = Colors.white;
  static const Color divider      = Color(0xFFE0E0E0);

  // Status
  static const Color success      = Color(0xFF4CAF50);
  static const Color error        = Color(0xFFE53935);
}
class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );

  static const TextStyle subheading = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textMedium,
  );

  static const TextStyle label = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textLight,
  );

  static const TextStyle priceLarge = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}

ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.background,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.surface,
    foregroundColor: AppColors.textDark,
    elevation: 0,
    centerTitle: true,
  ),
);
