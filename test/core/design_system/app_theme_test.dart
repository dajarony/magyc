import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magyc/core/design_system/design_system.dart';

void main() {
  group('AppTheme', () {
    test('exposes a light theme', () {
      expect(AppTheme.light.brightness, Brightness.light);
    });

    test('exposes a dark theme', () {
      expect(AppTheme.dark.brightness, Brightness.dark);
    });
  });
}
