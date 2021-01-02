import 'package:covid19/themes/color-theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class KgpPieChart extends StatelessWidget {
  final double aspectRatio;
  final int cases;
  final int recovered;
  final int deaths;
  const KgpPieChart({
    @required this.aspectRatio,
    @required this.cases,
    @required this.recovered,
    @required this.deaths,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: PieChart(
          PieChartData(
            borderData: FlBorderData(show: false),
            sectionsSpace: 3,
            startDegreeOffset: 40,
            sections: [
              PieChartSectionData(
                color: ColorTheme.cases,
                value: cases.toDouble(),
                title: '',
                radius: 20,
              ),
              PieChartSectionData(
                color: ColorTheme.recovered,
                value: recovered.toDouble(),
                title: '',
                radius: 40,
              ),
              PieChartSectionData(
                color: ColorTheme.deaths,
                value: deaths.toDouble(),
                title: '',
                radius: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
