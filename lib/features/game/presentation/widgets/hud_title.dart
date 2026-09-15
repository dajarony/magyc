import 'package:flutter/material.dart';

import '../../../../core/design_system/design_system.dart';

class HudTitle extends StatelessWidget {
  const HudTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.surfaceOverlayDark
            : AppColors.surfaceLight.withValues(alpha: AppTokens.hudOverlayOpacity),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.hudHorizontal,
          vertical: AppSpacing.hudVertical,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('MAGYC', style: AppTextStyles.titleFor(brightness)),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Vertical slice 0.1',
              style: AppTextStyles.labelFor(brightness),
            ),
          ],
        ),
      ),
    );
  }
}
