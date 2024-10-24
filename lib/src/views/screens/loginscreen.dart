import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/src/views/screens/forgotpasswordscreen.dart';
import 'package:movie_app/src/views/screens/homescreen.dart';
import 'package:movie_app/src/views/screens/registerscreen.dart';
import 'package:movie_app/src/views/widgets/blockicons.dart';
import 'package:movie_app/src/views/widgets/textfielditem.dart';
import 'package:movie_app/theme/appcolors.dart';
import 'package:movie_app/theme/apptextstyles.dart';

import '../widgets/appbutton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //TextEditing controller

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //validate

  bool _isEmailValid = false;
  bool _isPasswordValid = false;

  //error text

  String? _errorEmailText;

  String? _errorPasswordText;

  void _validateInputs() {
    setState(() {
      _isEmailValid = _emailController.text.contains('@');
      _isPasswordValid = _passwordController.text.length >= 8;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height; // Chiều cao màn hình  Padding(

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
                      borderRadius: BorderRadius.circular(15)),
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
                padding: const EdgeInsets.only(top: 28, bottom: 28, right: 83),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Welcome back! Glad to see you, Again ',
                      style: AppTextStyle.bigNameScreen),
                ),
              ),
              textFieldItem("Email", "Enter your email", _errorEmailText,
                  _emailController, _validateInputs, _isEmailValid),
              textFieldItem(
                  "Password",
                  "Enter your password",
                  _errorPasswordText,
                  _passwordController,
                  _validateInputs,
                  _isPasswordValid,
                  isPasswordFeild: true),
              Align(
                alignment: Alignment.centerRight,
                child: RichText(
                  text: TextSpan(
                    text: 'Forgot Password',
                    style: TextStyle(
                      color: Colors.grey, // Color for "Login Now"
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => ForgotPasswordScreen()),
                        );
                      },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Center(
                    child: AppButtonLogin(text: "Login", onPressed: () {})),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 35, horizontal: 4),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 2,
                      color: AppColors.borderColor,
                    )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text('or Register with',
                          style: AppTextStyle.baseTextStyle
                              .copyWith(color: Colors.grey, fontSize: 15)),
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
                  blockIcon('assets/images/logos/google.svg'),
                  blockIcon('assets/images/logos/facebook.svg'),
                  blockIcon('assets/images/logos/gmail.svg')
                ],
              ),
              SizedBox(
                height: height * 0.23,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: AppTextStyle.footerTextAuthenticationStyle,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Register Now',
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
              )
            ],
          ),
        ]),
      ),
    );
  }
}
