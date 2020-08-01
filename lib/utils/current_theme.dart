import 'package:flutter/material.dart';

class CurrentTheme {
  Color _black = Colors.black;
  Color _lightGrey = Color.fromARGB(255, 164, 164, 164);

  ThemeData buildTheme() {
    return ThemeData(
      canvasColor: _black,
      primaryColor: _black,
      accentColor: _lightGrey,
      textTheme: TextTheme(
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
