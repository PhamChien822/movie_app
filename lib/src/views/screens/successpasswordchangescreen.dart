import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/providers/themeprovider.dart';
import 'package:movie_app/src/router/nameroute.dart';
import 'package:movie_app/src/views/widgets/appbutton.dart';
import 'package:provider/provider.dart';

class SuccessPasswordChangeScreen extends StatelessWidget {
  final String headerText;
  final String detailText;

  const SuccessPasswordChangeScreen(
      {super.key, required this.headerText, required this.detailText});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.currentTheme.scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
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
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // "Password Changed!" Text
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text('Password Changed!',
                            style:
                                themeProvider.currentTheme.textTheme.bodyLarge),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10,bottom: 40),
                        child: Text(
                          'Your password has been changed successfully.',
                          style: themeProvider
                              .currentTheme.textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                      ),


                    ],
                  )),

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
