import 'package:flutter/material.dart';

import '../features/game/game.dart';
import 'app_route_names.dart';

class AppRoutes {
  AppRoutes._();

  static final Map<String, WidgetBuilder> map = {
    AppRouteNames.game: (_) => const MagycGameScreen(),
  };
}
