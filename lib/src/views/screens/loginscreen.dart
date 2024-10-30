import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:movie_app/providers/themeprovider.dart';
import 'package:movie_app/src/router/nameroute.dart';
import 'package:movie_app/src/views/screens/registerscreen.dart';
import 'package:movie_app/src/views/widgets/cardicons.dart';
import 'package:movie_app/src/views/widgets/textfielditem.dart';
import 'package:movie_app/theme/appcolors.dart';
import 'package:movie_app/theme/apptextstyles.dart';
import 'package:provider/provider.dart';

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

  bool get isValidForm => _isEmailValid && _isPasswordValid;

  //error text

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height; // Chiều cao màn hình  Padding(
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: themeProvider.toggleTheme,
          ),
        ],
      ),
      body: KeyboardDismisser(
        child: SafeArea(
          child: Stack(children: [
            ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: AppButtonBackArrow(
                      onPressed: () {
                        context.go(NameRoute.homeScreen);
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 28, bottom: 28, right: 83),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Welcome back! Glad to see you, Again ',
                        style: ThemeProvider.changeTheme(context)),
                  ),
                ),
                TextFieldItem(
                  hintText: "Enter your email",
                  controller: _emailController,
                  isEmail: true,
                  onValidate: (isValid) {
                    _isEmailValid = isValid;
                    setState(() {});
                  },
                ),
                TextFieldItem(
                  hintText: "Enter your password",
                  controller: _passwordController,
                  isPasswordField: true,
                  onValidate: (isValid) {
                    _isPasswordValid = isValid;
                    setState(() {});
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: RichText(
                    text: TextSpan(
                      text: 'Forgot Password',
                      style: themeProvider.currentTheme.textTheme.titleSmall,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.go(NameRoute.forgotPasswordScreen);
                        },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Center(
                      child: AppButtonLogin(
                          text: "Login",
                          onPressed: isValidForm
                              ? () {
                                  context.go(NameRoute.homeScreen);
                                }
                              : null)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 35, horizontal: 4),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 2,
                        color: themeProvider.currentTheme.dividerColor,
                      )),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text('or Register with',
                            style:
                                themeProvider.currentTheme.textTheme.titleSmall),
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 2,
                        color: themeProvider.currentTheme.dividerColor,
                      )),
                    ],
                  ),
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
                              context.go(NameRoute.registerScreen);
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
      ),
    );
  }
}
