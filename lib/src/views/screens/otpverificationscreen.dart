import 'package:flutter/material.dart';
import 'package:movie_app/src/router/nameroute.dart';
import 'package:movie_app/src/views/widgets/otp_input_feild.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/theme/appcolors.dart';
import 'package:movie_app/theme/apptextstyles.dart';
import 'package:provider/provider.dart';

import '../../../providers/themeprovider.dart';
import '../widgets/appbutton.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkMode = themeProvider.isDarkMode;
    Color borderColor =
        isDarkMode ? AppColors.darkBorderOTPField : AppColors.borderColor;
    Color borderActiveColor =
        isDarkMode ? AppColors.darkBorderActive : AppColors.borderActive;
    Color backgroundColor = isDarkMode
        ? AppColors.darkBackgroundOTPField
        : AppColors.backgroundInputFieldColor;
    Color backgroundActiveColor = isDarkMode ? AppColors.darkBackgroundOTPField : Colors.white;
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: AppButtonBackArrow(
                  onPressed: () {
                    context.go(NameRoute.loginScreen);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('OTP Verification',
                      style: AppTextStyle.bigNameScreen),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 28),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                      "Enter the verification code we just sent on your email address.",
                      style: AppTextStyle.detailScreen),
                ),
              ),
              OtpInputFeild(backgroundColor: backgroundColor,backgroundActiveColor: backgroundActiveColor,borderActiveColor: borderActiveColor,borderColor: borderColor,)
            ],
          ),
        ]),
      ),
    );
  }
}
