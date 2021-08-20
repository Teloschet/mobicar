import 'package:flutter/material.dart';
import 'package:mobicar/app/core/main_theme.dart';
import 'package:mobicar/app/core/routes.dart';

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Routes.routesList,
      theme: MainTheme.theme,
    );
  }
}
