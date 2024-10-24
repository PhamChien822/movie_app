import 'package:flutter/material.dart';
import 'package:movie_app/theme/appcolors.dart';
import 'package:movie_app/theme/apptextstyles.dart';
Widget textFieldItem(String label, String hintText, String? errorText,
    TextEditingController controller, Function onChanged, bool isValid,
    {bool isPasswordFeild = false}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            // Để áp dụng màu nền
            fillColor:AppColors.backgroundInputFieldColor,
            hintStyle:AppTextStyle.hintTextStyle,
            errorText: errorText == "" ? null : errorText,

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), // Bo tròn góc viền
              borderSide: BorderSide(
                color:AppColors.borderColor, // Màu viền khi chưa focus
                width: 2, // Độ dày viền
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), // Bo tròn góc viền
              borderSide: BorderSide(
                color: AppColors.borderColor, // Màu viền khi chưa focus
                width: 2, // Độ dày viền
              ),
            ),
          ),
        ),
      )
    ],
  );
}