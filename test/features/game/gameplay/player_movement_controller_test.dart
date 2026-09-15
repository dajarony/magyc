import 'package:flame/components.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magyc/features/game/gameplay/gameplay.dart';

void main() {
  group('PlayerMovementController', () {
    test('moves the player by the configured step', () {
      final player = MageComponent(position: Vector2(50, 50));
      final controller = PlayerMovementController(
        player: player,
        worldSize: () => Vector2(200, 200),
      );

      controller.moveRight();

      expect(player.position.x, 50 + GameTuning.playerMoveStep);
      expect(player.position.y, 50);
    });

    test('clamps the player inside the world margin', () {
      final player = MageComponent(position: Vector2(50, 50));
      final controller = PlayerMovementController(
        player: player,
        worldSize: () => Vector2(100, 100),
      );

      controller.moveRight();
      controller.moveRight();

      expect(player.position.x, 100 - GameTuning.playerWorldMargin);
    });
  });
}
