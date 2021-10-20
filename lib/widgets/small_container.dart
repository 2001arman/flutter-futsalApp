import 'package:demo_futsalapp/constanst.dart';
import 'package:demo_futsalapp/widgets/small_icon.dart';
import 'package:flutter/material.dart';

class SmallContainer extends StatelessWidget {
  const SmallContainer(
      {Key? key,
      required this.imageUrl,
      required this.title,
      this.isActive = false})
      : super(key: key);

  final String imageUrl, title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 73,
      height: 36,
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isActive ? kBlackColor : kBackgroundColor,
        border: Border.all(color: Colors.transparent),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 9),
            blurRadius: 10,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmallIcon(imageUrl: imageUrl),
          SizedBox(width: 5),
          Text(
            title,
            style: isActive
                ? whiteTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: semiBold,
                  )
                : blackTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: semiBold,
                  ),
          )
        ],
      ),
    );
  }
}
