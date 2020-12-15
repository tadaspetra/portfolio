import 'package:portfolio/config/current_theme.dart';
import 'package:portfolio/pages/about.dart';
import 'package:portfolio/pages/consulting.dart';
import 'package:portfolio/pages/contact.dart';
import 'package:portfolio/pages/control.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/pages/home.dart';
import 'package:portfolio/pages/portfolio.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CurrentTheme().buildTheme(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/":
            return PageRouteBuilder<dynamic>(
              pageBuilder: (_, __, ___) => ControlPage(
                whichPage: HomePage(),
              ),
              settings: settings,
            );

            break;
          case "/portfolio":
            return PageRouteBuilder<dynamic>(
              pageBuilder: (_, __, ___) => ControlPage(
                whichPage: PortfolioPage(),
              ),
              settings: settings,
            );
            break;
          case "/consulting":
            return PageRouteBuilder<dynamic>(
              pageBuilder: (_, __, ___) => ControlPage(
                whichPage: ConsultingPage(),
              ),
              settings: settings,
            );
            break;
          case "/about":
            return PageRouteBuilder<dynamic>(
              pageBuilder: (_, __, ___) => ControlPage(
                whichPage: AboutPage(),
              ),
              settings: settings,
            );
            break;
          case "/contact":
            return PageRouteBuilder<dynamic>(
              pageBuilder: (_, __, ___) => ControlPage(
                whichPage: ContactPage(),
              ),
              settings: settings,
            );
            break;
          default:
            return PageRouteBuilder<dynamic>(
              pageBuilder: (_, __, ___) => ControlPage(
                whichPage: HomePage(),
              ),
              settings: settings,
            );
        }
      },
    );
  }
}
