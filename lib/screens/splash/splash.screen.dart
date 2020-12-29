import 'package:covid19/components/kgp-center.dart';
import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/configs/data.config.dart';
import 'package:covid19/providers/preference-provider.dart';
import 'package:covid19/screens/boarding/boarding.screen.dart';
import 'package:covid19/screens/tab/tab-screen.dart';
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
    final prefs = useProvider(preferencesProvider);

    return prefs.when(
      data: (data) => _appStart(pref: data),
      loading: () => KgpCenter(child: KgpLoader()),
      error: (error, _) => KgpCenter(child: Text(error.toString())),
    );
  }
}
