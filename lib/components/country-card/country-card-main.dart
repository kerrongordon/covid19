import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/country-card/country-card-main-title.dart';
import 'package:covid19/components/kgp-flag.dart';
import 'package:covid19/components/kgp-pie-chart.dart';
import 'package:covid19/components/kgp-stats-with-title.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/themes/color-theme.dart';
import 'package:flutter/material.dart';

class CountryCardMain extends StatelessWidget {
  final Country data;
  const CountryCardMain({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: CountryCardMailTitle(
                    date: data.updated,
                  ),
                ),
                Expanded(
                  child: KgpFlag(
                    tag: data.country,
                    imageUrl: data.countryInfo.flag,
                    imageWidth: 55.0,
                    imageHeight: 55.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: KgpPieChart(
              aspectRatio: 1.5,
              cases: data.cases,
              recovered: data.recovered,
              deaths: data.deaths,
            ),
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: KgpStatsWithTitle(
                    flip: true,
                    title: 'Cases',
                    amount: data.cases,
                    amountFontSize: 18,
                    titleFontSize: 18,
                    titlecolor: ColorTheme.cases,
                  ),
                ),
                Expanded(
                  child: KgpStatsWithTitle(
                    flip: true,
                    title: 'Recovered',
                    amount: data.recovered,
                    amountFontSize: 18,
                    titleFontSize: 18,
                    titlecolor: ColorTheme.recovered,
                  ),
                ),
                Expanded(
                  child: KgpStatsWithTitle(
                    flip: true,
                    title: 'Deaths',
                    amount: data.deaths,
                    amountFontSize: 18,
                    titleFontSize: 18,
                    titlecolor: ColorTheme.deaths,
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
