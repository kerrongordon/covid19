import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-flag.dart';
import 'package:covid19/providers/country-provider.dart';
import 'package:covid19/providers/preference-provider.dart';
import 'package:covid19/screens/boarding/boarding.search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsCountryPicker extends HookWidget {
  const SettingsCountryPicker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countries = useProvider(countryProvider);
    final homePrefs = useProvider(myHomeCountryProvider);
    final country = useMemoized(
      () => homePrefs.getCountry(),
    );
    final snapshot = useFuture(country);

    if (snapshot == null && snapshot.hasError) {
      return Container();
    }

    if (snapshot.hasData) {
      final data = snapshot.data;
      return Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 50,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CardComponent(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Center(
                    child: Text(
                      homePrefs.homeCountry.country == null
                          ? data.country
                          : homePrefs.homeCountry.country,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              onTap: () async {
                await showSearch(
                  context: context,
                  delegate: BoardingSearch(
                    countries: countries,
                    homePrefs: homePrefs,
                  ),
                );
              },
            ),
            Positioned(
              top: -30,
              left: MediaQuery.of(context).size.width / 2.9,
              child: KgpFlag(
                imageUrl: homePrefs.homeCountry.country == null
                    ? data.countryInfo.flag
                    : homePrefs.homeCountry.countryInfo.flag,
                imageWidth: 90,
                imageHeight: 90,
              ),
            )
          ],
        ),
      );
    }

    return Container();
  }
}
