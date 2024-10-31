import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/constants/auth_costants.dart';
import 'package:movie_app/src/router/nameroute.dart';
import 'package:movie_app/src/views/widgets/footers/auth_footer.dart';
import 'package:movie_app/src/views/widgets/headers/auth_header.dart';
import 'package:movie_app/src/views/widgets/textfielditem.dart';
import 'package:movie_app/theme/appcolors.dart';
import 'package:movie_app/theme/apptextstyles.dart';
import 'package:toastification/toastification.dart';

import '../widgets/appbutton.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  //TextEditing controller

  final _emailController = TextEditingController();

  //validate
  bool isConfirmEmailValid = false;

  //size
  final double borderRadiusValue = 8;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height; // Chiều cao màn hình
    final width = size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
            children: [
              AuthHeader(
                  nameRoute: NameRoute.loginScreen,
                  headerText: AuthConstants.headerTextForgotPassword,
                  detailText: AuthConstants.headerDetailTextForgotPassword),
              TextFieldItem(
                hintText: "Enter your email",
                controller: _emailController,
                isEmail: true,
                onValidate: (isValid) {
                  isConfirmEmailValid = isValid;
                  setState(() {});
                },
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 0.03 * height), // Khoảng cách trước nút Sign-Up
                child: Center(
                    child: AppButtonLogin(
                        text: "Send Code",
                        onPressed: isConfirmEmailValid
                            ? () => sendCodeVerify(context)
                            : null)),
              ),
              SizedBox(height: height * 0.47),
              AuthFooter(
                  nameRoute: NameRoute.loginScreen,
                  beginText: AuthConstants.footerBeginTextForgotPassword,
                  endText: AuthConstants.footerEndTextForgotPassword)
            ],
          ),
        ]),
      ),
    );
  }

  Future<void> sendCodeVerify(BuildContext context) async {
    final currentContext = context;
    toastification.show(
      context: context,
      // optional if you use ToastificationWrapper
      title: Text('OTP send to your email!'),
      style: ToastificationStyle.fillColored,
      type: ToastificationType.success,
      autoCloseDuration: const Duration(seconds: 2),
    );
    await Future.delayed(Duration(seconds: 2));
    if (currentContext.mounted) {
      context.go(NameRoute.oTPVerificationScreen);
    }
  }
}
