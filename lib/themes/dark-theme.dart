import 'package:flutter/material.dart';

class DarkTheme {
  static final ThemeData theme = _lightTheme();
  static final Color darkPrimary = const Color.fromRGBO(204, 59, 2, 1.0);
  static final Color darkBackground = const Color.fromRGBO(23, 23, 23, 1.0);
  static final Color frontColor = Colors.white70;
  static final Color cardColor = const Color.fromRGBO(56, 58, 62, 1.0);

  static ThemeData _lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: darkBackground,
      splashColor: darkBackground,
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        color: darkBackground,
        iconTheme: IconThemeData(
          color: frontColor,
        ),
        actionsIconTheme: IconThemeData(
          color: frontColor,
        ),
      ),
      iconTheme: IconThemeData(
        color: frontColor,
      ),
      primaryIconTheme: IconThemeData(
        color: frontColor,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: darkPrimary,
      ),
      canvasColor: darkBackground,
      brightness: Brightness.light,
      backgroundColor: darkBackground,
      cardTheme: CardTheme(
        elevation: 3,
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      primaryColor: darkPrimary,
      primaryColorLight: frontColor,
      primaryColorBrightness: Brightness.dark,
      primaryTextTheme: TextTheme(
        body1: TextStyle(color: frontColor),
        body2: TextStyle(color: frontColor),
        title: TextStyle(color: frontColor),
        subtitle: TextStyle(color: frontColor),
      ),
      textTheme: TextTheme(
        body1: TextStyle(
          color: frontColor,
          fontSize: 16,
        ),
        body2: TextStyle(color: frontColor),
        title: TextStyle(color: frontColor),
        subtitle: TextStyle(color: frontColor),
      ),
      accentColor: darkPrimary,
      inputDecorationTheme: InputDecorationTheme(
        prefixStyle: TextStyle(
          color: frontColor,
        ),
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: darkBackground,
      ),
      dividerTheme: DividerThemeData(
        color: Colors.grey[800],
      ),
    );
  }
}
