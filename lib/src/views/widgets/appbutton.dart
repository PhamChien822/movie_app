import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/providers/themeprovider.dart';
import 'package:provider/provider.dart';

import '../../../theme/appcolors.dart';
import '../../../theme/apptextstyles.dart';
import '../../constants/button_size_constants.dart';
import '../../router/nameroute.dart';

class AppButtonLogin extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const AppButtonLogin(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SizedBox(
      width: double.infinity, // Đặt chiều rộng đầy đủ
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: themeProvider.currentTheme.disabledColor,
          backgroundColor: themeProvider.currentTheme.primaryColorDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Đặt bán kính bo tròn
          ),
          padding: EdgeInsets.symmetric(vertical: 17,), // Đặt padding cho button
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
class AppButtonBackArrow extends StatelessWidget {
  final VoidCallback? onPressed;

  const AppButtonBackArrow(
      {super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
  return  Container(
      height: SizeButton.backArrowSize,
      width: SizeButton.backArrowSize,
      decoration: BoxDecoration(
          color: themeProvider.currentTheme.colorScheme.primary,
          border: Border.all(color: themeProvider.currentTheme.colorScheme.primaryContainer,width: 2),
          borderRadius: BorderRadius.circular(15)),
      child: IconButton(
        icon:
        SvgPicture.asset("assets/images/icons/back-arrow.svg",colorFilter: ColorFilter.mode(
          themeProvider.currentTheme.colorScheme.onPrimary,
          BlendMode.srcIn,
        ),),
        onPressed: onPressed
      ),
    );
  }
}
