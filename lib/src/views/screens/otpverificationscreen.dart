import 'package:flutter/material.dart';
import 'package:movie_app/src/constants/auth_costants.dart';
import 'package:movie_app/src/router/nameroute.dart';
import 'package:movie_app/src/views/widgets/footers/auth_footer.dart';
import 'package:movie_app/src/views/widgets/headers/auth_header.dart';
import 'package:movie_app/src/views/widgets/otp_input_feild.dart';
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
    Color backgroundActiveColor =
        isDarkMode ? AppColors.darkBackgroundOTPField : Colors.white;
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
            children: [
              AuthHeader(
                  nameRoute: NameRoute.loginScreen,
                  headerText: AuthConstants.headerTextOTPVerification,
                  detailText: AuthConstants.headerTextDetailOTPVerification),
              OtpInputFeild(
                backgroundColor: backgroundColor,
                backgroundActiveColor: backgroundActiveColor,
                borderActiveColor: borderActiveColor,
                borderColor: borderColor,
              ),
              SizedBox(height: height * 0.5),
              AuthFooter(
                  nameRoute: NameRoute.oTPVerificationScreen,
                  beginText: AuthConstants.footerBeginTextOTPVerification,
                  endText: AuthConstants.footerEndTextOTPVerification)
            ],
          ),
        ]),
      ),
    );
  }
}
