import 'package:flutter/material.dart';

import '../../../../core/design_system/design_system.dart';
import 'move_button.dart';

class MovementPad extends StatelessWidget {
  const MovementPad({
    required this.onUp,
    required this.onDown,
    required this.onLeft,
    required this.onRight,
    super.key,
  });

  final VoidCallback onUp;
  final VoidCallback onDown;
  final VoidCallback onLeft;
  final VoidCallback onRight;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: AppTokens.movementPadExtent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: MoveButton(
              icon: Icons.keyboard_arrow_up,
              onPressed: onUp,
            ),
          ),
          Positioned(
            bottom: 0,
            child: MoveButton(
              icon: Icons.keyboard_arrow_down,
              onPressed: onDown,
            ),
          ),
          Positioned(
            left: 0,
            child: MoveButton(
              icon: Icons.keyboard_arrow_left,
              onPressed: onLeft,
            ),
          ),
          Positioned(
            right: 0,
            child: MoveButton(
              icon: Icons.keyboard_arrow_right,
              onPressed: onRight,
            ),
          ),
        ],
      ),
    );
  }
}
