import 'package:flutter/material.dart';
import 'package:portfolio/pages/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
      },
    );
  }
}
