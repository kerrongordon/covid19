import 'package:covid19/components/kgp-center.dart';
import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/providers/home-provider.dart';
import 'package:covid19/providers/one-country-provider.dart';
import 'package:covid19/routes/route-names.dart';
import 'package:covid19/screens/main/main-card-list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final home = useProvider(homeCountryProvider);
    final getcountry = useProvider(oneCountryProvider);

    final countryName = useMemoized(
      () => home.getCountryName(),
    );

    final snapshot = useFuture(countryName);

    if (snapshot.hasData) {
      return FutureBuilder(
        future: getcountry.getOneCountryApi(country: snapshot.data),
        builder: (BuildContext context, AsyncSnapshot<Country> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return KgpCenter(child: Container());
              break;
            case ConnectionState.waiting:
              return KgpCenter(child: KgpLoader());
              break;
            case ConnectionState.active:
              return KgpCenter(child: KgpLoader());
              break;
            case ConnectionState.done:
              final data = snapshot.data;
              return Scaffold(
                body: MainCardList(data: data),
                floatingActionButton: Container(
                  margin: const EdgeInsets.only(bottom: 60),
                  child: FloatingActionButton(
                      heroTag: 'openMap',
                      child: const Icon(Ionicons.ios_map),
                      onPressed: () =>
                          Navigator.of(context).pushNamed(mapScreen)),
                ),
              );
              break;
            default:
              return KgpCenter(child: Container());
          }
        },
      );
    }

    return KgpCenter(child: KgpLoader());
  }
}
