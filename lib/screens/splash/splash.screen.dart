import 'package:covid19/components/kgp-center.dart';
import 'package:covid19/providers/preference-provider.dart';
import 'package:covid19/screens/boarding/boarding.screen.dart';
import 'package:covid19/screens/tab/tab-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = useProvider(preferencesProvider);
    final loaded = useState(false);
    final animationController = useAnimationController();
    final backgroundColor = Theme.of(context).accentColor;

    void onAnimationLoaded() {
      animationController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          return loaded.value = true;
        }
      });

      animationController
        ..duration = Duration(seconds: 2)
        ..forward();
    }

    return loaded.value == false
        ? _loadingBuilder(color: backgroundColor, start: onAnimationLoaded)
        : prefs.when(
            data: (data) => _checkFirstSeen(data),
            loading: () => _loadingBuilder(color: backgroundColor),
            error: (error, _) => _errorBuilder(error),
          );
  }

  Widget _checkFirstSeen(SharedPreferences prefs) {
    bool _seen = (prefs.getBool('start') ?? false);
    return _seen == true ? TabScreen() : BoardingScreen();
  }

  Widget _loadingBuilder({Color color, Function start}) {
    if (start != null) {
      start();
    }
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
