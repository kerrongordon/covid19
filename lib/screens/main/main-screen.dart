import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/providers/one-country-provider.dart';
import 'package:covid19/screens/main/main-card-list.dart';
import 'package:covid19/screens/map/map-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<OneCountryProvider, SharedPreferences>(
        builder: (_, OneCountryProvider country, SharedPreferences prefe, __) {
          final userCountry = prefe?.getString('myhomecountry');
          if (userCountry == null || userCountry == '') {
            return Container();
          }
          return FutureBuilder(
            future: country.getOneCountry(country: userCountry),
            builder: (context, AsyncSnapshot<Country> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: KgpLoader());
              } else if (snapshot.hasError) {
                final error = snapshot.error;
                return Container(
                  height: 200,
                  child: Center(
                    child: Text(
                      error.toString(),
                    ),
                  ),
                );
              } else if (snapshot.hasData) {
                final Country data = snapshot.data;
                return MainCardList(data: data);
              } else {
                return Container();
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Ionicons.ios_map),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MapScreen(),
          ),
        ),
      ),
    );
  }
}
