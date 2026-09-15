import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../../../core/design_system/design_system.dart';
import 'magyc_game_view_model.dart';
import 'widgets/widgets.dart';

class MagycGameScreen extends StatefulWidget {
  const MagycGameScreen({super.key});

  @override
  State<MagycGameScreen> createState() => _MagycGameScreenState();
}

class _MagycGameScreenState extends State<MagycGameScreen> {
  late final MagycGameViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = MagycGameViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: GameWidget(game: _viewModel.game)),
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
                onUp: _viewModel.moveUp,
                onDown: _viewModel.moveDown,
                onLeft: _viewModel.moveLeft,
                onRight: _viewModel.moveRight,
              ),
            ),
          ),
          Positioned(
            right: AppSpacing.screenInset,
            bottom: AppSpacing.screenInset,
            child: SafeArea(
              child: SpellButton(onPressed: _viewModel.castPrimarySpell),
            ),
          ),
        ],
      ),
    );
  }
}
