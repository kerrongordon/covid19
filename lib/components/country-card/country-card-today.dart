import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-card-title.dart';
import 'package:covid19/components/kgp-stats-with-title.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/themes/color-theme.dart';
import 'package:covid19/translations/app-translate.dart';
import 'package:covid19/utils/timetodate.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CountryCardToday extends StatelessWidget {
  final Country data;
  const CountryCardToday({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String date = TimeToDate.use(data.updated);
    return CardComponent(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          KgpCardTitle(
            title: today,
            subtitle: '$updatedasof $date',
            icon: const Icon(Ionicons.ios_send),
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: KgpStatsWithTitle(
                    title: confirmed,
                    amount: data.todayCases,
                    amountFontSize: 18,
                    titleFontSize: 14,
                    titlecolor: ColorTheme.cases,
                  ),
                ),
                Expanded(
                  child: KgpStatsWithTitle(
                    title: deaths,
                    amount: data.todayDeaths,
                    amountFontSize: 18,
                    titleFontSize: 14,
                    titlecolor: ColorTheme.deaths,
                  ),
                ),
                Expanded(
                  child: KgpStatsWithTitle(
                    title: recovered,
                    amount: data.todayRecovered,
                    amountFontSize: 18,
                    titleFontSize: 14,
                    titlecolor: ColorTheme.recovered,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
