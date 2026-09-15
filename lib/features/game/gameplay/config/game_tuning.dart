class GameTuning {
  GameTuning._();

  // World / isometric grid.
  static const double tileWidth = 72;
  static const double tileHeight = 36;
  static const double tileOriginY = 52;
  static const int tileOverscan = 3;

  // Player movement.
  static const double playerMoveStep = 24;
  static const double playerWorldMargin = 28;

  // Primary spell.
  static const double primarySpellSpawnOffsetX = 18;
  static const double primarySpellSpawnOffsetY = -8;
  static const double primarySpellVelocityX = 260;
  static const double primarySpellVelocityY = 0;
  static const double primarySpellLifeSeconds = 1.8;
  static const double primarySpellExtent = 24;

  // Initial placement.
  static const double playerSpawnXFactor = 0.5;
  static const double playerSpawnYFactor = 0.58;
}
