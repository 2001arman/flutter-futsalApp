import 'package:demo_futsalapp/constanst.dart';
import 'package:demo_futsalapp/widgets/custom_text_form_field.dart';
import 'package:demo_futsalapp/widgets/my_button.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection() {
      return Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 44),
        child: Text(
          "Bergabunglah \nBersama Kami",
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
              title: "Nama Lengkap",
              hintText: "Nama anda",
            ),
            CustomTextFormField(
              title: "Email",
              hintText: "Email anda",
            ),
            CustomTextFormField(
              title: "Kata Sandi",
              hintText: "Kata sandi anda",
              isObscure: true,
            ),
            CustomTextFormField(
              title: "Hobi",
              hintText: "Hobi anda",
            ),
            MyButton(
              onTap: () {},
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 55,
              text: "Daftar",
            ),
          ],
        ),
      );
    }

    Widget loginSection() {
      return Container(
        margin: EdgeInsets.only(bottom: 50, top: 30),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, 'login-page');
          },
          child: Text(
            "Sudah Memiliki Akun? Masuk",
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
            loginSection(),
          ],
        ),
      ),
    );
  }
}
