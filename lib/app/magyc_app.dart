import 'package:flutter/material.dart';

import '../core/design_system/design_system.dart';
import 'app_route_names.dart';
import 'app_routes.dart';

class MagycApp extends StatelessWidget {
  const MagycApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Magyc',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      initialRoute: AppRouteNames.game,
      routes: AppRoutes.map,
    );
  }
}
