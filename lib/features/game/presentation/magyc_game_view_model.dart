import 'package:flutter/foundation.dart';

import '../gameplay/gameplay.dart';

class MagycGameViewModel extends ChangeNotifier {
  MagycGameViewModel({MagycGame? game}) : game = game ?? MagycGame();

  final MagycGame game;

  void moveUp() {
    if (game.isReady) game.movement.moveUp();
  }

  void moveDown() {
    if (game.isReady) game.movement.moveDown();
  }

  void moveLeft() {
    if (game.isReady) game.movement.moveLeft();
  }

  void moveRight() {
    if (game.isReady) game.movement.moveRight();
  }

  void castPrimarySpell() {
    if (game.isReady) game.spells.castPrimarySpell();
  }
}
