import 'dart:async';

import 'package:demo_futsalapp/constanst.dart';
import 'package:demo_futsalapp/cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () {
        User? user = FirebaseAuth.instance.currentUser;
        if (user == null) {
          Navigator.pushReplacementNamed(context, 'login-page');
        } else {
          print(user.email);
          context.read<AuthCubit>().getCurrentUser(user.uid);
          Navigator.pushNamedAndRemoveUntil(
              context, 'main-page', (route) => false);
        }
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
