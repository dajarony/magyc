import 'dart:ui';

import 'package:flame/components.dart';

import '../config/config.dart';
import '../theme/theme.dart';

class IsometricGroundComponent extends PositionComponent {
  IsometricGroundComponent({required super.size}) : super(priority: -10);

  final Paint _tilePrimaryPaint = Paint()..color = GamePalette.tilePrimary;
  final Paint _tileSecondaryPaint = Paint()..color = GamePalette.tileSecondary;
  final Paint _linePaint = Paint()
    ..color = GamePalette.tileLine
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;
  final Paint _backgroundPaint = Paint()..color = GamePalette.worldBackground;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(size.toRect(), _backgroundPaint);

    final columns =
        (size.x / (GameTuning.tileWidth / 2)).ceil() + GameTuning.tileOverscan;
    final rows =
        (size.y / GameTuning.tileHeight).ceil() + GameTuning.tileOverscan;
    final origin = Offset(size.x / 2, GameTuning.tileOriginY);

    for (var row = 0; row < rows; row++) {
      for (var column = -columns ~/ 2; column < columns ~/ 2; column++) {
        _drawTile(canvas, row: row, column: column, origin: origin);
      }
    }
  }

  void _drawTile(
    Canvas canvas, {
    required int row,
    required int column,
    required Offset origin,
  }) {
    final centerX = origin.dx +
        (column * GameTuning.tileWidth / 2) +
        (row * GameTuning.tileWidth / 2);
    final centerY = origin.dy +
        (row * GameTuning.tileHeight / 2) -
        (column * GameTuning.tileHeight / 2);

    final path = Path()
      ..moveTo(centerX, centerY - GameTuning.tileHeight / 2)
      ..lineTo(centerX + GameTuning.tileWidth / 2, centerY)
      ..lineTo(centerX, centerY + GameTuning.tileHeight / 2)
      ..lineTo(centerX - GameTuning.tileWidth / 2, centerY)
      ..close();

    canvas.drawPath(
      path,
      (row + column).isEven ? _tilePrimaryPaint : _tileSecondaryPaint,
    );
    canvas.drawPath(path, _linePaint);
  }
}
