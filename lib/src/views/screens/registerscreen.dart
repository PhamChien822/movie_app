import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/router/nameroute.dart';
import 'package:movie_app/src/views/screens/homescreen.dart';
import 'package:movie_app/src/views/screens/loginscreen.dart';
import 'package:movie_app/src/views/widgets/cardicons.dart';

import 'package:movie_app/src/views/widgets/textfielditem.dart';
import 'package:movie_app/theme/appcolors.dart';
import 'package:movie_app/theme/apptextstyles.dart';

import '../widgets/appbutton.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //TextEditing controller
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  bool isNameValid = false;
  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isConfirmPasswordValid = false;

  bool get isFormValid =>
      isNameValid && isEmailValid && isPasswordValid && isConfirmPasswordValid;

  void _updateSubmitButtonState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final double height = size.height; // Chiều cao màn hình
    final double width = size.width; //
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          ListView(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.05, vertical: height * 0.014),
            children: [
              Align(
                alignment: Alignment.topLeft,
                child:  AppButtonBackArrow(
                  onPressed: (){
                    context.go(NameRoute.loginScreen);
                  },
                ),
              ),
              SizedBox(
                  width: 50,
                  height: 50,
                  child: SvgPicture.asset(
                    "images/icons/tick_check_icon.svg",
                  )),
              Padding(
                padding: EdgeInsets.only(
                    top: height * 0.03,
                    bottom: height * 0.03,
                    right: 0.2 * width),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Hello, Register to get started',
                      style: AppTextStyle.bigNameScreen),
                ),
              ),
              TextFieldItem(
                hintText: "Enter your name",
                controller: _nameController,
                onValidate: (isValid) {
                  isNameValid = isValid;
                  _updateSubmitButtonState();
                },
              ),
              TextFieldItem(
                hintText: "Enter your email",
                controller: _emailController,
                isEmail: true,
                onValidate: (isValid) {
                  isEmailValid = isValid;
                  _updateSubmitButtonState();
                },
              ),
              TextFieldItem(
                hintText: "Enter your password",
                controller: _passwordController,
                isPasswordField: true,
                onValidate: (isValid) {
                  // print(isValid);
                  isPasswordValid = isValid;
                  _updateSubmitButtonState();
                },
              ),
              TextFieldItem(
                hintText: "Enter your confirm password",
                controller: _passwordConfirmController,
                passwordController: _passwordController,
                isConfirmPassword: true,
                onValidate: (isValid) {
                  isConfirmPasswordValid = isValid;
                  _updateSubmitButtonState();
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 30.0), // Khoảng cách trước nút Sign-Up
                child: Center(
                    child: AppButtonLogin(
                        text: "Register",
                        onPressed: isFormValid
                            ? () {
                                context
                                    .go(NameRoute.successPasswordChangeScreen);
                              }
                            : null)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 0.04 * height, horizontal: 0.01 * width),
                // Khoảng cách cho chữ "or"
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 2,
                      color: AppColors.borderColor,
                    )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.01 * width),
                      child: Text('or Register with',
                          style: AppTextStyle.baseTextStyle.copyWith(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w700)),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 2,
                      color: AppColors.borderColor,
                    )),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  cardIcon('assets/images/logos/google.svg',context),
                  cardIcon('assets/images/logos/facebook.svg',context),
                  cardIcon('assets/images/logos/gmail.svg',context)
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.03),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: AppTextStyle.footerTextAuthenticationStyle,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Login Now',
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
                                          LoginScreen()));
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
