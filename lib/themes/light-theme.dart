import 'package:flutter/material.dart';

class LightTheme {
  static final ThemeData theme = _lightTheme();
  static final Color lightPrimary = const Color.fromRGBO(243, 115, 41, 1.0);
  static final Color lightBackground = const Color.fromRGBO(236, 240, 241, 1.0);
  static final Color frontColor = const Color.fromRGBO(107, 124, 147, 1.0);

  static ThemeData _lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: lightBackground,
      splashColor: lightBackground,
      appBarTheme: AppBarTheme(
        brightness: Brightness.light,
        color: lightBackground,
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
        backgroundColor: lightPrimary,
      ),
      canvasColor: lightBackground,
      brightness: Brightness.light,
      backgroundColor: lightBackground,
      cardTheme: CardTheme(
        elevation: 3,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      primaryColor: lightPrimary,
      primaryColorLight: frontColor,
      primaryColorBrightness: Brightness.light,
      primaryTextTheme: TextTheme(
        bodyText1: TextStyle(color: frontColor),
        bodyText2: TextStyle(color: frontColor),
        subtitle1: TextStyle(color: frontColor),
        subtitle2: TextStyle(color: frontColor),
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: frontColor,
          fontSize: 16,
        ),
        bodyText2: TextStyle(color: frontColor),
        subtitle1: TextStyle(color: frontColor),
        subtitle2: TextStyle(color: frontColor),
      ),
      accentColor: lightPrimary,
      inputDecorationTheme: InputDecorationTheme(
        prefixStyle: TextStyle(
          color: frontColor,
        ),
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: lightBackground,
      ),
    );
  }
}
