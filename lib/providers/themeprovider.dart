import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/theme/appthemes.dart';

import '../theme/appcolors.dart';
import '../theme/apptextstyles.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData ;
  bool _isDarkMode = false;

  ThemeProvider(this._themeData);

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _isDarkMode;

  ThemeData get currentTheme => _isDarkMode ? AppThemes.darkTheme:AppThemes.lightTheme;

      static TextStyle? changeTheme(BuildContext context) {
    // print(Theme.of(context).textTheme.bodyLarge);
    return Theme.of(context).textTheme.bodyLarge;
  }

  static Color changeBorderColorCardIcon(BuildContext context) {
    return Colors.red;
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _themeData = _isDarkMode ? AppThemes.darkTheme : AppThemes.lightTheme;

    notifyListeners();
  }
}
