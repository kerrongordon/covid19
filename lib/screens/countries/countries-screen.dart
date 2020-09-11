import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/screens/countries/countries-item.dart';
import 'package:covid19/screens/countries/countries-search.dart';
import 'package:covid19/screens/map/map-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Country> data = Provider.of<List<Country>>(context);

    return Scaffold(
      body: KgpBasePage(
        title: 'Countries',
        actions: [
          IconButton(
            icon: Icon(Ionicons.ios_map),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MapScreen(),
                ),
              );
            },
          ),
        ],
        sliverList: SliverChildListDelegate(
          [
            if (data != null)
              for (var i = 0; i < data.length; i++) CountriesItem(data: data[i])
            else
              KgpLoader()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Ionicons.ios_search),
        onPressed: () {
          showSearch(context: context, delegate: SearchCountry(data));
        },
      ),
    );
  }
}
