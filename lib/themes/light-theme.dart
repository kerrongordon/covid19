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
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      primaryColor: lightPrimary,
      primaryColorLight: frontColor,
      primaryColorBrightness: Brightness.light,
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
