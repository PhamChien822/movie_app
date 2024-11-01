import 'package:flutter/material.dart';

import 'package:movie_app/src/constants/auth_constants.dart';
import 'package:movie_app/src/router/nameroute.dart';
import 'package:movie_app/src/views/widgets/footers/auth_footer.dart';
import 'package:movie_app/src/views/widgets/headers/auth_header.dart';
import 'package:provider/provider.dart';
import '../../../providers/themeprovider.dart';
import '../widgets/test.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen>
    with WidgetsBindingObserver {
  Color borderColor = Colors.white;
  Color borderActiveColor = Colors.white;
  Color? backgroundColor = Colors.white;
  Color backgroundActiveColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    borderColor = themeProvider.currentTheme.colorScheme.secondaryContainer;
    borderActiveColor = themeProvider.currentTheme.colorScheme.onSecondaryContainer;
    backgroundColor = themeProvider.currentTheme.inputDecorationTheme.fillColor;
    backgroundActiveColor = themeProvider.currentTheme.colorScheme.secondary;
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
              OTPInputFeild(
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
