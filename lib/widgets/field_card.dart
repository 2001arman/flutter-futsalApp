import 'package:demo_futsalapp/constanst.dart';
import 'package:demo_futsalapp/models/lapangan_model.dart';
import 'package:demo_futsalapp/pages/details_page.dart';
import 'package:flutter/material.dart';

class FieldCard extends StatelessWidget {
  const FieldCard({
    Key? key,
    required this.lapangan,
  }) : super(key: key);

  final LapanganModel lapangan;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(lapangan: lapangan),
          ),
        );
      },
      child: Container(
        width: 141,
        height: 170,
        margin: EdgeInsets.only(left: defaultMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: Offset(0, 9),
              color: Colors.black.withOpacity(0.1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 141,
              height: 126,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(lapangan.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lapangan.nama,
                      style: blackTextStyle.copyWith(
                        fontSize: 10,
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      lapangan.deskripsi,
                      style: lightTextStyle.copyWith(
                        fontWeight: light,
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
