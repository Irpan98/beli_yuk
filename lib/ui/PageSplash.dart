import 'dart:async';

import 'package:flutter/material.dart';

import 'PageOnBoarding.dart';

class PageSplash extends StatefulWidget {
  @override
  _PageSplashState createState() => _PageSplashState();
}

class _PageSplashState extends State<PageSplash> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("images/udacoding_logo.png"),
          Text(
            "Loading...",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Future<Timer> startTimer() async {
    return Timer(Duration(seconds: 4), onDone);
  }

  void onDone() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => PageOnBoarding()));
  }
}
