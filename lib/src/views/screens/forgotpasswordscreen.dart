import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/src/views/screens/homescreen.dart';
import 'package:movie_app/src/views/screens/registerscreen.dart';
import 'package:movie_app/src/views/widgets/textfielditem.dart';
import 'package:movie_app/theme/appcolors.dart';
import 'package:movie_app/theme/apptextstyles.dart';

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
  bool _isEmailValid = false;
  //error text
  String? _errorEmailText;
  //size
  final double borderRadiusValue= 8;
  void _validateInputs() {
    setState(() {
      _isEmailValid = _emailController.text.contains('@');

    });
  }

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
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 0.05*height,
                  width: 0.05*height,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(borderRadiusValue)),
                  child: IconButton(
                    icon:
                        SvgPicture.asset("assets/images/icons/back-arrow.svg"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => HomeScreen()));
                    },
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 0.07*height, right: width *0.22),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Forgot Password?',
                      style: AppTextStyle.bigNameScreen),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 28, right: 83),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                      "Don't worry! It occurs.Please enter the email address linked with your account.",
                      style: AppTextStyle.detailScreen),
                ),
              ),
              textFieldItem("Email", "Enter your email", _errorEmailText,
                  _emailController, _validateInputs, _isEmailValid),

              Padding(
                padding:  EdgeInsets.only(
                    top: 0.03*height), // Khoảng cách trước nút Sign-Up
                child: Center(
                    child: AppButtonLogin(text: "Send Code", onPressed: () {})),
              ),
              SizedBox(height: height*0.47),
              Align(
                alignment: Alignment.bottomCenter,
                child: RichText(
                  text: TextSpan(
                    text: "Remember Password? ",
                    style: AppTextStyle.baseTextStyle
                        .copyWith(fontSize: 15, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: AppColors.textButtonLoginColor,
                          // Color for "Login Now"
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        RegisterScreen()));
                          },
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),




        ]),
      ),
    );
  }
}
