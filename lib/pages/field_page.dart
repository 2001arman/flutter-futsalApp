import 'package:demo_futsalapp/constanst.dart';
import 'package:demo_futsalapp/cubit/field_cubit.dart';
import 'package:demo_futsalapp/models/lapangan_model.dart';
import 'package:demo_futsalapp/models/transaksi_model.dart';
import 'package:demo_futsalapp/pages/checkout_page.dart';
import 'package:demo_futsalapp/widgets/container_icon.dart';
import 'package:demo_futsalapp/widgets/field_item.dart';
import 'package:demo_futsalapp/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FieldPage extends StatelessWidget {
  const FieldPage(this.lapangan, {Key? key}) : super(key: key);

  final LapanganModel lapangan;

  @override
  Widget build(BuildContext context) {
    Widget topBarSection() {
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        width: double.infinity,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: ContainerIcon(imageUrl: "assets/icon_arrow.png"),
            ),
            Spacer(),
            Text(
              "Pilih Lapangan",
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
              ),
            ),
            Spacer(),
          ],
        ),
      );
    }

    Widget lapanganStatus() {
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tersedia
            Container(
              width: 12,
              height: 12,
              margin: EdgeInsets.only(right: 4, left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kWhiteColor,
                border: Border.all(width: 1, color: kGreyColor),
              ),
            ),
            Text(
              "Tersedia",
              style: blackTextStyle.copyWith(
                fontSize: 10,
                fontWeight: medium,
              ),
            ),
            // Telah dibooking
            Container(
              width: 12,
              height: 12,
              margin: EdgeInsets.only(right: 4, left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kGreyColor,
                border: Border.all(width: 1, color: kGreyColor),
              ),
            ),
            Text(
              "Telah dibooking",
              style: greyTextStyle.copyWith(
                fontSize: 10,
                fontWeight: medium,
              ),
            ),
            // Dipilih
            Container(
              width: 12,
              height: 12,
              margin: EdgeInsets.only(right: 4, left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kGreenDarkColor,
                border: Border.all(width: 1, color: kGreenDarkColor),
              ),
            ),
            Text(
              "Dipilih",
              style: greenTextStyle.copyWith(
                fontSize: 10,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      );
    }

    Widget pilihanLapangan() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FieldItem(id: 1, isAvaible: false),
                FieldItem(id: 2),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FieldItem(id: 3),
                FieldItem(id: 4, isAvaible: false),
              ],
            ),
          ],
        ),
      );
    }

    Widget bottomSection() {
      return BlocBuilder<FieldCubit, int>(
        builder: (context, state) {
          int nomorLapangan = context.read<FieldCubit>().state;
          return Container(
            margin:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "Lapangan dipilih",
                      style: lightTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: light,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Lapangan $nomorLapangan",
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
                MyButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckoutPage(
                          transaksi: TransaksiModel(
                            lapangan: lapangan,
                            nomor: nomorLapangan,
                          ),
                        ),
                      ),
                    );
                  },
                  width: 154,
                  height: 45,
                  margin: EdgeInsets.zero,
                  text: "Lanjutkan",
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            topBarSection(),
            lapanganStatus(),
            pilihanLapangan(),
            bottomSection(),
          ],
        ),
      ),
    );
  }
}
