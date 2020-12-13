import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color twitterColor = Colors.grey;

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
    return Column(
      children: [
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
    );
  }
}
