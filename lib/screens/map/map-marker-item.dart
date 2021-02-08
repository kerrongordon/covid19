import 'package:covid19/components/kgp-bottom-dialog.dart';
import 'package:covid19/components/kgp-stats-with-title.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/routes/route-names.dart';
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
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          elevation: 30,
          backgroundColor: Colors.transparent,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20),
            child: KgpBottomDialog(
              title: data[i].country,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
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
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: FlatButton.icon(
                          onPressed: () => Navigator.of(context)
                              .popAndPushNamed(countryScreen,
                                  arguments: data[i]),
                          icon: const Icon(Ionicons.ios_compass),
                          label: const Text('View More'),
                          textColor: theme.accentColor,
                          padding: const EdgeInsets.all(20),
                          splashColor: theme.accentColor,
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
      child: const Icon(
        Ionicons.ios_pin,
        size: 40,
        color: ColorTheme.deaths,
      ),
    );
  }
}
