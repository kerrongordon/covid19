import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/components/search/kgp-search-list.dart';
import 'package:covid19/components/search/kgp-search-not-found.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/providers/preference-provider.dart';
import 'package:covid19/routes/route-names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum SearchAction { open, edit }

class KgpSearch extends SearchDelegate<Country> {
  final AsyncValue<List<Country>> countries;
  final SearchAction action;
  final MyHomeCountryChangeNotifier homePrefs;

  KgpSearch({
    @required this.countries,
    @required this.action,
    this.homePrefs,
  });

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Ionicons.ios_close_circle_outline, color: Colors.grey),
        onPressed: () => query = "",
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) {
    _buildSearchUi(List<Country> data) {
      List<Country> list = query.isEmpty
          ? data
          : data
              .where((p) => p.country.toLowerCase().startsWith(query))
              .toList();

      if (list.isEmpty) {
        return KgpSearchNotFound();
      }

      switch (action) {
        case SearchAction.open:
          return KgpSearchList(
            list: list,
            onTap: (item) => Navigator.of(context).pushNamed(
              countryScreen,
              arguments: item,
            ),
          );
          break;
        case SearchAction.edit:
          return KgpSearchList(
            list: list,
            onTap: (item) {
              print(item.country);
              // homePrefs.setCountry(item);
              close(context, null);
            },
          );
          break;
      }
    }

    return countries.when(
      data: (data) => _buildSearchUi(data),
      loading: () => KgpLoader(),
      error: (error, _) => Center(child: Text(error.toString())),
    );
  }
}
