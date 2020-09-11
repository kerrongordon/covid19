import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/models/country-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CountryList extends SearchDelegate<Country> {
  final List<Country> data;
  final Future<SharedPreferences> perf;

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
                leading: CachedNetworkImage(
                  imageUrl: item.countryInfo.flag,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  placeholder: (context, url) => Container(
                    child: CircularProgressIndicator(strokeWidth: 2.0),
                    width: 20,
                    height: 20,
                  ),
                ),
                title: Text(item.country),
                onTap: () async {
                  var settings = await perf;
                  settings.setString('myhomecountry', item.country);
                  close(context, null);
                },
              );
            },
          );
  }
}
