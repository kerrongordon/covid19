import 'package:covid19/models/country-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CountryList extends SearchDelegate<Country> {
  final List<Country> data;
  final SharedPreferences perf;

  CountryList({this.perf, this.data});
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
    List<Country> list = query.isEmpty
        ? data
        : data.where((p) => p.country.toLowerCase().startsWith(query)).toList();
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
                  perf.setString('myhomecountry', item.country);
                  close(context, null);
                },
              );
            },
          );
  }
}
