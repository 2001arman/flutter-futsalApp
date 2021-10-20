import 'package:flutter/material.dart';

class SmallIcon extends StatelessWidget {
  const SmallIcon({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageUrl),
        ),
      ),
    );
  }
}
