import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w800,
    letterSpacing: 2,
  );

  static const TextStyle label = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle titleFor(Brightness brightness) {
    return title.copyWith(
      color: brightness == Brightness.dark
          ? AppColors.textPrimaryDark
          : AppColors.textPrimaryLight,
    );
  }

  static TextStyle labelFor(Brightness brightness) {
    return label.copyWith(
      color: brightness == Brightness.dark
          ? AppColors.textSecondaryDark
          : AppColors.textSecondaryLight,
    );
  }
}
