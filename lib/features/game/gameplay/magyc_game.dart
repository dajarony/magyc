import 'package:flame/components.dart';
import 'package:flame/game.dart';

import 'components/components.dart';
import 'config/config.dart';
import 'controllers/controllers.dart';

class MagycGame extends FlameGame {
  late final MageComponent player;
  late final PlayerMovementController movement;
  late final SpellCastingController spells;

  bool _isReady = false;

  bool get isReady => _isReady;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(IsometricGroundComponent(size: size));

    player = MageComponent(
      position: Vector2(
        size.x * GameTuning.playerSpawnXFactor,
        size.y * GameTuning.playerSpawnYFactor,
      ),
    );
    add(player);

    movement = PlayerMovementController(
      player: player,
      worldSize: () => size,
    );
    spells = SpellCastingController(
      world: this,
      player: player,
    );

    _isReady = true;
  }
}
