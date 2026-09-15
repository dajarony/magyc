import 'dart:ui';

import 'package:flame/components.dart';

import '../theme/theme.dart';

class MageComponent extends PositionComponent {
  MageComponent({required super.position})
      : super(
          size: Vector2(42, 54),
          anchor: Anchor.center,
          priority: 10,
        );

  final Paint _glowPaint = Paint()..color = GamePalette.mageGlow;
  final Paint _cloakPaint = Paint()..color = GamePalette.mageCloak;
  final Paint _trimPaint = Paint()..color = GamePalette.mageTrim;
  final Paint _skinPaint = Paint()..color = GamePalette.mageSkin;
  final Paint _focusPaint = Paint()..color = GamePalette.mageFocus;

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    canvas.drawCircle(const Offset(21, 33), 19, _glowPaint);
    canvas.drawPath(_cloakPath(), _cloakPaint);
    canvas.drawCircle(const Offset(21, 16), 9, _skinPaint);
    canvas.drawPath(_hatPath(), _trimPaint);
    canvas.drawCircle(const Offset(37, 29), 5, _focusPaint);
  }

  Path _cloakPath() {
    return Path()
      ..moveTo(21, 17)
      ..lineTo(7, 52)
      ..lineTo(35, 52)
      ..close();
  }

  Path _hatPath() {
    return Path()
      ..moveTo(21, 0)
      ..lineTo(10, 19)
      ..lineTo(33, 19)
      ..close();
  }
}
