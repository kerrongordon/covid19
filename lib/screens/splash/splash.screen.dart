import 'package:covid19/components/kgp-center.dart';
import 'package:covid19/configs/data.config.dart';
import 'package:covid19/providers/preference-provider.dart';
import 'package:covid19/screens/boarding/boarding.screen.dart';
import 'package:covid19/screens/tab/tab-screen.dart';
import 'package:covid19/themes/color-theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends HookWidget {
  Widget _appStart({SharedPreferences pref}) {
    bool _seen = (pref.getBool(appInitKey) ?? false);

    return _seen ? TabScreen() : BoardingScreen();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = ColorTheme.primary;
    final prefs = useProvider(preferencesProvider);

    return prefs.when(
      data: (data) => _appStart(pref: data),
      loading: () => _loadingBuilder(color: backgroundColor),
      error: (error, _) => _errorBuilder(error),
    );
  }

  Widget _loadingBuilder({Color color}) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: color,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: color,
        brightness: Brightness.dark,
      ),
      body: Image.asset(
        'assets/splash.png',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }

  KgpCenter _errorBuilder(error) => KgpCenter(child: Text(error.toString()));
}
