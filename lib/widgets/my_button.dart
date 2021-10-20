import 'package:demo_futsalapp/constanst.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.onTap,
    required this.margin,
    required this.width,
    required this.height,
    required this.text,
  }) : super(key: key);

  final VoidCallback onTap;
  final EdgeInsets margin;
  final double width, height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kBlackColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}
