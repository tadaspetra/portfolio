import 'package:flutter/material.dart';

class CurrentTheme {
  final Color _black = const Color(0xFF171717);
  final Color _lightGrey = const Color.fromARGB(255, 164, 164, 164);

  ThemeData buildTheme() {
    return ThemeData(
      canvasColor: _black,
      primaryColor: _black,
      accentColor: _lightGrey,
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: Colors.white,
        ),
        bodyText2: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
