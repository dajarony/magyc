import 'package:flutter/foundation.dart';

import '../gameplay/gameplay.dart';

class MagycGameViewModel extends ChangeNotifier {
  MagycGameViewModel({MagycGame? game}) : game = game ?? MagycGame();

  final MagycGame game;

  void moveUp() => game.movement.moveUp();
  void moveDown() => game.movement.moveDown();
  void moveLeft() => game.movement.moveLeft();
  void moveRight() => game.movement.moveRight();
  void castPrimarySpell() => game.spells.castPrimarySpell();
}
