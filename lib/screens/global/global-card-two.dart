import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-card-title.dart';
import 'package:covid19/components/kgp-stats-with-title.dart';
import 'package:covid19/models/global-model.dart';
import 'package:covid19/themes/color-theme.dart';
import 'package:covid19/utils/timetodate.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class GlobalCardTwo extends StatelessWidget {
  final Global data;
  const GlobalCardTwo({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _date = TimeToDate.use(data.updated);
    return CardComponent(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          KgpCardTitle(
            title: 'Today',
            subtitle: 'Updates as of $_date',
            icon: Icon(Ionicons.ios_send),
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: KgpStatsWithTitle(
                    title: 'Confirmed',
                    amount: data.todayCases,
                    amountFontSize: 18,
                    titleFontSize: 15,
                    titlecolor: ColorTheme.cases,
                  ),
                ),
                Expanded(
                  child: KgpStatsWithTitle(
                    title: 'Deaths',
                    amount: data.todayDeaths,
                    amountFontSize: 18,
                    titleFontSize: 15,
                    titlecolor: ColorTheme.deaths,
                  ),
                ),
                Expanded(
                  child: KgpStatsWithTitle(
                    title: 'Recovered',
                    amount: data.todayRecovered,
                    amountFontSize: 18,
                    titleFontSize: 15,
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
