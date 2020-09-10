import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/providers/country-provider.dart';
import 'package:covid19/screens/map/map-builder.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Country> countries = Provider.of<List<Country>>(context);
    CountryProvider countryProvider = Provider.of<CountryProvider>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Map'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: StreamBuilder<Position>(
          stream: countryProvider.getlocation().asStream(),
          builder: (context, AsyncSnapshot<Position> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: KgpLoader());
            } else if (snapshot.hasError) {
              final error = snapshot.error;
              return Container(
                height: MediaQuery.of(context).size.height / 2.5,
                child: Center(
                  child: Text(
                    error.toString(),
                  ),
                ),
              );
            } else if (snapshot.hasData) {
              final data = snapshot.data;
              return MapBuilder(position: data, data: countries);
            } else {
              return Container();
            }
          }),
    );
  }
}
