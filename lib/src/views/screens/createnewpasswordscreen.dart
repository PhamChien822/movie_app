
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/views/widgets/textfielditem.dart';
import 'package:movie_app/theme/appcolors.dart';
import 'package:movie_app/theme/apptextstyles.dart';

import '../widgets/appbutton.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
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
                      GoRouter.of(context).go('/');    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Create new Password',
                      style: AppTextStyle.bigNameScreen),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 28),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                      "Your new password must be unique from those previously used",
                      style: AppTextStyle.detailScreen),
                ),
              ),
              textFieldItem("Email", "New Password", _errorEmailText,
                  _emailController, _validateInputs, _isEmailValid),
              textFieldItem("Password", "Confirm Password", _errorPasswordText,
                  _passwordController, _validateInputs, _isPasswordValid,
                  isPasswordFeild: true),
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
