import 'package:portfolio/config/current_theme.dart';
import 'package:portfolio/pages/control.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CurrentTheme().buildTheme(),
      home: ControlPage(),
    );
  }
}
