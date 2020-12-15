import 'package:flutter/material.dart';

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
            body: buildThin(context),
            endDrawer: const Drawer(),
          );
        } else if (constraints.maxWidth < 1400) {
          return Scaffold(
            body: buildWide(context),
          );
        } else {
          return Scaffold(
            body: buildWide(context),
          );
        }
      },
    );
  }

  Column buildThin(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 24.0,
            ),
            Spacer(),
            Image.asset(
              'assets/images/tplogo.png',
              color: Colors.white,
              width: 120,
            ),
            Spacer(),
            IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {
                _homeScaffoldKey.currentState.openEndDrawer();
              },
            ),
          ],
        ),
        whichPage,
      ],
    );
  }

  Stack buildWide(BuildContext context) {
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
          width: 120,
        ),
        Positioned(
          top: 50,
          right: 100,
          child: buildNavBar(context),
        ),

        // return Positioned(
        //   top: 20,
        //   right: 20,
        //   child: IconButton(
        //     icon: const Icon(Icons.menu),
        //     color: Colors.white,
        //     onPressed: () {
        //       _homeScaffoldKey.currentState.openEndDrawer();
        //     },
        //   ),
        // )

        Positioned(
          top: 120,
          left: 120,
          child: whichPage,
        )
      ],
    );
  }

  Row buildNavBar(BuildContext context) {
    Widget eachTab(String text, String route) {
      return GestureDetector(
        onTap: () {
          //context.read(currentPageProvider).state = Pages.contact;
          Navigator.pushNamed(context, route);
        },
        child: Text(text),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(width: 20),
        eachTab("Home", "/"),
        const SizedBox(width: 20),
        eachTab("Portfolio", "/portfolio"),
        const SizedBox(width: 20),
        eachTab("Consulting", "/consulting"),
        const SizedBox(width: 20),
        eachTab("About", "/about"),
        const SizedBox(width: 20),
        eachTab("Contact", "/contact")
      ],
    );
  }
}
