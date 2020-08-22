import 'package:covid19/providers/country-provider.dart';
import 'package:covid19/providers/global-provider.dart';
import 'package:covid19/screens/home/home-screen.dart';
import 'package:covid19/themes/dark-theme.dart';
import 'package:covid19/themes/light-theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return MultiProvider(
      providers: [
        Provider(create: (_) => GlobalProvider()),
        FutureProvider(create: (_) => CountryProvider().getCountry())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Covid 19 Tracker',
        theme: LightTheme.theme,
        darkTheme: DarkTheme.theme,
        themeMode: ThemeMode.dark,
        home: HomeScreen(),
      ),
    );
  }
}
