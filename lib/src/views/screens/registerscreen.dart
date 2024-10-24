import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/src/views/screens/homescreen.dart';
import 'package:movie_app/src/views/screens/loginscreen.dart';
import 'package:movie_app/src/views/widgets/blockicons.dart';
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
  final _passwordRetypeController = TextEditingController();

  //validate
  bool _isNameValid = false;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _isRetypePasswordValid = false;

  //error text
  String? _errorNameText;

  String? _errorEmailText;

  String? _errorPasswordText;

  String? _errorRetypePasswordText;

  void _validateInputs() {
    setState(() {
      _isNameValid = _nameController.text.isNotEmpty;
      _isEmailValid = _emailController.text.contains('@');
      _isPasswordValid = _passwordController.text.length >= 8;
    });
  }

  void _validateRetypePassword() {
    setState(() {
      _isRetypePasswordValid =
          _passwordController.text == _passwordRetypeController.text &&
              _isPasswordValid == true;
    });
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
            padding:  EdgeInsets.symmetric(horizontal: width *0.05, vertical:  height*0.014),
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: height*0.05,
                  width: height*0.05,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(8)),
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

              SizedBox(
                  width: 50,
                  height: 50,
                  child: SvgPicture.asset("images/icons/tick_check_icon.svg",)),

              Padding(
                padding:  EdgeInsets.only(top: height*0.03, bottom: height*0.03, right: 0.2*width),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Hello, Register to get started',
                      style: AppTextStyle.bigNameScreen),
                ),
              ),
              textFieldItem("Name", "Enter your name", _errorNameText,
                  _nameController, _validateInputs, _isNameValid),
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
              textFieldItem(
                  "Retype Password",
                  "Enter your retype password",
                  _errorRetypePasswordText,
                  _passwordRetypeController,
                  _validateRetypePassword,
                  _isRetypePasswordValid,
                  isPasswordFeild: true),
              Padding(
                padding: const EdgeInsets.only(
                    top: 30.0), // Khoảng cách trước nút Sign-Up
                child: Center(
                    child: AppButtonLogin(text: "Register", onPressed: () {})),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0.04*height, horizontal: 0.01*width),
                // Khoảng cách cho chữ "or"
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 2,
                      color: AppColors.borderColor,
                    )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.01*width),
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
                    blockIcon('assets/images/logos/google.svg'),
                    blockIcon('assets/images/logos/facebook.svg'),
                    blockIcon('assets/images/logos/gmail.svg')
                  ],
                ),
              SizedBox(
                height: height * 0.04,
              ),
              Padding(
                padding:  EdgeInsets.only(bottom: height*0.03),
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
