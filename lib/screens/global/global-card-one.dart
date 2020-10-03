import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-pie-chart.dart';
import 'package:covid19/components/kgp-stats-with-title.dart';
import 'package:covid19/models/global-model.dart';
import 'package:covid19/themes/color-theme.dart';
import 'package:flutter/material.dart';

class GlobalCardOne extends StatelessWidget {
  final Global data;
  const GlobalCardOne({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(left: 20),
                child: KgpPieChart(
                  aspectRatio: 0.7,
                  cases: data.cases,
                  recovered: data.recovered,
                  deaths: data.deaths,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    KgpStatsWithTitle(
                      title: 'Confirmed',
                      amount: data.cases,
                      titleFontSize: 16,
                      amountFontSize: 20,
                      titlecolor: ColorTheme.cases,
                      padding: const EdgeInsets.only(bottom: 20),
                      crossAxisAlignment: CrossAxisAlignment.end,
                    ),
                    KgpStatsWithTitle(
                      title: 'Recovered',
                      amount: data.recovered,
                      titleFontSize: 16,
                      amountFontSize: 20,
                      titlecolor: ColorTheme.recovered,
                      padding: const EdgeInsets.only(bottom: 20),
                      crossAxisAlignment: CrossAxisAlignment.end,
                    ),
                    KgpStatsWithTitle(
                      title: 'Deaths',
                      amount: data.deaths,
                      titleFontSize: 16,
                      amountFontSize: 20,
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
