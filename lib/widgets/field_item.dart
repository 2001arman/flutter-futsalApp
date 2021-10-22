import 'package:demo_futsalapp/constanst.dart';
import 'package:demo_futsalapp/cubit/field_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FieldItem extends StatelessWidget {
  const FieldItem({
    Key? key,
    required this.id,
    this.isAvaible = true,
  }) : super(key: key);

  final int id;
  final bool isAvaible;

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<FieldCubit>().state == id;
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
        GestureDetector(
          onTap: () {
            if (isAvaible) {
              context.read<FieldCubit>().pilihLapangan(id);
            }
          },
          child: Container(
            width: 154,
            height: 246,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(gambarLapangan()),
              ),
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
