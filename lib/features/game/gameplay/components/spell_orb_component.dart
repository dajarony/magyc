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
    canvas.drawCircle(const Offset(12, 12), 11, _glowPaint);
    canvas.drawCircle(const Offset(12, 12), 6, _corePaint);
  }
}
