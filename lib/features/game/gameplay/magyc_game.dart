import 'package:flame/components.dart';
import 'package:flame/game.dart';

import 'components/components.dart';
import 'controllers/controllers.dart';

class MagycGame extends FlameGame {
  late final MageComponent player;
  late final PlayerMovementController movement;
  late final SpellCastingController spells;

  bool isReady = false;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(IsometricGroundComponent(size: size));

    player = MageComponent(
      position: Vector2(size.x * 0.5, size.y * 0.58),
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

    isReady = true;
  }
}
