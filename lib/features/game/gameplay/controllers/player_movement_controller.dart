import 'package:flame/components.dart';

import '../components/components.dart';

class PlayerMovementController {
  PlayerMovementController({
    required MageComponent player,
    required Vector2 Function() worldSize,
  })  : _player = player,
        _worldSize = worldSize;

  static const double _moveStep = 24;
  static const double _worldMargin = 28;

  final MageComponent _player;
  final Vector2 Function() _worldSize;

  void moveUp() => move(Vector2(0, -_moveStep));
  void moveDown() => move(Vector2(0, _moveStep));
  void moveLeft() => move(Vector2(-_moveStep, 0));
  void moveRight() => move(Vector2(_moveStep, 0));

  void move(Vector2 delta) {
    final next = _player.position + delta;
    final size = _worldSize();

    _player.position = Vector2(
      next.x.clamp(_worldMargin, size.x - _worldMargin).toDouble(),
      next.y.clamp(_worldMargin, size.y - _worldMargin).toDouble(),
    );
  }
}
