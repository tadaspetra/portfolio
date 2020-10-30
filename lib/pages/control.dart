import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/domain/navigation/navigation.dart';
import 'package:portfolio/domain/navigation/navigation_state.dart';
import 'package:portfolio/pages/about.dart';
import 'package:portfolio/pages/consulting.dart';
import 'package:portfolio/pages/contact.dart';
import 'package:portfolio/pages/error.dart';
import 'package:portfolio/pages/home.dart';
import 'package:portfolio/pages/portfolio.dart';
import 'package:portfolio/providers/navigation_provider.dart';

import '../painter.dart';

enum WindowSize { small, medium, large }

class ControlPage extends HookWidget {
  ControlPage();

  static Route get route =>
      MaterialPageRoute<void>(builder: (_) => ControlPage());

  final GlobalKey<ScaffoldState> _homeScaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final navigation = useProvider(navigationProvider);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        //800, 1400, else
        if (constraints.maxWidth < 800) {
          return Scaffold(
            key: _homeScaffoldKey,
            body: buildStack(context, navigation, WindowSize.small),
            endDrawer: Drawer(),
          );
        } else if (constraints.maxWidth < 1400) {
          return Scaffold(
            body: buildStack(context, navigation, WindowSize.medium),
          );
        } else {
          return Scaffold(
            body: buildStack(context, navigation, WindowSize.large),
          );
        }
      },
    );
  }

  Stack buildStack(
      BuildContext context, NavigationState navigation, WindowSize size) {
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
              return buildNavBar(context, size);
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
          child: navigation.maybeWhen(
            home: () => HomePage(),
            portfolio: () => PortfolioPage(),
            consulting: () => ConsultingPage(),
            about: () => AboutPage(),
            contact: () => ContactPage(),
            error: (err) => const ErrorPage(),
            orElse: () => HomePage(),
          ),
        )
      ],
    );
  }

  Row buildNavBar(BuildContext context, WindowSize size) {
    switch (size) {
      case WindowSize.small:
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                context.read(currentPageProvider).state = Pages.home;
              },
              child: const Text("Home"),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                context.read(currentPageProvider).state = Pages.portfolio;
              },
              child: const Text("Portfolio"),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                context.read(currentPageProvider).state = Pages.consulting;
              },
              child: const Text("Consulting"),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                context.read(currentPageProvider).state = Pages.about;
              },
              child: const Text("About"),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                context.read(currentPageProvider).state = Pages.contact;
              },
              child: const Text("Contact"),
            ),
          ],
        );
        break;
      case WindowSize.medium:
      case WindowSize.large:
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                context.read(currentPageProvider).state = Pages.home;
              },
              child: const Text("Home"),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                context.read(currentPageProvider).state = Pages.portfolio;
              },
              child: const Text("Portfolio"),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                context.read(currentPageProvider).state = Pages.consulting;
              },
              child: const Text("Consulting"),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                context.read(currentPageProvider).state = Pages.about;
              },
              child: const Text("About"),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                context.read(currentPageProvider).state = Pages.contact;
              },
              child: const Text("Contact"),
            ),
          ],
        );
        break;
      default:
        return Row(
          children: [
            const Text("error"),
          ],
        );
    }
  }
}
