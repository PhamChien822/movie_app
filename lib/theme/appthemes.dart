import 'package:flutter/material.dart';

import 'appcolors.dart';
import 'apptextstyles.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.buttonColor,
      scaffoldBackgroundColor: Colors.white,
      disabledColor: AppColors.disableButtonColor,
      dividerColor: AppColors.dividerColor,
      primaryColorDark: AppColors.buttonColor,
      textTheme: TextTheme(
          bodyLarge: AppTextStyle.bigNameScreen,
          bodyMedium: AppTextStyle.inputFeildTextStyle,
          titleSmall: AppTextStyle.detailScreen,
          headlineSmall: AppTextStyle.headerDetailTextStyle),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: AppTextStyle.detailScreen,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.backgroundInputFieldColor,
        filled: true,
        hintStyle: AppTextStyle.hintTextStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.borderColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.borderColor,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.borderActive,
            width: 2,
          ),
        ),
      ),
      colorScheme: ColorScheme.light(
          primary: Colors.white,
          onPrimary: Colors.black,
          primaryContainer: AppColors.borderColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.buttonColor,
        ),
      ),
      cardTheme: CardTheme(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.borderColor, width: 2),
            borderRadius: BorderRadius.circular(8),
          )));

  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.darkBorderColor,
      dividerColor: AppColors.darkDividerColor,
      disabledColor: AppColors.darkDisableButtonColor,
      primaryColorDark: AppColors.darkButtonColor,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TextTheme(
          bodyLarge: AppTextStyle.bigNameScreen.copyWith(color: Colors.white),
          bodyMedium:
              AppTextStyle.inputFeildTextStyle.copyWith(color: Colors.white),
          titleSmall: AppTextStyle.detailScreen,
          headlineSmall: AppTextStyle.headerDetailTextStyle),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        titleTextStyle: AppTextStyle.detailScreen.copyWith(color: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.darkBackgroundInputFieldColor,
        filled: true,
        hintStyle: AppTextStyle.hintTextStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.darkBackgroundInputFieldColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.darkBackgroundInputFieldColor,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.darkBackgroundInputFieldColor,
            width: 2,
          ),
        ),
      ),
      colorScheme: ColorScheme.dark(
          primary: AppColors.buttonColor,
          onPrimary: Colors.white,
          primaryContainer: AppColors.buttonColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.buttonColor,
        ),
      ),
      cardTheme: CardTheme(
          color: Colors.black,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: AppColors.darkBackgroundInputFieldColor, width: 2),
            borderRadius: BorderRadius.circular(8),
          )));
}
