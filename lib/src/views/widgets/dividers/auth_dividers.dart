import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/src/constants/auth_costants.dart';
import 'package:provider/provider.dart';

import '../../../../providers/themeprovider.dart';

class AuthDividers extends StatelessWidget {
  final String text;

  const AuthDividers({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Row(
      children: [
        Expanded(
            child: Divider(
          thickness: 2,
          color: themeProvider.currentTheme.dividerColor,
        )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(text,
              style: themeProvider.currentTheme.textTheme.titleSmall),
        ),
        Expanded(
            child: Divider(
          thickness: 2,
          color: themeProvider.currentTheme.dividerColor,
        )),
      ],
    );
  }
}
