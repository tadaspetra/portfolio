import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  static const routeName = '/contact';
  @override
  _ContactPageState createState() => _ContactPageState();
}

enum LinkType { youtube, twitter, github }

class _ContactPageState extends State<ContactPage> {
  Color youtubeColor = Colors.grey;
  Color twitterColor = Colors.grey;
  Color githubColor = Colors.grey;

  Future<void> _launchYoutube() async {
    const url = 'https://youtube.com/tadaspetra';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchTwitter() async {
    const url = 'https://twitter.com/tadaspetra';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchGithub() async {
    const url = 'https://github.com/tadaspetra';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _spacer() {
    return Padding(
      padding: const EdgeInsets.only(left: 50.0),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 2,
            height: 40,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget _eachLink(LinkType linkType) {
    switch (linkType) {
      case LinkType.youtube:
        return MouseRegion(
          onEnter: (_) {
            youtubeColor = Colors.white;
            setState(() {});
          },
          onExit: (_) {
            youtubeColor = Colors.grey;
            setState(() {});
          },
          child: Row(
            children: [
              IconButton(
                iconSize: 100,
                icon: SizedBox(
                  width: 100,
                  child: Image.asset(
                    "assets/images/youtube.png",
                    color: youtubeColor,
                  ),
                ),
                color: Colors.white,
                onPressed: _launchYoutube,
              ),
              Text(
                "Cool Coding Tutorials",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: youtubeColor,
                ),
              ),
            ],
          ),
        );
        break;
      case LinkType.twitter:
        return MouseRegion(
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
                iconSize: 100,
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
                  fontWeight: FontWeight.bold,
                  color: twitterColor,
                ),
              ),
            ],
          ),
        );
        break;
      case LinkType.github:
        return MouseRegion(
          onEnter: (_) {
            githubColor = Colors.white;
            setState(() {});
          },
          onExit: (_) {
            githubColor = Colors.grey;
            setState(() {});
          },
          child: Row(
            children: [
              IconButton(
                iconSize: 100,
                icon: SizedBox(
                  width: 100,
                  child: Image.asset(
                    "assets/images/github.png",
                    color: githubColor,
                  ),
                ),
                color: Colors.white,
                onPressed: _launchGithub,
              ),
              Text(
                "My Projects",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: githubColor,
                ),
              ),
            ],
          ),
        );
        break;
      default:
        return const Text("Error");
    }
  }

  Widget _buildLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _eachLink(LinkType.youtube),
        _spacer(),
        _eachLink(LinkType.twitter),
        _spacer(),
        _eachLink(LinkType.github),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: _buildLinks());
  }
}
