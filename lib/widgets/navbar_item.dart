import 'package:demo_futsalapp/constanst.dart';
import 'package:flutter/material.dart';

class NavbarItem extends StatelessWidget {
  const NavbarItem({Key? key, required this.imageUrl, this.isActive = false})
      : super(key: key);

  final String imageUrl;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 24,
          height: 24,
          child: Image(
            image: AssetImage(imageUrl),
            color: isActive ? kGreenDarkColor : kBlackColor,
          ),
        ),
        Container(
          width: 24,
          height: 2,
          color: isActive ? kGreenDarkColor : Colors.transparent,
        )
      ],
    );
  }
}
