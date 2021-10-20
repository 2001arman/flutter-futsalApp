import 'package:demo_futsalapp/constanst.dart';
import 'package:demo_futsalapp/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavbarItem extends StatelessWidget {
  const NavbarItem({Key? key, required this.imageUrl, required this.index})
      : super(key: key);

  final String imageUrl;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 24,
            height: 24,
            child: Image(
              image: AssetImage(imageUrl),
              color: context.watch<PageCubit>().state == index
                  ? kGreenDarkColor
                  : kBlackColor,
            ),
          ),
          Container(
            width: 24,
            height: 2,
            color: context.read<PageCubit>().state == index
                ? kGreenDarkColor
                : Colors.transparent,
          )
        ],
      ),
    );
  }
}
