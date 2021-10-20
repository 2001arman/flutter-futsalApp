import 'package:flutter/material.dart';

class ContainerIcon extends StatelessWidget {
  const ContainerIcon({
    Key? key,
    required this.imageUrl,
    this.isActive = false,
    this.color = Colors.black,
  }) : super(key: key);

  final String imageUrl;
  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      child: Image(
        image: AssetImage(imageUrl),
        color: color,
      ),
    );
  }
}
