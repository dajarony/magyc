import 'package:flutter/material.dart';

import '../../../../core/design_system/design_system.dart';

class MoveButton extends StatelessWidget {
  const MoveButton({
    required this.icon,
    required this.onPressed,
    super.key,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseColor = isDark ? AppColors.surfaceDark : AppColors.surfaceLight;

    return Material(
      color: baseColor.withValues(alpha: AppTokens.controlOverlayOpacity),
      shape: const CircleBorder(),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: AppTokens.movementIconSize),
        tooltip: 'Mover',
      ),
    );
  }
}
