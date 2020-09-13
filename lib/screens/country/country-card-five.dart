import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-pie-chart.dart';
import 'package:covid19/components/kgp-stats-with-title.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/models/historical-model.dart';
import 'package:covid19/providers/historical-provider.dart';
import 'package:covid19/themes/color-theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class CountryCardFive extends ConsumerWidget {
  final Country data;
  const CountryCardFive({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final couName = data.country;
    final historical = watch(historicalProvider);

    return Container(
        child: FutureBuilder(
      future: historical.getHistoricalApi(country: couName),
      builder: (context, AsyncSnapshot<Historical> snapshot) {
        if (snapshot.hasData) {
          final Timeline items = snapshot.data.timeline;

          List<HistoryItem> cases = [];
          items.cases.forEach((key, value) {
            var item = {'date': key, 'count': value};
            cases.add(HistoryItem.fromJson(item));
          });

          List<HistoryItem> recovered = [];
          items.recovered.forEach((key, value) {
            var item = {'date': key, 'count': value};
            recovered.add(HistoryItem.fromJson(item));
          });

          List<HistoryItem> deaths = [];
          items.deaths.forEach((key, value) {
            var item = {'date': key, 'count': value};
            deaths.add(HistoryItem.fromJson(item));
          });

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Last 30 Days',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                height: 300,
                child: LIstItems(
                  cases: cases,
                  recovered: recovered,
                  deaths: deaths,
                ),
              ),
            ],
          );
        }
        return Container();
      },
    ));
  }
}

class LIstItems extends StatelessWidget {
  const LIstItems({
    Key key,
    @required this.cases,
    @required this.recovered,
    @required this.deaths,
  }) : super(key: key);

  final List<HistoryItem> cases;
  final List<HistoryItem> recovered;
  final List<HistoryItem> deaths;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        for (var i = 0; i < 30; i++)
          ZoomIn(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 55,
                left: 20,
                right: 20,
              ),
              child: CardComponent(
                padding: const EdgeInsets.all(20),
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            KgpStatsWithTitle(
                              flip: true,
                              title: 'Cases',
                              amount: cases[i].count,
                              titleFontSize: 16,
                              amountFontSize: 18,
                              titlecolor: ColorTheme.cases,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              padding: const EdgeInsets.only(bottom: 10),
                            ),
                            KgpStatsWithTitle(
                              flip: true,
                              title: 'Recovered',
                              amount: recovered[i].count,
                              titleFontSize: 16,
                              amountFontSize: 18,
                              titlecolor: ColorTheme.recovered,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              padding: const EdgeInsets.only(bottom: 10),
                            ),
                            KgpStatsWithTitle(
                              flip: true,
                              title: 'Deaths',
                              amount: deaths[i].count,
                              titleFontSize: 16,
                              amountFontSize: 18,
                              titlecolor: ColorTheme.deaths,
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                          ],
                        ),
                      ),
                      VerticalDivider(),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            Text(
                              _convertDate(cases[i].date),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Expanded(
                              child: KgpPieChart(
                                aspectRatio: 1,
                                cases: cases[i].count,
                                recovered: recovered[i].count,
                                deaths: deaths[i].count,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

String _convertDate(String date) {
  DateTime newl = DateFormat.yMd('en_US').parse(date);
  return DateFormat.yMMMd().format(newl);
}
