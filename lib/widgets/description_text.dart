import 'package:demo_futsalapp/constanst.dart';
import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({Key? key, required this.title, required this.value})
      : super(key: key);

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: lightTextStyle.copyWith(
            fontSize: 10,
            fontWeight: light,
          ),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: blackTextStyle.copyWith(
            fontSize: 12,
            fontWeight: semiBold,
          ),
        ),
      ],
    );
  }
}
