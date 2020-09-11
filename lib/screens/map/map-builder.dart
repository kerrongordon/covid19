import 'dart:ui';

import 'package:covid19/models/country-model.dart';
import 'package:covid19/screens/map/map-marker-item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';

class MapBuilder extends StatelessWidget {
  const MapBuilder({
    Key key,
    @required this.position,
    @required this.data,
  }) : super(key: key);

  final Position position;
  final List<Country> data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FlutterMap(
            options: MapOptions(
              center:
                  LatLng(position.latitude ?? 58.8, position.longitude ?? 6.1),
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
                      position.latitude ?? 40.7128,
                      position.longitude ?? 74.0060,
                    ),
                    builder: (context) => Icon(
                      Ionicons.ios_body,
                      size: 50,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  if (data != null)
                    for (var i = 0; i < data.length; i++)
                      Marker(
                        width: 100.0,
                        height: 100.0,
                        point: LatLng(
                            data[i].countryInfo.lat, data[i].countryInfo.long),
                        builder: (ctx) => MapMarkerItems(data: data, i: i),
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
    );
  }
}
