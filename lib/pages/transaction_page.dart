import 'package:demo_futsalapp/constanst.dart';
import 'package:demo_futsalapp/cubit/transaksi_cubit.dart';
import 'package:demo_futsalapp/models/transaksi_model.dart';
import 'package:demo_futsalapp/widgets/container_icon.dart';
import 'package:demo_futsalapp/widgets/detail_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransaksiCubit>().fetchTransaksi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget detailsSection(TransaksiModel transaksi) {
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
        margin: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 8),
              blurRadius: 20,
              color: Colors.black.withOpacity(0.2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            informasiLapangan(),
            detailLapangan(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: BlocBuilder<TransaksiCubit, TransaksiState>(
        builder: (context, state) {
          if (state is TransaksiLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TransaksiSuccess) {
            print(state.transaksi);
            if (state.transaksi.length == 0) {
              return Center(
                child: Text("Transaksi Kosong"),
              );
            } else if (state.transaksi.length > 0) {
              return ListView.builder(
                itemCount: state.transaksi.length,
                itemBuilder: (context, index) =>
                    detailsSection(state.transaksi[index]),
              );
            }
          }
          return Center(
            child: Text("Transaksi Page"),
          );
        },
      ),
    );
  }
}
