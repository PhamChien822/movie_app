import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/constants/auth_costants.dart';
import 'package:movie_app/src/router/nameroute.dart';
import 'package:movie_app/src/views/screens/homescreen.dart';
import 'package:movie_app/src/views/screens/loginscreen.dart';
import 'package:movie_app/src/views/widgets/cardicons.dart';
import 'package:movie_app/src/views/widgets/dividers/auth_dividers.dart';
import 'package:movie_app/src/views/widgets/footers/auth_footer.dart';
import 'package:movie_app/src/views/widgets/headers/auth_header.dart';

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
              AuthHeader(
                  nameRoute: NameRoute.forgotPasswordScreen,
                  headerText: AuthConstants.headerTextRegister,
                  detailText: ''),
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
                child: AuthDividers(text: AuthConstants.dividerTextRegister),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  cardIcon('assets/images/logos/google.svg', context),
                  cardIcon('assets/images/logos/facebook.svg', context),
                  cardIcon('assets/images/logos/gmail.svg', context)
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              AuthFooter(
                  nameRoute: NameRoute.loginScreen,
                  beginText: AuthConstants.footerBeginTextRegister,
                  endText: AuthConstants.footerEndTextRegister)
            ],
          ),
        ]),
      ),
    );
  }
}
