import 'package:flutter/material.dart';
import 'package:movie_app/theme/apptextstyles.dart';

import 'appcolors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    bodyLarge: AppTextStyle.baseTextStyle.copyWith(color: Colors.black),
    bodyMedium: AppTextStyle.baseTextStyle.copyWith(color: Colors.black54),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blue,
    titleTextStyle: AppTextStyle.baseTextStyle.copyWith(color: Colors.white, fontSize: 20),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: AppColors.backgroundInputFieldColor,
    filled: true,
    border: OutlineInputBorder(),
  ), colorScheme: ColorScheme.light(
    primary: Colors.blue,
    secondary: Colors.orange,
    onPrimary: Colors.white,
  ).copyWith(surface: Colors.white),
);

// Các màu chủ đề cho Dark Mode
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.black,
  textTheme: TextTheme(
    bodyLarge: AppTextStyle.baseTextStyle.copyWith(color: Colors.white),
    bodyMedium: AppTextStyle.baseTextStyle.copyWith(color: Colors.white70),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[850],
    titleTextStyle: AppTextStyle.baseTextStyle.copyWith(color: Colors.black, fontSize: 20),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.grey[700],
    filled: true,
    border: OutlineInputBorder(),
  ), colorScheme: ColorScheme.dark(
    primary: Colors.blue,
    secondary: Colors.orange,
    onPrimary: Colors.black,
  ).copyWith(surface: Colors.black),
);