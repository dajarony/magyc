import 'package:flame/components.dart';

import '../components/components.dart';
import '../config/config.dart';

class SpellCastingController {
  SpellCastingController({
    required Component world,
    required MageComponent player,
  })  : _world = world,
        _player = player;

  final Component _world;
  final MageComponent _player;

  void castPrimarySpell() {
    _world.add(
      SpellOrbComponent(
        position: _player.position +
            Vector2(
              GameTuning.primarySpellSpawnOffsetX,
              GameTuning.primarySpellSpawnOffsetY,
            ),
        velocity: Vector2(
          GameTuning.primarySpellVelocityX,
          GameTuning.primarySpellVelocityY,
        ),
      ),
    );
  }
}
