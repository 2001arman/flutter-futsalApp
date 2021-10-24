import 'package:demo_futsalapp/constanst.dart';
import 'package:demo_futsalapp/cubit/auth_cubit.dart';
import 'package:demo_futsalapp/cubit/page_cubit.dart';
import 'package:demo_futsalapp/cubit/transaksi_cubit.dart';
import 'package:demo_futsalapp/models/transaksi_model.dart';
import 'package:demo_futsalapp/widgets/container_icon.dart';
import 'package:demo_futsalapp/widgets/detail_item.dart';
import 'package:demo_futsalapp/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({
    Key? key,
    required this.transaksi,
  }) : super(key: key);

  final TransaksiModel transaksi;

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
                  image: NetworkImage(transaksi.lapangan.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaksi.lapangan.nama,
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
              "${transaksi.lapangan.rating}",
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
              DetailItem(title: "Nomor", value: "${transaksi.nomor}"),
              DetailItem(title: "Jenis", value: transaksi.lapangan.jenis),
              DetailItem(
                  title: "Harga", value: "Rp. ${transaksi.lapangan.harga}"),
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
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin:
                  EdgeInsets.symmetric(vertical: 30, horizontal: defaultMargin),
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
                            NumberFormat.currency(
                              locale: 'id',
                              symbol: 'Rp. ',
                              decimalDigits: 0,
                            ).format(
                              state.user.saldo,
                            ),
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
          } else {
            return SizedBox();
          }
        },
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
            BlocConsumer<TransaksiCubit, TransaksiState>(
              listener: (context, state) {
                if (state is TransaksiSuccess) {
                  context.read<PageCubit>().setPage(1);
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'success-page', (route) => false);
                } else if (state is TransaksiFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: kGreenLightColor,
                      content: Text(state.error),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is TransaksiLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return MyButton(
                  onTap: () {
                    context.read<TransaksiCubit>().buatTransaksi(transaksi);
                  },
                  margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                  width: double.infinity,
                  height: 55,
                  text: "Bayar Sekarang",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
