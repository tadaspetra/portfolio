import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              Image.asset(
                "images/tp_logo.png",
                width: 50,
                height: 50,
              ),
            ],
          ),
          Row(
            children: [
              Text("My name is Tadas Petra"),
              Image.asset(
                "images/profilepicture.png",
                width: 200,
                height: 200,
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                "images/twitter_logo.png",
                width: 50,
                height: 50,
              ),
              Image.asset(
                "images/youtube_logo.png",
                width: 100,
                height: 100,
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset(
                "images/github_logo.png",
                width: 40,
                height: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}
