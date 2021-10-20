import 'package:demo_futsalapp/constanst.dart';
import 'package:demo_futsalapp/widgets/container_icon.dart';
import 'package:demo_futsalapp/widgets/field_card.dart';
import 'package:demo_futsalapp/widgets/navbar_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget topBar() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: defaultMargin,
        ),
        width: double.infinity,
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/image_profile.png"),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, Ananda Faris",
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/icon_location.png"),
                        ),
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      "West Street, Samarinda",
                      style: lightTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: reguler,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Spacer(),
            ContainerIcon(imageUrl: "assets/icon_notification.png"),
          ],
        ),
      );
    }

    Widget searchSection() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kamu pengen\nmain futsal dimana?",
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: defaultMargin),
              width: double.infinity,
              height: 35,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 50,
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Cari lapangan futsal...",
                  hintStyle: lightTextStyle.copyWith(fontSize: 14),
                  border: InputBorder.none,
                  suffixIcon: Container(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    child: Image(
                      image: AssetImage("assets/icon_search.png"),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget contentSection() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Note: Section terakhir kali dibooking
            Container(
              margin: EdgeInsets.only(left: defaultMargin),
              child: Text(
                "Terakhir kali dibooking",
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(bottom: 24),
              child: Row(
                children: [
                  SizedBox(width: defaultMargin),
                  FieldCard(
                    imageUrl: "assets/image_futsal1.png",
                    name: "Centro Futsal",
                    description: "10x booking",
                  ),
                  FieldCard(
                    imageUrl: "assets/image_futsal2.png",
                    name: "Champion Futsal",
                    description: "2x booking",
                  ),
                  FieldCard(
                    imageUrl: "assets/image_futsal3.png",
                    name: "Lucky Futsal",
                    description: "4x booking",
                  ),
                ],
              ),
            ),
            // Note: Section lapangan terdekat
            Container(
              margin: EdgeInsets.only(left: defaultMargin),
              child: Text(
                "Lapangan terdekat",
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(bottom: 24),
              child: Row(
                children: [
                  SizedBox(width: defaultMargin),
                  FieldCard(
                    imageUrl: "assets/image_futsal2.png",
                    name: "Centro Futsal",
                    description: "1.5 Km",
                  ),
                  FieldCard(
                    imageUrl: "assets/image_futsal3.png",
                    name: "Lucky Futsal",
                    description: "2 Km",
                  ),
                  FieldCard(
                    imageUrl: "assets/image_futsal1.png",
                    name: "Campion Futsal",
                    description: "2.2 Km",
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget myBottomNavbar() {
      return Container(
        width: double.infinity,
        height: 45,
        margin: EdgeInsets.all(defaultMargin),
        padding: EdgeInsets.only(left: 28, right: 28, top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 8),
              blurRadius: 50,
              color: Colors.black.withOpacity(0.15),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavbarItem(
              imageUrl: "assets/icon_home.png",
              isActive: true,
            ),
            NavbarItem(imageUrl: "assets/icon_document.png"),
            NavbarItem(imageUrl: "assets/icon_bookmark.png"),
            NavbarItem(imageUrl: "assets/icon_setting.png"),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  topBar(),
                  searchSection(),
                  contentSection(),
                  SizedBox(height: 60),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: myBottomNavbar(),
            ),
          ],
        ),
      ),
    );
  }
}
