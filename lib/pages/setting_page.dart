import 'package:demo_futsalapp/constanst.dart';
import 'package:demo_futsalapp/widgets/my_button.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: MyButton(
          onTap: () {},
          margin: EdgeInsets.symmetric(horizontal: 70),
          width: double.infinity,
          height: 55,
          text: "Log Out",
        ),
      ),
    );
  }
}
