import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/providers/themeprovider.dart';
import 'package:movie_app/theme/appcolors.dart';
import 'package:movie_app/theme/apptextstyles.dart';
import 'package:provider/provider.dart';

Widget cardIcon(String sgvUrl, BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context);
  final cardTheme = themeProvider.currentTheme.cardTheme;
  return Card(
    color: cardTheme.color,
    //
    shape: cardTheme.shape,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      child: SvgPicture.asset(
        sgvUrl,
        // Replace with actual SVG URL
        height: 24,
      ),
    ),
  );
}



