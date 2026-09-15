import 'package:flame/components.dart';

import '../components/components.dart';
import '../config/config.dart';

class PlayerMovementController {
  PlayerMovementController({
    required MageComponent player,
    required Vector2 Function() worldSize,
  })  : _player = player,
        _worldSize = worldSize;

  final MageComponent _player;
  final Vector2 Function() _worldSize;

  void moveUp() => move(Vector2(0, -GameTuning.playerMoveStep));
  void moveDown() => move(Vector2(0, GameTuning.playerMoveStep));
  void moveLeft() => move(Vector2(-GameTuning.playerMoveStep, 0));
  void moveRight() => move(Vector2(GameTuning.playerMoveStep, 0));

  void move(Vector2 delta) {
    final next = _player.position + delta;
    final size = _worldSize();

    _player.position = Vector2(
      next.x
          .clamp(
            GameTuning.playerWorldMargin,
            size.x - GameTuning.playerWorldMargin,
          )
          .toDouble(),
      next.y
          .clamp(
            GameTuning.playerWorldMargin,
            size.y - GameTuning.playerWorldMargin,
          )
          .toDouble(),
    );
  }
}
