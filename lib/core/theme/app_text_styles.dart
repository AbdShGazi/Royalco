import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle heading1 = TextStyle(
    fontSize: 20,
    color: AppColors.primary,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 16,
    color: AppColors.textSecondary,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 14,
    color: AppColors.white,
  );

  static const TextStyle menuItem = TextStyle(
    fontSize: 14,
    color: Color(0xFF808080),
  );
} 