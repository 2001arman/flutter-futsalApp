import 'package:demo_futsalapp/constanst.dart';
import 'package:demo_futsalapp/cubit/auth_cubit.dart';
import 'package:demo_futsalapp/cubit/page_cubit.dart';
import 'package:demo_futsalapp/widgets/custom_text_form_field.dart';
import 'package:demo_futsalapp/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              controller: emailController,
            ),
            CustomTextFormField(
              title: "Kata Sandi",
              hintText: "Kata sandi anda",
              isObscure: true,
              controller: passwordController,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  context.read<PageCubit>().setPage(0);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    'main-page',
                    (route) => false,
                  );
                } else if (state is AuthFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: kGreenLightColor,
                      content: Text(state.error),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return MyButton(
                  onTap: () {
                    context.read<AuthCubit>().signIn(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                  },
                  margin: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  height: 55,
                  text: "Masuk",
                );
              },
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
