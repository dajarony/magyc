import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../../../core/design_system/design_system.dart';
import '../gameplay/gameplay.dart';
import 'widgets/widgets.dart';

class MagycGameScreen extends StatefulWidget {
  const MagycGameScreen({super.key});

  @override
  State<MagycGameScreen> createState() => _MagycGameScreenState();
}

class _MagycGameScreenState extends State<MagycGameScreen> {
  late final MagycGame _game;

  @override
  void initState() {
    super.initState();
    _game = MagycGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: GameWidget(game: _game)),
          const Positioned(
            left: AppSpacing.screenInset,
            top: AppSpacing.screenInset,
            child: SafeArea(child: HudTitle()),
          ),
          Positioned(
            left: AppSpacing.screenInset,
            bottom: AppSpacing.screenInset,
            child: SafeArea(
              child: MovementPad(
                onUp: () => _game.movement.moveUp(),
                onDown: () => _game.movement.moveDown(),
                onLeft: () => _game.movement.moveLeft(),
                onRight: () => _game.movement.moveRight(),
              ),
            ),
          ),
          Positioned(
            right: AppSpacing.screenInset,
            bottom: AppSpacing.screenInset,
            child: SafeArea(
              child: SpellButton(
                onPressed: () => _game.spells.castPrimarySpell(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
