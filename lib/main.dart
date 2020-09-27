import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:covid19/screens/splash/splash.screen.dart';
import 'package:covid19/themes/dark-theme.dart';
import 'package:covid19/themes/light-theme.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

FirebaseAnalytics analytics;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  analytics = FirebaseAnalytics();
  await DotEnv().load('.env');
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(
    ProviderScope(
      child: MyApp(savedThemeMode: savedThemeMode),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode savedThemeMode;
  const MyApp({Key key, this.savedThemeMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return AdaptiveTheme(
      initial: savedThemeMode.isSystem
          ? AdaptiveThemeMode.light
          : savedThemeMode ?? AdaptiveThemeMode.light,
      light: LightTheme.theme,
      dark: DarkTheme.theme,
      builder: (light, dark) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Covid 19 Tracker',
          theme: light,
          darkTheme: dark,
          home: Splash(),
        );
      },
    );
  }
}
