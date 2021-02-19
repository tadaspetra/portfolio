import 'package:flutter/material.dart';
import 'package:portfolio/pages/home.dart';

import 'customTheme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme().buildTheme(),
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
      },
    );
  }
}
