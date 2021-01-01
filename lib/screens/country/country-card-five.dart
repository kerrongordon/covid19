import 'package:bezier_chart/bezier_chart.dart';
import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-card-title.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/models/historical-model.dart';
import 'package:covid19/screens/country/providers/thirty-day.dart';
import 'package:covid19/themes/color-theme.dart';
import 'package:covid19/translations/app-translate.dart' as tran;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class CountryCardFive extends HookWidget {
  final Country data;
  const CountryCardFive({this.data});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cases = useProvider(historyItem(CountryAndType(
      countryName: data.country,
      historyItemType: HistoryItemType.cases,
    )));
    final recovered = useProvider(historyItem(CountryAndType(
      countryName: data.country,
      historyItemType: HistoryItemType.recovered,
    )));
    final deaths = useProvider(historyItem(CountryAndType(
      countryName: data.country,
      historyItemType: HistoryItemType.deaths,
    )));

    if (cases.isEmpty) {
      return Container();
    }

    List<DataPoint<DateTime>> _getLineData(List<HistoryItem> data) {
      List<DataPoint<DateTime>> list = [];
      for (final item in data) {
        final dateTime1 = DateFormat('M/d/yyyy').parse(item.date);
        final year =
            dateTime1.year + 2000; // Using a hack for now fix is on prerelease
        final date = DateTime(year, dateTime1.month, dateTime1.day);
        final datapoint =
            DataPoint<DateTime>(value: item.count.toDouble(), xAxis: date);
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
            child: KgpCardTitle(
              title: tran.last30days,
              icon: const Icon(Ionicons.ios_podium),
            ),
          ),
          Container(
            height: 270,
            width: double.infinity,
            child: BezierChart(
              fromDate: fromDate,
              bezierChartScale: BezierChartScale.WEEKLY,
              toDate: toDate,
              selectedDate: toDate,
              series: [
                BezierLine(
                  label: tran.cases,
                  data: _getLineData(cases),
                  lineColor: ColorTheme.cases,
                ),
                BezierLine(
                  label: tran.recovered,
                  data: _getLineData(recovered),
                  lineColor: ColorTheme.recovered,
                ),
                BezierLine(
                  label: tran.deaths,
                  data: _getLineData(deaths),
                  lineColor: ColorTheme.deaths,
                ),
              ],
              config: BezierChartConfig(
                verticalIndicatorStrokeWidth: 3.0,
                verticalIndicatorColor: Colors.black26,
                showVerticalIndicator: true,
                verticalIndicatorFixedPosition: true,
                footerHeight: 45.0,
                updatePositionOnTap: true,
                xAxisTextStyle: TextStyle(
                  color: theme.textTheme.bodyText1.color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
