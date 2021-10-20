import 'package:demo_futsalapp/constanst.dart';
import 'package:flutter/material.dart';

class FieldItem extends StatelessWidget {
  const FieldItem(
      {Key? key,
      required this.id,
      this.isAvaible = true,
      this.isSelected = false})
      : super(key: key);

  final int id;
  final bool isAvaible, isSelected;

  @override
  Widget build(BuildContext context) {
    gambarLapangan() {
      if (isAvaible) {
        if (isSelected) {
          return "assets/image_fieldGreen.png";
        } else
          return "assets/image_fieldWhite.png";
      } else {
        return "assets/image_fieldGrey.png";
      }
    }

    return Column(
      children: [
        Container(
          width: 154,
          height: 246,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(gambarLapangan()),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Lapangan $id",
          style: lightTextStyle.copyWith(fontSize: 12),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
