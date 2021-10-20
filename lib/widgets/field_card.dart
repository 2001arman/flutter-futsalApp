import 'package:demo_futsalapp/constanst.dart';
import 'package:flutter/material.dart';

class FieldCard extends StatelessWidget {
  const FieldCard(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.description})
      : super(key: key);

  final String imageUrl, name, description;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'details-page');
      },
      child: Container(
        width: 141,
        height: 170,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                offset: Offset(0, 9),
                color: Colors.black.withOpacity(0.1),
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 141,
              height: 126,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: blackTextStyle.copyWith(
                        fontSize: 10,
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      description,
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
