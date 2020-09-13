import 'package:covid19/components/kgp-bottom-dialog.dart';
import 'package:covid19/components/kgp-stats-with-title.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/screens/country/country-screen.dart';
import 'package:covid19/themes/color-theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MapMarkerItems extends StatelessWidget {
  const MapMarkerItems({
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
          showModalBottomSheet(
            context: context,
            elevation: 30,
            backgroundColor: Colors.transparent,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(20),
              child: KgpBottomDialog(
                title: '${data[i].country}',
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: KgpStatsWithTitle(
                              title: 'Cases',
                              amount: data[i].cases,
                              amountFontSize: 20,
                              titleFontSize: 16,
                              titlecolor: ColorTheme.cases,
                            ),
                          ),
                          Expanded(
                            child: KgpStatsWithTitle(
                              title: 'Recovered',
                              amount: data[i].recovered,
                              amountFontSize: 20,
                              titleFontSize: 16,
                              titlecolor: ColorTheme.recovered,
                            ),
                          ),
                          Expanded(
                            child: KgpStatsWithTitle(
                              title: 'Deaths',
                              amount: data[i].deaths,
                              amountFontSize: 20,
                              titleFontSize: 16,
                              titlecolor: ColorTheme.deaths,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: FlatButton.icon(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CountryScreen(data: data[i]),
                                ),
                              );
                            },
                            icon: Icon(Ionicons.ios_compass),
                            label: Text('View More'),
                            textColor: Theme.of(context).accentColor,
                            padding: const EdgeInsets.all(20),
                            splashColor: Theme.of(context).accentColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
