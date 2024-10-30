import 'package:flutter/material.dart';
import 'package:movie_app/providers/themeprovider.dart';
import 'package:movie_app/src/router/nameroute.dart';
import 'package:movie_app/theme/appthemes.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (_) => ThemeProvider(ThemeData.light()),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp.router(
     theme:themeProvider.currentTheme,
      themeMode: ThemeMode.system,
      darkTheme: AppThemes.darkTheme,
      debugShowCheckedModeBanner: false,
      // Set the default route
      routerConfig: NameRoute.router,
    );
  }
}
