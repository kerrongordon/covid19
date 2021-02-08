import 'package:flutter/material.dart';

mixin LightTheme {
  static final ThemeData theme = _lightTheme();
  static const Color lightPrimary = Color.fromRGBO(69, 41, 129, 1.0);
  static const Color lightBackground = Color.fromRGBO(238, 247, 244, 1.0);
  static const Color frontColor = Color.fromRGBO(107, 124, 147, 1.0);
  static const Color cardColor = Color.fromRGBO(255, 255, 255, 1.0);

  static ThemeData _lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: lightBackground,
      splashColor: lightBackground,
      appBarTheme: const AppBarTheme(
        brightness: Brightness.light,
        color: lightBackground,
        iconTheme: IconThemeData(
          color: frontColor,
        ),
        actionsIconTheme: IconThemeData(
          color: frontColor,
        ),
      ),
      iconTheme: const IconThemeData(
        color: frontColor,
      ),
      primaryIconTheme: const IconThemeData(
        color: frontColor,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: lightPrimary,
      ),
      canvasColor: lightBackground,
      brightness: Brightness.light,
      backgroundColor: lightBackground,
      cardTheme: CardTheme(
        elevation: 3,
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      primaryColor: lightPrimary,
      primaryColorLight: frontColor,
      primaryColorBrightness: Brightness.light,
      primaryTextTheme: const TextTheme(
        bodyText1: TextStyle(color: frontColor),
        bodyText2: TextStyle(color: frontColor),
        subtitle1: TextStyle(color: frontColor),
        subtitle2: TextStyle(color: frontColor),
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: frontColor,
          fontSize: 16,
        ),
        bodyText2: TextStyle(color: frontColor),
        subtitle1: TextStyle(color: frontColor),
        subtitle2: TextStyle(color: frontColor),
      ),
      accentColor: lightPrimary,
      inputDecorationTheme: const InputDecorationTheme(
        prefixStyle: TextStyle(
          color: frontColor,
        ),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: lightBackground,
      ),
    );
  }
}
