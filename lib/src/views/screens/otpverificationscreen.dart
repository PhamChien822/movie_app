import 'package:flutter/material.dart';
import 'package:movie_app/src/router/nameroute.dart';
import 'package:movie_app/src/views/widgets/otp_input_feild.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/theme/appcolors.dart';
import 'package:movie_app/theme/apptextstyles.dart';


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

    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 0.05 * height,
                  width: 0.05 * height,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(15)),
                  child: IconButton(
                    icon:
                        SvgPicture.asset("assets/images/icons/back-arrow.svg"),
                    onPressed: () {
                     context.go(NameRoute.homeScreen);
                    },
                  ),
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
              OtpInputFeild()
            ],
          ),
        ]),
      ),
    );
  }
}
