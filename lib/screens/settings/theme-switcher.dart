import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';

class ThemeSwitcher extends StatelessWidget {
  final AdaptiveThemeMode theme;
  const ThemeSwitcher({Key key, this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DayNightSwitcher(
        isDarkModeEnabled: theme.isDark,
        onStateChanged: (isDarkModeEnabled) {
          isDarkModeEnabled
              ? AdaptiveTheme.of(context).setLight()
              : AdaptiveTheme.of(context).setDark();
        },
      ),
    );
  }
}
