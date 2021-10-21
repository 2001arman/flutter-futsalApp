import 'package:demo_futsalapp/constanst.dart';
import 'package:flutter/material.dart';

class DetailItem extends StatelessWidget {
  const DetailItem({Key? key, required this.title, required this.value})
      : super(key: key);

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icon_check.png"),
              ),
            ),
          ),
          SizedBox(width: 6),
          Expanded(
            child: Text(title, style: blackTextStyle),
          ),
          Text(
            value,
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
