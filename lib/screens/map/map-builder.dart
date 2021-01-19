import 'dart:ui';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/screens/map/map-marker-item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';

class MapBuilder extends HookWidget {
  const MapBuilder({
    Key key,
    @required this.position,
    @required this.countries,
  }) : super(key: key);

  final Position position;
  final List<Country> countries;

  @override
  Widget build(BuildContext context) {
    final mapApi = env['MAP_API'];
    final mapLight = 'ckfkbb59g00mo1ao408id402s';
    final mapDark = 'ckfkcdgj614e31aox1o5n2aml';
    final openstreetmap = 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
    final mapUrl = useState(openstreetmap);
    final mapTheme = useState(mapLight);
    final changeTheme = AdaptiveTheme.of(context);
    final mediaQuery = MediaQuery.of(context);

    if (changeTheme.mode.isDark) mapTheme.value = mapDark;

    if (mapApi != null)
      mapUrl.value =
          "https://api.mapbox.com/styles/v1/kerron/${mapTheme.value}/tiles/256/{z}/{x}/{y}@2x?access_token=$mapApi";

    return Stack(
      children: [
        Container(
          height: mediaQuery.size.height,
          width: mediaQuery.size.width,
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(
                position.latitude ?? 58.8,
                position.longitude ?? 6.1,
              ),
              zoom: 12.0,
            ),
            layers: [
              TileLayerOptions(
                backgroundColor: changeTheme.mode.isDark
                    ? changeTheme.theme.backgroundColor
                    : const Color.fromRGBO(117, 207, 240, 1.0),
                urlTemplate: mapUrl.value,
                subdomains: ['a', 'b', 'c'],
                tileProvider: const CachedNetworkTileProvider(),
                additionalOptions: {
                  'accessToken': mapApi,
                  'id': 'mapbox.mapbox-streets-v8',
                },
              ),
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
                      Ionicons.ios_locate,
                      size: 15,
                      color: changeTheme.theme.accentColor,
                    ),
                  ),
                  if (countries != null)
                    for (var i = 0; i < countries.length; i++)
                      Marker(
                        width: 100.0,
                        height: 100.0,
                        point: LatLng(
                          countries[i].countryInfo.lat,
                          countries[i].countryInfo.long,
                        ),
                        builder: (ctx) => MapMarkerItems(
                          data: countries,
                          i: i,
                        ),
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
              color: changeTheme.theme.backgroundColor.withOpacity(0.6),
              child: Container(),
            ),
          ),
        ),
      ],
    );
  }
}
