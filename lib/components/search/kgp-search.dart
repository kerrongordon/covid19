import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/components/search/kgp-search-list.dart';
import 'package:covid19/components/search/kgp-search-not-found.dart';
import 'package:covid19/components/search/kgp-search-states.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/models/usstates-model.dart';
import 'package:covid19/routes/route-names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum SearchAction { open, edit }
enum SearchType { country, state }

class KgpSearch extends SearchDelegate<Country> {
  final AsyncValue<List<Country>> countries;
  final AsyncValue<List<UsStates>> states;
  final SearchAction action;
  final SearchType type;

  KgpSearch({
    this.countries,
    this.states,
    this.action,
    this.type,
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
    _buildcountriesSearchUi(List<Country> data) {
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
              onTap: (item) {
                close(context, item);
                Navigator.of(context).pushNamed(
                  countryScreen,
                  arguments: item,
                );
              });
          break;
        case SearchAction.edit:
          return KgpSearchList(
            list: list,
            onTap: (item) => close(context, item),
          );
          break;
      }
    }

    _buildstatesSearchUi(List<UsStates> data) {
      List<UsStates> list = query.isEmpty
          ? data
          : data.where((p) => p.state.toLowerCase().startsWith(query)).toList();

      if (list.isEmpty) {
        return KgpSearchNotFound();
      }

      return KgpSearchStates(
        list: list,
        onTap: (item) {
          close(context, null);
          Navigator.of(context).pushNamed(usState, arguments: item);
        },
      );
    }

    switch (type) {
      case SearchType.country:
        return countries.when(
          data: (data) => _buildcountriesSearchUi(data),
          loading: () => KgpLoader(),
          error: (error, _) => Center(child: Text(error.toString())),
        );
        break;
      case SearchType.state:
        return states.when(
          data: (data) => _buildstatesSearchUi(data),
          loading: () => KgpLoader(),
          error: (error, _) => Center(child: Text(error.toString())),
        );
        break;
      default:
        return countries.when(
          data: (data) => _buildcountriesSearchUi(data),
          loading: () => KgpLoader(),
          error: (error, _) => Center(child: Text(error.toString())),
        );
    }
  }
}
