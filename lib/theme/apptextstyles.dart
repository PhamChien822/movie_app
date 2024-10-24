import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle{
  //font
 static final TextStyle baseTextStyle = GoogleFonts.urbanist(fontSize: 30);
 static final TextStyle bigNameScreen = GoogleFonts.urbanist(fontSize:30,fontWeight: FontWeight.bold);
 static final TextStyle detailScreen = GoogleFonts.urbanist(fontSize: 15,color:  Colors.grey);
 static final TextStyle hintTextStyle =
  GoogleFonts.urbanist(fontSize: 15, color: Colors.grey);
 static final TextStyle buttonTextStyle =
  GoogleFonts.urbanist(fontSize: 15, color: Colors.white,fontWeight: FontWeight.bold);
 static final TextStyle footerTextAuthenticationStyle =GoogleFonts.urbanist(fontSize: 15,color: Colors.grey);
}