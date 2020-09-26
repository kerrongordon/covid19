import 'package:covid19/components/kgp-center.dart';
import 'package:covid19/providers/preference-provider.dart';
import 'package:covid19/screens/boarding/boarding.screen.dart';
import 'package:covid19/screens/tab/tab-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends HookWidget {
  final String lottieFile = 'assets/28663-coronavirus-covid-19.json';

  @override
  Widget build(BuildContext context) {
    final prefs = useProvider(preferencesProvider);
    final loaded = useState(false);
    final animationController = useAnimationController();

    void onAnimationLoaded(LottieComposition composition) {
      animationController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          return loaded.value = true;
        }
      });

      animationController
        ..duration = composition.duration
        ..forward();
    }

    return loaded.value == false
        ? KgpCenter(
            child: Lottie.asset(
              lottieFile,
              height: 250.0,
              controller: animationController,
              onLoaded: onAnimationLoaded,
            ),
          )
        : prefs.when(
            data: (data) => _checkFirstSeen(data),
            loading: () => _loadingBuilder(),
            error: (error, _) => _errorBuilder(error),
          );
  }

  Widget _checkFirstSeen(SharedPreferences prefs) {
    bool _seen = (prefs.getBool('seen') ?? false);
    return _seen == true ? TabScreen() : BoardingScreen();
  }

  KgpCenter _loadingBuilder() =>
      KgpCenter(child: Lottie.asset(lottieFile, height: 250.0));

  KgpCenter _errorBuilder(error) => KgpCenter(child: Text(error.toString()));
}
