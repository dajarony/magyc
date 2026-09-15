import 'package:flutter_test/flutter_test.dart';
import 'package:magyc/features/game/gameplay/gameplay.dart';

void main() {
  group('GameTuning', () {
    test('keeps isometric tiles in a 2:1 ratio', () {
      expect(GameTuning.tileWidth, GameTuning.tileHeight * 2);
    });

    test('keeps player spawn factors normalized', () {
      expect(GameTuning.playerSpawnXFactor, inInclusiveRange(0, 1));
      expect(GameTuning.playerSpawnYFactor, inInclusiveRange(0, 1));
    });

    test('uses positive primary spell tuning', () {
      expect(GameTuning.primarySpellExtent, greaterThan(0));
      expect(GameTuning.primarySpellLifeSeconds, greaterThan(0));
      expect(GameTuning.primarySpellVelocityX.abs(), greaterThan(0));
    });
  });
}
