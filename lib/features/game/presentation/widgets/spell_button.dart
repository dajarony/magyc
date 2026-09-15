import 'package:flutter/material.dart';

import '../../../../core/design_system/design_system.dart';

class SpellButton extends StatelessWidget {
  const SpellButton({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(AppSpacing.spellButtonPadding),
      ),
      child: const Icon(
        Icons.auto_fix_high,
        size: AppTokens.spellIconSize,
      ),
    );
  }
}
