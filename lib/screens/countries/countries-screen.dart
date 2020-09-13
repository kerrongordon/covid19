import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/providers/country-provider.dart';
import 'package:covid19/screens/countries/countries-item.dart';
import 'package:covid19/screens/countries/countries-search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CountriesScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final config = useProvider(countryProvider);
    return Scaffold(
      body: KgpBasePage(
        title: 'Countries',
        sliverList: SliverChildListDelegate(
          config.when(
            loading: () => [KgpLoader()],
            error: (error, st) => [Center(child: Text(error.toString()))],
            data: (data) => [for (final c in data) CountriesItem(data: c)],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Ionicons.ios_search),
        onPressed: () {
          showSearch(
            context: context,
            delegate: SearchCountry(config.data.value),
          );
        },
      ),
    );
  }
}
