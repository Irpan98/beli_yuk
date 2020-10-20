import 'package:beli_yuk/ui/PageLogin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageOnBoarding extends StatefulWidget {
  @override
  _PageOnBoardingState createState() => _PageOnBoardingState();
}

class _PageOnBoardingState extends State<PageOnBoarding> {
  @override
  void initState() {
    loadDataPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("images/shop.png"),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            Text(
              "Dapatkan Barang yang Anda inginkan",
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            RaisedButton(
              child: Text("Done"),
              onPressed: () {
                safeDataPref(true);
                movePage();
              },
            ),
          ],
        ),
      ),
    );
  }

  void movePage() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => PageLogin()));
  }

  String SHARED_OnBoarding = " onboarding";

  void safeDataPref(bool saveIt) async {
    print("safeDataPref");

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(SHARED_OnBoarding, saveIt);
  }

  void loadDataPref() async {
    print("loadDataPref");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var isFirstTime = !sharedPreferences.getBool(SHARED_OnBoarding);
    if (isFirstTime != null) {
      movePage();
    }
  }
}
