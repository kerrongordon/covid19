import 'package:bezier_chart/bezier_chart.dart';
import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-card-title.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/models/historical-model.dart';
import 'package:covid19/providers/historical-provider.dart';
import 'package:covid19/themes/color-theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
    final theme = Theme.of(context);

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

          List<DataPoint<DateTime>> _getLineData(List<HistoryItem> data) {
            final year = DateTime.now().year;
            List<DataPoint<DateTime>> list = [];
            for (final item in data) {
              final dateTime1 = DateFormat('M/d/yyyy').parse(item.date);
              final date = DateTime(year, dateTime1.month, dateTime1.day);
              final datapoint = DataPoint<DateTime>(
                  value: item.count.toDouble(), xAxis: date);
              list.add(datapoint);
            }
            return list;
          }

          final fromDate = DateTime.now().subtract(Duration(days: 30));
          final toDate = DateTime.now().subtract(Duration(days: 1));

          return CardComponent(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const KgpCardTitle(
                    title: 'Last 30 Days',
                    icon: Icon(Ionicons.ios_podium),
                  ),
                ),
                Container(
                  height: 270,
                  width: double.infinity,
                  child: RepaintBoundary(
                    child: BezierChart(
                      fromDate: fromDate,
                      bezierChartScale: BezierChartScale.WEEKLY,
                      toDate: toDate,
                      selectedDate: toDate,
                      series: [
                        BezierLine(
                          label: "Cases",
                          data: _getLineData(cases),
                          lineColor: ColorTheme.cases,
                          lineStrokeWidth: 5.0,
                        ),
                        BezierLine(
                          label: "Recovered",
                          data: _getLineData(recovered),
                          lineColor: ColorTheme.recovered,
                          lineStrokeWidth: 5.0,
                        ),
                        BezierLine(
                          label: "Deaths",
                          data: _getLineData(deaths),
                          lineColor: ColorTheme.deaths,
                          lineStrokeWidth: 5.0,
                        ),
                      ],
                      config: BezierChartConfig(
                        verticalIndicatorStrokeWidth: 3.0,
                        verticalIndicatorColor: Colors.black26,
                        showVerticalIndicator: true,
                        verticalIndicatorFixedPosition: true,
                        footerHeight: 45.0,
                        updatePositionOnTap: true,
                        showDataPoints: true,
                        xAxisTextStyle: TextStyle(
                          color: theme.textTheme.bodyText1.color,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    ));
  }
}
