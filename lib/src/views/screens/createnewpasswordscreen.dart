import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/constants/auth_costants.dart';
import 'package:movie_app/src/router/nameroute.dart';
import 'package:movie_app/src/views/widgets/headers/auth_header.dart';
import 'package:movie_app/theme/appcolors.dart';
import 'package:movie_app/theme/apptextstyles.dart';

import '../widgets/appbutton.dart';
import '../widgets/textfielditem.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  //TextEditing controller

  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool isPasswordValid = false;
  bool isConfirmPasswordValid = false;

  _updateSubmitButtonState() {
    setState(() {});
  }

  bool get isFormValid => isPasswordValid && isConfirmPasswordValid;

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
              AuthHeader(
                  nameRoute: NameRoute.loginScreen,
                  headerText: AuthConstants.headerTextCreatePassword,
                  detailText: AuthConstants.headerDetailTextCreatePassword),
              TextFieldItem(
                hintText: "New Password",
                controller: _passwordController,
                isPasswordField: true,
                onValidate: (isValid) {
                  isPasswordValid = isValid;
                  _updateSubmitButtonState();
                },
              ),
              TextFieldItem(
                hintText: "Confirm Password",
                controller: _confirmPasswordController,
                isConfirmPassword: true,
                passwordController: _passwordController,
                onValidate: (isValid) {
                  isConfirmPasswordValid = isValid;
                  _updateSubmitButtonState();
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Center(
                    child: AppButtonLogin(
                        text: "Reset Password",
                        onPressed: isFormValid
                            ? () {
                                context
                                    .go(NameRoute.successPasswordChangeScreen);
                              }
                            : null)),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
