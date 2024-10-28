import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/router/nameroute.dart';
import 'package:movie_app/src/views/screens/loginscreen.dart';
import 'package:movie_app/src/views/widgets/appbutton.dart';
import 'package:movie_app/theme/apptextstyles.dart';



class SuccessPasswordChangeScreen extends StatelessWidget {
  const SuccessPasswordChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Green checkmark icon
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 60,
                ),
              ),
              SizedBox(height: 30),

              // "Password Changed!" Text
              Text(
                'Password Changed!',
                style: AppTextStyle.baseTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              // "Your password has been changed successfully." Text
              Text(
                'Your password has been changed successfully.',
                style: AppTextStyle.detailScreen,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 40),

              // "Back to Login" button
              AppButtonLogin(
                  text: "Back to Login",
                  onPressed: () {
                    context.go(NameRoute.loginScreen);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
