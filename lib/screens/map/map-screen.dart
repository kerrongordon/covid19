import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/components/kgp-bottom-dialog.dart';
import 'package:covid19/components/kgp-stats-with-title.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/themes/color-theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Country> data = Provider.of<List<Country>>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: KgpBasePage(
        title: 'Map',
        expandedHeight: 55,
        neverScroll: true,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: FlutterMap(
              options: MapOptions(
                bounds: LatLngBounds(LatLng(58.8, 6.1), LatLng(59, 6.2)),
                boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(8.0)),
                // center: LatLng(51.5, -0.09),
                // zoom: 13.0,
              ),
              layers: [
                TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c']),
                MarkerLayerOptions(
                  markers: [
                    if (data != null)
                      for (var i = 0; i < data.length; i++)
                        Marker(
                          width: 100.0,
                          height: 100.0,
                          point: LatLng(data[i].countryInfo.lat,
                              data[i].countryInfo.long),
                          builder: (ctx) => Container(
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
                                                titlecolor:
                                                    ColorTheme.recovered,
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
                          ),
                        ),
                    //   else Marker(
                    //   width: 80.0,
                    //   height: 80.0,
                    //   point: LatLng(51.5, -0.09),
                    //   builder: (ctx) => Container(
                    //     child: FlutterLogo(),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   final PopupController _popupController = PopupController();

//   List<Marker> markers;
//   int pointIndex;
//   List points = [
//     LatLng(51.5, -0.09),
//     LatLng(49.8566, 3.3522),
//   ];

//   @override
//   void initState() {
//     pointIndex = 0;
//     markers = [
//       Marker(
//         anchorPos: AnchorPos.align(AnchorAlign.center),
//         height: 30,
//         width: 30,
//         point: points[pointIndex],
//         builder: (ctx) => Icon(Icons.pin_drop),
//       ),
//       Marker(
//         anchorPos: AnchorPos.align(AnchorAlign.center),
//         height: 30,
//         width: 30,
//         point: LatLng(53.3498, -6.2603),
//         builder: (ctx) => Icon(Icons.pin_drop),
//       ),
//       Marker(
//         anchorPos: AnchorPos.align(AnchorAlign.center),
//         height: 30,
//         width: 30,
//         point: LatLng(53.3488, -6.2613),
//         builder: (ctx) => Icon(Icons.pin_drop),
//       ),
//       Marker(
//         anchorPos: AnchorPos.align(AnchorAlign.center),
//         height: 30,
//         width: 30,
//         point: LatLng(53.3488, -6.2613),
//         builder: (ctx) => Icon(Icons.pin_drop),
//       ),
//       Marker(
//         anchorPos: AnchorPos.align(AnchorAlign.center),
//         height: 30,
//         width: 30,
//         point: LatLng(48.8566, 2.3522),
//         builder: (ctx) => Icon(Icons.pin_drop),
//       ),
//       Marker(
//         anchorPos: AnchorPos.align(AnchorAlign.center),
//         height: 30,
//         width: 30,
//         point: LatLng(49.8566, 3.3522),
//         builder: (ctx) => Icon(Icons.pin_drop),
//       ),
//     ];

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // floatingActionButton: FloatingActionButton(
//       //   child: Icon(Icons.refresh),
//       //   onPressed: () {
//       //     pointIndex++;
//       //     if (pointIndex >= points.length) {
//       //       pointIndex = 0;
//       //     }
//       //     setState(() {
//       //       markers[0] = Marker(
//       //         point: points[pointIndex],
//       //         anchorPos: AnchorPos.align(AnchorAlign.center),
//       //         height: 30,
//       //         width: 30,
//       //         builder: (ctx) => Icon(Icons.pin_drop),
//       //       );

//       //       // one of this
//       //       markers = List.from(markers);
//       //       // markers = [...markers];
//       //       // markers = []..addAll(markers);
//       //     });
//       //   },
//       // ),
//       body: KgpBasePage(
//         title: 'Map View',
//         expandedHeight: 55,
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: FlutterMap(
//               options: MapOptions(
//                 center: points[0],
//                 zoom: 5,
//                 plugins: [
//                   MarkerClusterPlugin(),
//                 ],
//                 onTap: (_) => _popupController
//                     .hidePopup(), // Hide popup when the map is tapped.
//               ),
//               layers: [
//                 TileLayerOptions(
//                   urlTemplate:
//                       'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//                   subdomains: ['a', 'b', 'c'],
//                 ),
//                 MarkerClusterLayerOptions(
//                   maxClusterRadius: 120,
//                   disableClusteringAtZoom: 6,
//                   size: Size(40, 40),
//                   anchor: AnchorPos.align(AnchorAlign.center),
//                   fitBoundsOptions: FitBoundsOptions(
//                     padding: EdgeInsets.all(50),
//                   ),
//                   markers: markers,
//                   polygonOptions: PolygonOptions(
//                       borderColor: Colors.blueAccent,
//                       color: Colors.black12,
//                       borderStrokeWidth: 3),
//                   popupOptions: PopupOptions(
//                       popupSnap: PopupSnap.top,
//                       popupController: _popupController,
//                       popupBuilder: (_, marker) => Container(
//                             width: 200,
//                             height: 100,
//                             color: Colors.white,
//                             child: GestureDetector(
//                               onTap: () => debugPrint("Popup tap!"),
//                               child: Text(
//                                 "Container popup for marker at ${marker.point}",
//                               ),
//                             ),
//                           )),
//                   builder: (context, markers) {
//                     return FloatingActionButton(
//                       child: Text(markers.length.toString()),
//                       onPressed: null,
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
