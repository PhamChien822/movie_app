import 'package:flutter/material.dart';
import 'package:movie_app/src/router/nameroute.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // Set the default route
     routerConfig: NameRoute.router,
    );
  }
}



