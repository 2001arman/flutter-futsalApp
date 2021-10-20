import 'package:demo_futsalapp/pages/details_page.dart';
import 'package:demo_futsalapp/pages/field_page.dart';
import 'package:demo_futsalapp/pages/home.dart';
import 'package:demo_futsalapp/pages/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => SplashScreen(),
        'main-page': (context) => HomePage(),
        'details-page': (context) => DetailsPage(),
        'field-page': (context) => FieldPage(),
      },
      // home: HomePage(),
    );
  }
}
