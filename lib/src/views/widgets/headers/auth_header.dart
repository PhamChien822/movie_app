import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/constants/auth_constants.dart';
import 'package:provider/provider.dart';

import '../../../../providers/themeprovider.dart';
import '../../../router/nameroute.dart';
import '../appbutton.dart';

class AuthHeader extends StatelessWidget {
  final String nameRoute;
  final String headerText;
  final String detailText;
  const AuthHeader({super.key, required this.nameRoute, required this.headerText, required this.detailText});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Column(
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: AppButtonBackArrow(
              onPressed: () {
                context.go(NameRoute.homeScreen);
              },
            )),
        Padding(
          padding:  EdgeInsets.only(top: 28,right: 5,bottom: detailText !='' ?0:28 ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(headerText,
                style: themeProvider.currentTheme.textTheme.bodyLarge),
          ),
        ),
       detailText != '' ? Padding(
          padding: const EdgeInsets.only( bottom: 28,right: 5),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(detailText,
                style: themeProvider.currentTheme.textTheme.headlineSmall),
          ),
        ):Container(),
      ],
    );
  }
}
