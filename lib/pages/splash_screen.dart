import 'dart:async';

import 'package:demo_futsalapp/constanst.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, 'main-page');
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: kBackgroundColor,
        child: Container(
          width: 206,
          height: 206,
          margin: EdgeInsets.all(84),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/logo.png"),
            ),
          ),
        ),
      ),
    );
  }
}
