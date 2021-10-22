import 'package:demo_futsalapp/constanst.dart';
import 'package:demo_futsalapp/cubit/page_cubit.dart';
import 'package:demo_futsalapp/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageSection() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/icon_schedule.png"),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget textSection() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 80),
        child: Column(
          children: [
            Text(
              "Booking Berhasil",
              style: blackTextStyle.copyWith(
                fontSize: 30,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 13),
            Text(
              "Bermainlah dengan aman\ndan sportif",
              style: lightTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            imageSection(),
            textSection(),
            MyButton(
              onTap: () {
                context.read<PageCubit>().setPage(1);
                Navigator.pushReplacementNamed(context, 'main-page');
              },
              margin: EdgeInsets.only(top: 70, left: 70, right: 70),
              width: double.infinity,
              height: 55,
              text: "My Bookings",
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
