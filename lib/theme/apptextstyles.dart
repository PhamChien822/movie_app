import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/theme/appcolors.dart';

class AppTextStyle {
  //font
  static final TextStyle baseTextStyle = GoogleFonts.urbanist(fontSize: 30);
  static final TextStyle bigNameScreen = GoogleFonts.urbanist(
      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);

  static final TextStyle detailScreen = GoogleFonts.urbanist(
      fontSize: 14,
      color: AppColors.textTitleSmall,
      fontWeight: FontWeight.w700);

  static final TextStyle hintTextStyle =
      GoogleFonts.urbanist(fontSize: 15, color: Colors.grey);
  static final TextStyle headerDetailTextStyle = GoogleFonts.urbanist(
      fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w400);
  static final TextStyle inputFeildTextStyle = GoogleFonts.urbanist(
      fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600);

  static final TextStyle buttonTextStyle = GoogleFonts.urbanist(
      fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold);

  static final TextStyle footerTextAuthenticationStyle =
      GoogleFonts.urbanist(fontSize: 15, color: Colors.grey);

  static final TextStyle otpTextStyle = GoogleFonts.urbanist(
    fontSize: 20.0,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle errorAuthTextStyle = GoogleFonts.urbanist(
      fontSize: 14, color: Colors.red, fontWeight: FontWeight.w700);
}
