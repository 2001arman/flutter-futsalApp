import 'package:demo_futsalapp/constanst.dart';
import 'package:demo_futsalapp/widgets/custom_text_form_field.dart';
import 'package:demo_futsalapp/widgets/my_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection() {
      return Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 44),
        child: Text(
          "Masuk dan Booking\nLapanganmu",
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget formSection() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              title: "Email",
              hintText: "Email anda",
            ),
            CustomTextFormField(
              title: "Kata Sandi",
              hintText: "Kata sandi anda",
              isObscure: true,
            ),
            MyButton(
              onTap: () {
                Navigator.pushReplacementNamed(context, 'main-page');
              },
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 55,
              text: "Masuk",
            ),
          ],
        ),
      );
    }

    Widget registerSection() {
      return Container(
        margin: EdgeInsets.only(bottom: 50, top: 30),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, 'register-page');
          },
          child: Text(
            "Belum Memiliki Akun? Daftar",
            style: lightTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            titleSection(),
            formSection(),
            registerSection(),
          ],
        ),
      ),
    );
  }
}
