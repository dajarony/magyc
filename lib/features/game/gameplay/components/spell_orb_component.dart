import 'dart:ui';

import 'package:flame/components.dart';

import '../config/config.dart';
import '../theme/theme.dart';

class SpellOrbComponent extends PositionComponent {
  SpellOrbComponent({
    required super.position,
    required this.velocity,
  }) : super(
          size: Vector2.all(GameTuning.primarySpellExtent),
          anchor: Anchor.center,
          priority: 20,
        );

  final Vector2 velocity;
  final Paint _glowPaint = Paint()..color = GamePalette.spellGlow;
  final Paint _corePaint = Paint()..color = GamePalette.spellCore;

  double _lifeSeconds = GameTuning.primarySpellLifeSeconds;

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;
    _lifeSeconds -= dt;

    if (_lifeSeconds <= 0) {
      removeFromParent();
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final center = GameTuning.primarySpellExtent / 2;
    canvas.drawCircle(Offset(center, center), 11, _glowPaint);
    canvas.drawCircle(Offset(center, center), 6, _corePaint);
  }
}
