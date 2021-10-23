import 'package:demo_futsalapp/constanst.dart';
import 'package:demo_futsalapp/cubit/auth_cubit.dart';
import 'package:demo_futsalapp/cubit/lapangan_cubit.dart';
import 'package:demo_futsalapp/models/lapangan_model.dart';
import 'package:demo_futsalapp/widgets/container_icon.dart';
import 'package:demo_futsalapp/widgets/field_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<LapanganCubit>().fetchLapangan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget topBar() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                top: defaultMargin,
              ),
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    margin: EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/image_profile.png"),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, ${state.user.nama}",
                        style: blackTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: semiBold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/icon_location.png"),
                              ),
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            "West Street, Samarinda",
                            style: lightTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: reguler,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  ContainerIcon(imageUrl: "assets/icon_notification.png"),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget searchSection() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kamu pengen\nmain futsal dimana?",
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: defaultMargin),
              width: double.infinity,
              height: 35,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 50,
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Cari lapangan futsal...",
                  hintStyle: lightTextStyle.copyWith(fontSize: 14),
                  border: InputBorder.none,
                  suffixIcon: Container(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    child: Image(
                      image: AssetImage("assets/icon_search.png"),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget contentSection(List<LapanganModel> dataLapangan) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Note: Section terakhir kali dibooking
            Container(
              margin: EdgeInsets.only(left: defaultMargin),
              child: Text(
                "Terakhir kali dibooking",
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(bottom: 24),
              child: Row(
                children: dataLapangan.map((LapanganModel lapangan) {
                  return FieldCard(lapangan: lapangan);
                }).toList(),
              ),
            ),
            // Note: Section lapangan terdekat
            Container(
              margin: EdgeInsets.only(left: defaultMargin),
              child: Text(
                "Lapangan terdekat",
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(bottom: 24),
              child: Row(
                children: dataLapangan.map((LapanganModel lapangan) {
                  return FieldCard(lapangan: lapangan);
                }).toList(),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: SafeArea(
        child: BlocConsumer<LapanganCubit, LapanganState>(
          listener: (context, state) {
            if (state is LapanganFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kGreenLightColor,
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is LapanganSuccess) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    topBar(),
                    searchSection(),
                    contentSection(state.dataLapangan),
                    SizedBox(height: 60),
                  ],
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
