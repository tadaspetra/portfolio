import 'package:flutter/material.dart';
import 'package:portfolio/pages/about.dart';
import 'package:portfolio/pages/consulting.dart';
import 'package:portfolio/pages/contact.dart';
import 'package:portfolio/pages/error.dart';
import 'package:portfolio/pages/home.dart';
import 'package:portfolio/pages/portfolio.dart';

import '../painter.dart';

enum WindowSize { small, medium, large }

class ControlPage extends StatelessWidget {
  final Widget whichPage;
  ControlPage({@required this.whichPage});

  final GlobalKey<ScaffoldState> _homeScaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 800) {
          return Scaffold(
            key: _homeScaffoldKey,
            body: buildStack(context, WindowSize.small),
            endDrawer: const Drawer(),
          );
        } else if (constraints.maxWidth < 1400) {
          return Scaffold(
            body: buildStack(context, WindowSize.medium),
          );
        } else {
          return Scaffold(
            body: buildStack(context, WindowSize.large),
          );
        }
      },
    );
  }

  Stack buildStack(BuildContext context, WindowSize size) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CustomPaint(
            painter: MyPainter(),
          ),
        ),
        Image.asset(
          'assets/images/tplogo.png',
          color: Colors.white,
          width: 180,
        ),
        Positioned(
          top: 50,
          right: 100,
          child: () {
            if (size != WindowSize.small) {
              return buildNavBar(context);
            } else {
              return IconButton(
                icon: const Icon(Icons.menu),
                color: Colors.white,
                onPressed: () {
                  _homeScaffoldKey.currentState.openEndDrawer();
                },
              );
            }
          }(),
        ),
        Positioned(
          top: 200,
          left: 200,
          child: whichPage,
        )
      ],
    );
  }

  Row buildNavBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            //context.read(currentPageProvider).state = Pages.home;
            Navigator.pushNamed(context, "/");
          },
          child: const Text("Home"),
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            //context.read(currentPageProvider).state = Pages.portfolio;
            Navigator.pushNamed(context, "/portfolio");
          },
          child: Text("Portfolio"),
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            //context.read(currentPageProvider).state = Pages.consulting;
          },
          child: const Text("Consulting"),
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            //context.read(currentPageProvider).state = Pages.about;
          },
          child: const Text("About"),
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            //context.read(currentPageProvider).state = Pages.contact;
          },
          child: const Text("Contact"),
        ),
      ],
    );
  }
}
