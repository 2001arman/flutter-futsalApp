import 'package:demo_futsalapp/constanst.dart';
import 'package:demo_futsalapp/cubit/auth_cubit.dart';
import 'package:demo_futsalapp/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthInitial) {
              Navigator.pushNamedAndRemoveUntil(
                  context, 'login-page', (route) => false);
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
                context.read<AuthCubit>().signOut();
              },
              margin: EdgeInsets.symmetric(horizontal: 70),
              width: double.infinity,
              height: 55,
              text: "Log Out",
            );
          },
        ),
      ),
    );
  }
}
