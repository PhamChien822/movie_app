import 'package:flutter/material.dart';
import 'package:movie_app/theme/appcolors.dart';
import 'package:movie_app/theme/apptextstyles.dart';

String? validateName(String? name) {
  if (name == null || name.isEmpty) {
    return 'Name cannot be empty.';
  }
  return null;
}

String? validateEmail(String? email) {
  if (email == null || email.isEmpty) {
    return 'Email cannot be empty.';
  }

  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegex.hasMatch(email)) {
    return 'Email is not in the correct format.';
  }

  return null;
}

String? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return 'Password cannot be empty.';
  }

  if (password.length < 8) {
    return 'The password must be at least 8 characters long.';
  }

  final RegExp hasUppercase = RegExp(r'[A-Z]');
  if (!hasUppercase.hasMatch(password)) {
    return 'The password must contain at least one uppercase letter.';
  }

  final RegExp hasLowercase = RegExp(r'[a-z]');
  if (!hasLowercase.hasMatch(password)) {
    return 'The password must contain at least one lowercase letter.';
  }

  final RegExp hasDigit = RegExp(r'\d');
  if (!hasDigit.hasMatch(password)) {
    return 'The password must contain at least one number.';
  }

  final RegExp hasSpecialCharacter = RegExp(r'[!@#\$&*~]');
  if (!hasSpecialCharacter.hasMatch(password)) {
    return "The password must contain at least one special character(!, @, #, \$, &, *, ~).";
  }

  return null;
}

String? validateConfirmPassword(String? password, String? confirmPassword) {
  if (confirmPassword == null || confirmPassword.isEmpty) {
    return 'Confirm password cannot be empty.';
  }

  if (password != confirmPassword) {
    return 'Passwords do not match.';
  }

  return null;
}

class TextFieldItem extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPasswordField;
  final bool isConfirmPassword;
  final bool isEmail;
  final TextEditingController? passwordController;
  final ValueChanged<bool>? onValidate;

  const TextFieldItem({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPasswordField = false,
    this.isConfirmPassword = false,
    this.isEmail = false,
    this.passwordController,
    this.onValidate,
  });

  @override
  State<TextFieldItem> createState() => TextFieldItemState();
}

class TextFieldItemState extends State<TextFieldItem> {
  String? errorText;

  void _validateInput(String value) {
    setState(() {
      if (!widget.isEmail &&
          !widget.isPasswordField &&
          !widget.isConfirmPassword) {
        errorText = validateName(widget.controller.text);
        widget.onValidate?.call(errorText == null);
        return;
      }
     else if (widget.isEmail &&
          !widget.isPasswordField &&
          !widget.isConfirmPassword) {
        errorText = validateEmail(widget.controller.text);
        widget.onValidate?.call(errorText == null);
        return;
      }
    else  if (!widget.isEmail &&
          widget.isPasswordField &&
          !widget.isConfirmPassword) {
        errorText = validatePassword(widget.controller.text);
        widget.onValidate?.call(errorText == null);
        return;
      }
     else if (!widget.isEmail &&
          !widget.isPasswordField &&
          widget.isConfirmPassword) {
        errorText  = validateConfirmPassword(
          widget.passwordController?.text,
          widget.controller.text,
        );

        widget.onValidate?.call(errorText == null);
        return;
      }
      // Notify validation status
      widget.onValidate?.call(errorText == null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: widget.controller,
        onChanged: _validateInput,
        obscureText: widget.isPasswordField || widget.isConfirmPassword,
        keyboardType: TextInputType.emailAddress,
        style: AppTextStyle.inputFeildTextStyle,
        decoration: InputDecoration(
          hintText: widget.hintText,
          filled: true,
          fillColor: AppColors.backgroundInputFieldColor,
          hintStyle: AppTextStyle.hintTextStyle,
          suffixStyle: AppTextStyle.hintTextStyle,
          errorText: errorText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.borderColor,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.borderColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
