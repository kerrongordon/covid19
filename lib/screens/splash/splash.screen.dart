import 'package:covid19/components/kgp-center.dart';
import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/providers/country-provider.dart';
import 'package:covid19/providers/preference-provider.dart';
import 'package:covid19/screens/boarding/boarding.screen.dart';
import 'package:covid19/screens/tab/tab-screen.dart';
import 'package:covid19/themes/color-theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final countryPro = useProvider(countryProvider);
    final backgroundColor = ColorTheme.primary;

    return countryPro.when(
      data: (data) => _checkFirstSeen(countries: data),
      loading: () => _loadingBuilder(color: backgroundColor),
      error: (error, _) => _errorBuilder(error),
    );
  }

  Widget _checkFirstSeen({List<Country> countries}) {
    final prefs = useProvider(preferencesProvider);
    final backgroundColor = ColorTheme.primary;

    return prefs.when(
      data: (data) => _startApp(prefs: data, countries: countries),
      loading: () => _loadingBuilder(color: backgroundColor),
      error: (error, _) => _errorBuilder(error),
    );
  }

  Widget _startApp({SharedPreferences prefs, List<Country> countries}) {
    final homePrefs = useProvider(myHomeCountryProvider);
    bool _seen = (prefs.getBool('start') ?? false);
    final backgroundColor = ColorTheme.primary;
    final updateBuild = useState(true);

    if (_seen == true) {
      final country = useMemoized(() => homePrefs.getCountry());
      final snapshot = useFuture(country);

      if (snapshot.hasData) {
        if (updateBuild.value) {
          final oldDataName = snapshot.data.country;
          final update = countries
              .where((newDataName) => oldDataName == newDataName.country)
              .toList()[0];
          homePrefs.setCountry(update);
          updateBuild.value = false;
          return KgpCenter(child: KgpLoader());
        } else {
          return TabScreen();
        }
      }
      return _loadingBuilder(color: backgroundColor);
    }
    return BoardingScreen();
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
