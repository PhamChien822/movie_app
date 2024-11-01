import 'package:flutter/material.dart';
import 'package:movie_app/theme/appthemes.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  // Khởi tạo chế độ theme và theme hiện tại dựa trên theme hệ thống
  bool _isDarkMode;
  ThemeMode _themeMode;
  ThemeData _currentTheme;

  ThemeProvider()
      : _isDarkMode =
            WidgetsBinding.instance.platformDispatcher.platformBrightness ==
                Brightness.dark,
        _themeMode =
            WidgetsBinding.instance.platformDispatcher.platformBrightness ==
                    Brightness.dark
                ? ThemeMode.dark
                : ThemeMode.light,
        _currentTheme =
            WidgetsBinding.instance.platformDispatcher.platformBrightness ==
                    Brightness.dark
                ? AppThemes.darkTheme
                : AppThemes.lightTheme;

  bool get isDarkMode => _isDarkMode;

  ThemeData get currentTheme => _currentTheme;

  ThemeMode get themeMode => _themeMode;

  void updateThemeFromSystem(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    if (_isDarkMode != isDark) {
      _isDarkMode = isDark;
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
      _currentTheme = isDark ? AppThemes.darkTheme : AppThemes.lightTheme;
      notifyListeners();
    }
  }
}

class ThemeChangeListener extends StatefulWidget {
  final Widget child;

  const ThemeChangeListener({super.key, required this.child});

  @override
  State<ThemeChangeListener> createState() => ThemeChangeListenerState();
}

class ThemeChangeListenerState extends State<ThemeChangeListener>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // Đăng ký observer
  }

  @override
  void dispose() {
    WidgetsBinding.instance
        .removeObserver(this); // Hủy observer khi không cần thiết
    super.dispose();
  }


  // Hàm khởi tạo màu nền và viền

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();

    // Cập nhật theme hệ thống khi thay đổi
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    themeProvider.updateThemeFromSystem(brightness);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
