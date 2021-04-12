import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-flag.dart';
import 'package:covid19/components/search/kgp-search.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/providers/country-provider.dart';
import 'package:covid19/providers/home-provider.dart';
import 'package:covid19/providers/one-country-provider.dart';
import 'package:covid19/translations/setting-translate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsCountryPicker extends HookWidget {
  const SettingsCountryPicker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countries = useProvider(countryProvider);
    final home = useProvider(homeCountryProvider);
    final getcountry = useProvider(oneCountryProvider);

    final countryName = useMemoized(
      () => home.getCountryName(),
    );

    final snapshot = useFuture(countryName, initialData: '');

    Future<void> openSearch() async {
      final Country search = await showSearch(
        context: context,
        delegate: KgpSearch(
          countries: countries,
          action: SearchAction.edit,
        ),
      );
      home.setCountryName(search);
    }

    if (snapshot.hasData) {
      return FutureBuilder(
        future: getcountry.getOneCountryApi(country: snapshot.data),
        builder: (BuildContext context, AsyncSnapshot<Country> snapshot) {
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
                  FadeInUp(
                    child: CardComponent(
                      padding: const EdgeInsets.all(20),
                      onTap: openSearch,
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Column(
                            children: [
                              Text(changecountry),
                              const SizedBox(height: 10),
                              Center(
                                child: Text(
                                  home.item.country ?? data.country,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -30,
                    left: MediaQuery.of(context).size.width / 2.9,
                    child: GestureDetector(
                      onTap: openSearch,
                      child: ZoomIn(
                        child: KgpFlag(
                          imageUrl: home.item.country == null
                              ? data.countryInfo.flag
                              : home.item.countryInfo.flag,
                          imageWidth: 90,
                          imageHeight: 90,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }

          return Container();
        },
      );
    }

    return Container();
  }
}
