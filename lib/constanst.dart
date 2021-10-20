import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color kBackgroundColor = Color(0xFFFAFAFA);
Color kBlackColor = Color(0xFF181818);
Color kGreenLightColor = Color(0xFF2ECC71);
Color kGreenDarkColor = Color(0xFF27AE60);
Color kLightColor = Color(0xFF979797);
Color kGreyColor = Color(0xFFAFAFAF);
Color kWhiteColor = Color(0xFFF3F3F3);

TextStyle blackTextStyle = GoogleFonts.inter(
  color: kBlackColor,
);

TextStyle lightTextStyle = GoogleFonts.inter(
  color: kLightColor,
);

TextStyle whiteTextStyle = GoogleFonts.inter(
  color: Color(0xFFFFFFFF),
);

TextStyle greyTextStyle = GoogleFonts.inter(
  color: kLightColor,
);

TextStyle greenTextStyle = GoogleFonts.inter(
  color: kGreenDarkColor,
);

double defaultMargin = 24.0;

FontWeight light = FontWeight.w300;
FontWeight reguler = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;
