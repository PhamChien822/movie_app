import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/constants/auth_constants.dart';

import '../../../../theme/appcolors.dart';
import '../../../../theme/apptextstyles.dart';
import '../../../router/nameroute.dart';

class AuthFooter extends StatelessWidget {
  final String nameRoute;
  final String beginText;
  final String endText;
  const AuthFooter({super.key, required this.nameRoute, required this.beginText, required this.endText});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: RichText(
        text: TextSpan(
          text: "$beginText ",
          style: AppTextStyle.footerTextAuthenticationStyle,
          children: <TextSpan>[
            TextSpan(
              text: endText,
              style: TextStyle(
                color: AppColors.textButtonLoginColor,
                // Color for "Login Now"
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.go(nameRoute);
                },
            ),
          ],
        ),
      ),
    );
  }
}
