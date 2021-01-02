import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-pie-chart.dart';
import 'package:covid19/components/kgp-stats-with-title.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/themes/color-theme.dart';
import 'package:covid19/translations/app-translate.dart';
import 'package:flutter/material.dart';

class MainCardOne extends StatelessWidget {
  final Country data;
  const MainCardOne({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(
                  bottom: 20,
                  top: 20,
                  right: 20,
                ),
                child: KgpPieChart(
                  aspectRatio: 1,
                  cases: data.cases,
                  recovered: data.recovered,
                  deaths: data.deaths,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    KgpStatsWithTitle(
                      title: confirmed,
                      amount: data.cases,
                      titleFontSize: 16,
                      amountFontSize: 18,
                      titlecolor: ColorTheme.cases,
                      padding: const EdgeInsets.only(bottom: 20),
                      crossAxisAlignment: CrossAxisAlignment.end,
                    ),
                    KgpStatsWithTitle(
                      title: recovered,
                      amount: data.recovered,
                      titleFontSize: 16,
                      amountFontSize: 18,
                      titlecolor: ColorTheme.recovered,
                      padding: const EdgeInsets.only(bottom: 20),
                      crossAxisAlignment: CrossAxisAlignment.end,
                    ),
                    KgpStatsWithTitle(
                      title: deaths,
                      amount: data.deaths,
                      titleFontSize: 16,
                      amountFontSize: 18,
                      titlecolor: ColorTheme.deaths,
                      crossAxisAlignment: CrossAxisAlignment.end,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
