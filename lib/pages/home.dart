import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../hover_effect.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color twitterColor = Colors.grey;
  Animation<FractionalOffset> animation;

  Future<void> _launchTwitter() async {
    const url = "https://twitter.com/tadaspetra";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Can't launch";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: MediaQuery.of(context).size.height / 1.5,
      child: HoverCard(
        builder: (context, hovering) {
          return Container(
            color: Color(0xFF3F3F3F),
            child: Center(
              // ignore: sort_child_properties_last
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/tplogo.png',
                    color: Colors.white,
                    width: 120,
                  ),
                  const SelectableText(
                      "       This is a work in progress,\n\n        but if you want updates:\n"),
                  MouseRegion(
                    onEnter: (_) {
                      twitterColor = Colors.white;
                      setState(() {});
                    },
                    onExit: (_) {
                      twitterColor = Colors.grey;
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          iconSize: 30,
                          icon: SizedBox(
                            width: 100,
                            child: Image.asset(
                              "assets/images/twitter.png",
                              color: twitterColor,
                            ),
                          ),
                          color: Colors.white,
                          onPressed: _launchTwitter,
                        ),
                        Text(
                          "Follow Me",
                          style: TextStyle(
                            fontSize: 24.0,
                            color: twitterColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        animation: animation,
        animationCallback: (tween) {
          animation = tween;
        },
        depth: 10,
        depthColor: Colors.grey[500],
        onTap: () => print('Hello, World!'),
        shadow: BoxShadow(
            color: Color(0xFF80E2FD),
            blurRadius: 30,
            spreadRadius: -20,
            offset: Offset(0, 40)),
      ),
    );
  }
}
