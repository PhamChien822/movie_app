import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
Widget blockIcon(String sgvUrl) {
  final Color borderColor = HexColor("#e8ecf4");
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor, width: 2)),
    child: SvgPicture.asset(
      sgvUrl,
      // Replace with actual SVG URL
      height: 24,
    ),
  );
}
Widget blockOTPField(TextEditingController controller) {
  final Color borderColor = HexColor("#e8ecf4");
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),

    decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor, width: 2)),
    child: TextField(
      controller: controller,

    )
  );
}
