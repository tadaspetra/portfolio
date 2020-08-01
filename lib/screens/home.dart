import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color youtubeColor = Colors.grey;
  Color twitterColor = Colors.grey;
  Color githubColor = Colors.grey;

  void _launchYoutube() async {
    const url = 'https://youtube.com/amateurcoder';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchTwitter() async {
    const url = 'https://twitter.com/tadaspetra';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchGithub() async {
    const url = 'https://github.com/tadaspetra';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth < 800) {
                  return Container(
                    child: Image.asset(
                      'assets/images/tpbanner.png',
                    ),
                    width: MediaQuery.of(context).size.width,
                  );
                } else if (constraints.maxWidth < 1400) {
                  return Container(
                    child: Image.asset(
                      'assets/images/tpbanner.png',
                    ),
                    width: MediaQuery.of(context).size.width / 1.5,
                  );
                } else {
                  return Container(
                    child: Image.asset(
                      'assets/images/tpbanner.png',
                    ),
                    width: MediaQuery.of(context).size.width / 2,
                  );
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MouseRegion(
                  onEnter: (_) {
                    youtubeColor = Colors.white;
                    setState(() {});
                  },
                  onExit: (_) {
                    youtubeColor = Colors.grey;
                    setState(() {});
                  },
                  child: IconButton(
                    iconSize: 100,
                    icon: Container(
                      child: Image.asset(
                        'assets/images/youtube.png',
                        color: youtubeColor,
                      ),
                      width: 100,
                    ),
                    color: Colors.white,
                    onPressed: _launchYoutube,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  width: 2,
                  height: 40,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 30,
                ),
                MouseRegion(
                  onEnter: (_) {
                    twitterColor = Colors.white;
                    setState(() {});
                  },
                  onExit: (_) {
                    twitterColor = Colors.grey;
                    setState(() {});
                  },
                  child: IconButton(
                    iconSize: 100,
                    icon: Container(
                      child: Image.asset(
                        'assets/images/twitter.png',
                        color: twitterColor,
                      ),
                      width: 100,
                    ),
                    color: Colors.white,
                    onPressed: _launchTwitter,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  width: 2,
                  height: 40,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 30,
                ),
                MouseRegion(
                  onEnter: (_) {
                    githubColor = Colors.white;
                    setState(() {});
                  },
                  onExit: (_) {
                    githubColor = Colors.grey;
                    setState(() {});
                  },
                  child: IconButton(
                    iconSize: 80,
                    icon: Container(
                      child: Image.asset(
                        'assets/images/github.png',
                        color: githubColor,
                      ),
                      width: 100,
                    ),
                    color: Colors.white,
                    onPressed: _launchGithub,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
