import 'package:flutter/material.dart';

mixin DarkTheme {
  static final ThemeData theme = _lightTheme();
  static final Color darkPrimary = Colors.deepPurpleAccent;
  static const Color darkBackground = Color.fromRGBO(23, 27, 30, 1.0);
  static final Color frontColor = Colors.white70;
  static const Color cardColor = Color.fromRGBO(27, 35, 47, 1.0);

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
      accentColor: darkPrimary,
      inputDecorationTheme: InputDecorationTheme(
        prefixStyle: TextStyle(
          color: frontColor,
        ),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: darkBackground,
      ),
      dividerTheme: DividerThemeData(
        color: Colors.grey[800],
      ),
    );
  }
}
