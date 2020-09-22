import 'package:covid19/components/kgp-center.dart';
import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/hooks/automatic.keep.alive.hook.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/providers/one-country-provider.dart';
import 'package:covid19/providers/preference-provider.dart';
import 'package:covid19/screens/main/main-card-list.dart';
import 'package:covid19/screens/map/map-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = useProvider(preferencesProvider);
    useAutomaticKeepAliveClient();

    return prefs.when(
      data: (pref) => _buildUI(pref: pref, context: context),
      loading: () => KgpCenter(child: KgpLoader()),
      error: (error, _) => KgpCenter(child: Text(error.toString())),
    );
  }

  _buildUI({SharedPreferences pref, BuildContext context}) {
    final oneCountry = useProvider(oneCountryProvider);
    final yourCountry = pref.getString('myhomecountry');
    final country = useMemoized(
      () => oneCountry.getOneCountryApi(country: yourCountry),
    );
    final snapshot = useFuture(country);

    if (snapshot == null) {
      return Container();
    }

    if (snapshot.connectionState == ConnectionState.waiting) {
      return KgpCenter(child: KgpLoader());
    } else if (snapshot.hasError) {
      final error = snapshot.error;
      return KgpCenter(child: Text(error.toString()));
    } else if (snapshot.hasData) {
      final Country data = snapshot.data;
      return Scaffold(
        body: MainCardList(data: data),
        floatingActionButton: FloatingActionButton(
          child: Icon(Ionicons.ios_map),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MapScreen(),
            ),
          ),
        ),
      );
    } else {
      return KgpCenter(child: Container());
    }
  }
}
