import 'package:flutter/material.dart';
import 'package:mobicar/app/views/home_page.dart';

class Routes {
  static final Map<String, Widget Function(BuildContext context)> routesList =
      <String, WidgetBuilder>{
    '/': (context) => HomePage(),
  };
}
