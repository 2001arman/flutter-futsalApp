import 'package:demo_futsalapp/constanst.dart';
import 'package:demo_futsalapp/widgets/container_icon.dart';
import 'package:demo_futsalapp/widgets/detail_item.dart';
import 'package:demo_futsalapp/widgets/my_button.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

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
              "Checkout",
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

    Widget detailsSection() {
      Widget informasiLapangan() {
        return Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: AssetImage("assets/image_futsal1.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Centro Futsal",
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Samarinda",
                    style: lightTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  )
                ],
              ),
            ),
            ContainerIcon(imageUrl: "assets/icon_star.png"),
            Text(
              "4.8",
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            )
          ],
        );
      }

      Widget detailLapangan() {
        return Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Detail Lapangan",
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(height: 10),
              DetailItem(title: "Nomor", value: "3"),
              DetailItem(title: "Jenis", value: "Rumput"),
              DetailItem(title: "Harga", value: "Rp. 150.000"),
            ],
          ),
        );
      }

      return Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            informasiLapangan(),
            detailLapangan(),
          ],
        ),
      );
    }

    Widget saldo() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Detail Pembayaran",
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/logo.png"),
                    ),
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "IDR 80.400.000",
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Current Balance",
                      style: lightTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            topBarSection(),
            detailsSection(),
            saldo(),
            MyButton(
              onTap: () {},
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              width: double.infinity,
              height: 55,
              text: "Bayar Sekarang",
            ),
          ],
        ),
      ),
    );
  }
}
