import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/components/search/kgp-search.dart';
import 'package:covid19/hooks/automatic.keep.alive.hook.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/providers/country-provider.dart';
import 'package:covid19/screens/countries/countries-item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CountriesScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _countryProvider = useProvider(countryProvider);
    useAutomaticKeepAliveClient();

    List<Widget> _items(List<Country> data) {
      List<CountriesItem> _cardItem = [];
      for (final c in data) _cardItem.add(CountriesItem(data: c));
      return _cardItem;
    }

    return Scaffold(
      body: KgpBasePage(
        title: 'Countries',
        sliverList: SliverChildListDelegate(
          _countryProvider.when(
            loading: () => [const KgpLoader()],
            error: (error, st) => [Center(child: Text(error.toString()))],
            data: (data) => _items(data),
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 60),
        child: FloatingActionButton(
          heroTag: 'countrySearch',
          child: const Icon(Ionicons.ios_search),
          onPressed: () => showSearch(
            context: context,
            delegate: KgpSearch(
              countries: _countryProvider,
              action: SearchAction.open,
            ),
          ),
        ),
      ),
    );
  }
}
