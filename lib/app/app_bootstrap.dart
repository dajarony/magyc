import 'package:flutter/widgets.dart';

import 'magyc_app.dart';

class AppBootstrap {
  AppBootstrap._();

  static Future<Widget> create() async {
    return const MagycApp();
  }
}
