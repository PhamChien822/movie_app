import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../theme/appcolors.dart';
import '../../../theme/apptextstyles.dart';

Widget footerAuthentication(){
  return
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

                },
            ),
          ],
        ),
      ),
    );
}