import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:covid19/routes/route-names.dart';
import 'package:covid19/routes/routes.dart';
import 'package:covid19/themes/dark-theme.dart';
import 'package:covid19/themes/light-theme.dart';
import 'package:covid19/translations/boarding-translate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode savedThemeMode;
  const MyApp({this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: savedThemeMode.isLight
            ? LightTheme.lightBackground
            : DarkTheme.darkBackground ?? LightTheme.lightBackground,
        systemNavigationBarIconBrightness: savedThemeMode.isLight
            ? Brightness.dark
            : Brightness.light ?? Brightness.dark,
      ),
    );

    return AdaptiveTheme(
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      light: LightTheme.theme,
      dark: DarkTheme.theme,
      builder: (light, dark) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: pageonetitle,
          theme: light,
          darkTheme: dark,
          initialRoute: startScreen,
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      },
    );
  }
}
