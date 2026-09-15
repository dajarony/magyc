import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';

class MagycGame extends FlameGame {
  late final MageComponent mage;

  static const double moveStep = 24;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(IsometricGround(size: size));

    mage = MageComponent(
      position: Vector2(size.x * 0.5, size.y * 0.58),
    );
    add(mage);
  }

  void movePlayer(Vector2 delta) {
    final next = mage.position + delta;
    final margin = Vector2.all(28);

    mage.position = Vector2(
      next.x.clamp(margin.x, size.x - margin.x),
      next.y.clamp(margin.y, size.y - margin.y),
    );
  }

  void moveUp() => movePlayer(Vector2(0, -moveStep));
  void moveDown() => movePlayer(Vector2(0, moveStep));
  void moveLeft() => movePlayer(Vector2(-moveStep, 0));
  void moveRight() => movePlayer(Vector2(moveStep, 0));

  void castSpell() {
    add(
      SpellOrb(
        position: mage.position + Vector2(18, -8),
        velocity: Vector2(260, 0),
      ),
    );
  }
}

class IsometricGround extends PositionComponent {
  IsometricGround({required super.size}) : super(priority: -10);

  final Paint _tileA = Paint()..color = const Color(0xFF19372E);
  final Paint _tileB = Paint()..color = const Color(0xFF21483C);
  final Paint _line = Paint()
    ..color = const Color(0x443FFFA8)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(size.toRect(), Paint()..color = const Color(0xFF07110F));

    const tileW = 72.0;
    const tileH = 36.0;
    final columns = (size.x / (tileW / 2)).ceil() + 3;
    final rows = (size.y / tileH).ceil() + 3;
    final origin = Offset(size.x / 2, 52);

    for (var row = 0; row < rows; row++) {
      for (var col = -columns ~/ 2; col < columns ~/ 2; col++) {
        final cx = origin.dx + (col * tileW / 2) + (row * tileW / 2);
        final cy = origin.dy + (row * tileH / 2) - (col * tileH / 2);

        final path = Path()
          ..moveTo(cx, cy - tileH / 2)
          ..lineTo(cx + tileW / 2, cy)
          ..lineTo(cx, cy + tileH / 2)
          ..lineTo(cx - tileW / 2, cy)
          ..close();

        canvas.drawPath(path, (row + col).isEven ? _tileA : _tileB);
        canvas.drawPath(path, _line);
      }
    }
  }
}

class MageComponent extends PositionComponent {
  MageComponent({required super.position})
      : super(
          size: Vector2(42, 54),
          anchor: Anchor.center,
          priority: 10,
        );

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final glow = Paint()..color = const Color(0x553AAEFF);
    final cloak = Paint()..color = const Color(0xFF3D57C8);
    final trim = Paint()..color = const Color(0xFF73D8FF);
    final skin = Paint()..color = const Color(0xFFE7C7A0);

    canvas.drawCircle(const Offset(21, 33), 19, glow);

    final cloakPath = Path()
      ..moveTo(21, 17)
      ..lineTo(7, 52)
      ..lineTo(35, 52)
      ..close();
    canvas.drawPath(cloakPath, cloak);

    canvas.drawCircle(const Offset(21, 16), 9, skin);

    final hat = Path()
      ..moveTo(21, 0)
      ..lineTo(10, 19)
      ..lineTo(33, 19)
      ..close();
    canvas.drawPath(hat, trim);

    canvas.drawCircle(const Offset(37, 29), 5, Paint()..color = const Color(0xFF8FE6FF));
  }
}

class SpellOrb extends PositionComponent {
  SpellOrb({
    required super.position,
    required this.velocity,
  }) : super(
          size: Vector2.all(24),
          anchor: Anchor.center,
          priority: 20,
        );

  final Vector2 velocity;
  double life = 1.8;

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;
    life -= dt;
    if (life <= 0) {
      removeFromParent();
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawCircle(
      const Offset(12, 12),
      11,
      Paint()..color = const Color(0x5547D7FF),
    );
    canvas.drawCircle(
      const Offset(12, 12),
      6,
      Paint()..color = const Color(0xFFB9F5FF),
    );
  }
}
