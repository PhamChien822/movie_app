import 'package:flutter/material.dart';
import 'package:movie_app/src/router/nameroute.dart';
import 'package:movie_app/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme:darkTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      // Set the default route
      routerConfig: NameRoute.router,
    );
  }
}


