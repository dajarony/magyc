import 'package:flame/components.dart';

import '../components/components.dart';

class SpellCastingController {
  SpellCastingController({
    required Component world,
    required MageComponent player,
  })  : _world = world,
        _player = player;

  static final Vector2 _spawnOffset = Vector2(18, -8);
  static final Vector2 _defaultVelocity = Vector2(260, 0);

  final Component _world;
  final MageComponent _player;

  void castPrimarySpell() {
    _world.add(
      SpellOrbComponent(
        position: _player.position + _spawnOffset,
        velocity: _defaultVelocity.clone(),
      ),
    );
  }
}
