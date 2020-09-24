import 'package:covid19/models/country-model.dart';
import 'package:covid19/providers/preference-provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BoardingSearch extends SearchDelegate<Country> {
  final AsyncValue<List<Country>> countries;
  final MyHomeCountryChangeNotifier homePrefs;

  BoardingSearch({this.countries, this.homePrefs});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Ionicons.ios_close_circle_outline,
          color: Colors.grey,
        ),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _buildSearchUi(List<Country> data) {
      List<Country> list = query.isEmpty
          ? data
          : data
              .where((p) => p.country.toLowerCase().startsWith(query))
              .toList();
      return list.isEmpty
          ? Center(
              child: Text(
                'No Result Found... 🙄️',
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, int) {
                final item = list[int];
                return ListTile(
                  title: Text(item.country),
                  onTap: () {
                    homePrefs.setCountry(item);
                    close(context, null);
                  },
                );
              },
            );
    }

    return countries.when(
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text(error.toString())),
      data: (data) => _buildSearchUi(data),
    );
  }
}
