import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/views/widgets/blockicons.dart';
import 'package:movie_app/theme/appcolors.dart';
import 'package:movie_app/theme/apptextstyles.dart';

import '../widgets/appbutton.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  //TextEditing controller

  final List<TextEditingController> _listOTPBlockController = List.generate(
    4,
    (index) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height; // Chiều cao màn hình  Padding(
    final width = size.width;
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
                      GoRouter.of(context).go('/');
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
              OtpTextField(
                numberOfFields: 4,
                borderColor: AppColors.borderColor,
                fieldWidth: width * 0.18,
                fieldHeight: height * 0.07,
                borderWidth: 2,
               margin: EdgeInsets.only(right: width*0.045) ,
               borderRadius: BorderRadius.circular(8),
               focusedBorderColor: AppColors.borderColor,
                showFieldAsBox: true,
                onCodeChanged: (String code) {
                  // Handle validation or checks here if necessary
                },
                onSubmit: (String verificationCode) {
                  // Handle OTP submission
                  print("OTP is $verificationCode");
                }, // end onSubmit
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Center(
                    child: AppButtonLogin(
                        text: "Reset Password", onPressed: () {})),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
