import 'package:flutter/material.dart';

enum ThemePro { system, light, dark }

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;

  changeTheme(ThemePro theme) {
    switch (theme) {
      case ThemePro.system:
        _themeMode = ThemeMode.system;
        print(themeMode);
        return notifyListeners();
        break;
      case ThemePro.light:
        _themeMode = ThemeMode.light;
        print(themeMode);
        return notifyListeners();
        break;
      case ThemePro.dark:
        _themeMode = ThemeMode.dark;
        print(themeMode);
        return notifyListeners();
        break;
      default:
        _themeMode = ThemeMode.system;
        print(themeMode);
        return notifyListeners();
    }
  }
}
