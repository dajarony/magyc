import 'package:flutter_test/flutter_test.dart';
import 'package:magyc/app/app.dart';

void main() {
  test('registers the game route', () {
    expect(AppRoutes.map.containsKey(AppRouteNames.game), isTrue);
  });
}
