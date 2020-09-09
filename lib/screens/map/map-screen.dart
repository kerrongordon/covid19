import 'dart:ui';

import 'package:covid19/components/kgp-bottom-dialog.dart';
import 'package:covid19/components/kgp-stats-with-title.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/themes/color-theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatelessWidget {
  final Position position;
  const MapScreen({
    Key key,
    this.position,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Country> data = Provider.of<List<Country>>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Map'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(
                    position.latitude ?? 58.8, position.longitude ?? 6.1),
                zoom: 12.0,
              ),
              layers: [
                TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c']),
                MarkerLayerOptions(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(
                          position.latitude ?? 58.8, position.longitude ?? 6.1),
                      builder: (context) => Icon(
                        Ionicons.ios_pin,
                        size: 50,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    if (data != null)
                      for (var i = 0; i < data.length; i++)
                        Marker(
                          width: 100.0,
                          height: 100.0,
                          point: LatLng(data[i].countryInfo.lat,
                              data[i].countryInfo.long),
                          builder: (ctx) => MarkerItems(data: data, i: i),
                        ),
                  ],
                ),
              ],
            ),
          ),
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 7,
                sigmaY: 7,
              ),
              child: Container(
                width: double.infinity,
                height: 87,
                color: Theme.of(context).backgroundColor.withOpacity(0.6),
                child: Container(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MarkerItems extends StatelessWidget {
  const MarkerItems({
    Key key,
    @required this.data,
    @required this.i,
  }) : super(key: key);

  final List<Country> data;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Icon(
          Ionicons.ios_pin,
          size: 40,
          color: ColorTheme.deaths,
        ),
        onTap: () {
          print(data[i].country);
          showModalBottomSheet(
            context: context,
            elevation: 30,
            backgroundColor: Colors.transparent,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(20),
              child: KgpBottomDialog(
                title: '${data[i].country}',
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: KgpStatsWithTitle(
                          title: 'Confirmed',
                          amount: data[i].cases,
                          amountFontSize: 20,
                          titleFontSize: 15,
                          titlecolor: ColorTheme.cases,
                        ),
                      ),
                      Expanded(
                        child: KgpStatsWithTitle(
                          title: 'Deaths',
                          amount: data[i].deaths,
                          amountFontSize: 20,
                          titleFontSize: 15,
                          titlecolor: ColorTheme.deaths,
                        ),
                      ),
                      Expanded(
                        child: KgpStatsWithTitle(
                          title: 'Recovered',
                          amount: data[i].recovered,
                          amountFontSize: 20,
                          titleFontSize: 15,
                          titlecolor: ColorTheme.recovered,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
