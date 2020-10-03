import 'package:covid19/components/kgp-center.dart';
import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/hooks/automatic.keep.alive.hook.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/providers/preference-provider.dart';
import 'package:covid19/screens/main/main-card-list.dart';
import 'package:covid19/screens/map/map-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final homePrefs = useProvider(myHomeCountryProvider);
    final country = useMemoized(
      () => homePrefs.getCountry(),
    );
    final snapshot = useFuture(country);
    useAutomaticKeepAliveClient();

    if (snapshot == null) {
      return Container();
    }

    if (snapshot.connectionState == ConnectionState.waiting) {
      return KgpCenter(child: KgpLoader());
    } else if (snapshot.hasError) {
      final error = snapshot.error;
      return KgpCenter(child: Text(error.toString()));
    } else if (snapshot.hasData) {
      final Country data = homePrefs.homeCountry.country == null
          ? snapshot.data
          : homePrefs.homeCountry;
      return Scaffold(
        body: MainCardList(data: data),
        floatingActionButton: Container(
          margin: const EdgeInsets.only(bottom: 60),
          child: FloatingActionButton(
            heroTag: 'openMap',
            child: Icon(Ionicons.ios_map),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MapScreen(),
              ),
            ),
          ),
        ),
      );
    } else {
      return KgpCenter(child: Container());
    }
  }
}
