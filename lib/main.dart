import 'package:flutter/material.dart';
import 'package:tadas_petra/screens/home.dart';
import 'package:tadas_petra/utils/current_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: CurrentTheme().buildTheme(),
    );
  }
}
