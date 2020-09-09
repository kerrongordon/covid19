import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/screens/countries/countries-item.dart';
import 'package:covid19/screens/countries/countries-search.dart';
import 'package:covid19/screens/map/map-screen.dart';
import 'package:covid19/utils/position.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:geolocator/geolocator.dart';
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
              var bar = Scaffold.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.black.withOpacity(0.8),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  content: Row(
                    children: [
                      CircularProgressIndicator(
                        strokeWidth: 3,
                        backgroundColor: Theme.of(context).accentColor,
                      ),
                      SizedBox(width: 15),
                      Text('Getting Your Location')
                    ],
                  ),
                ),
              );

              Position position = await PositionUtil.use();
              bar.close();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MapScreen(position: position),
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
