import 'package:flutter/material.dart';

import '../../../theme/appcolors.dart';
import '../../../theme/apptextstyles.dart';

class AppButtonLogin extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const AppButtonLogin(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Đặt chiều rộng đầy đủ
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Đặt bán kính bo tròn
          ),
          padding: EdgeInsets.symmetric(vertical: 15), // Đặt padding cho button
          elevation: 0, // Đặt độ cao của button là 0 để không có viền bóng
        ),
        onPressed: onPressed,
        child: Text(
         text,
          style: AppTextStyle.buttonTextStyle,
        ),
      ),
    );
  }
}
