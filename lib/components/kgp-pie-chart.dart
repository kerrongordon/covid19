import 'package:covid19/themes/color-theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class KgpPieChart extends StatelessWidget {
  final double aspectRatio;
  final int cases;
  final int recovered;
  final int deaths;
  const KgpPieChart({
    Key key,
    @required this.aspectRatio,
    @required this.cases,
    @required this.recovered,
    @required this.deaths,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotateIn(
      child: ZoomIn(
        child: Container(
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: PieChart(
                PieChartData(
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 0,
                  startDegreeOffset: 40,
                  sections: [
                    PieChartSectionData(
                      color: ColorTheme.cases,
                      value: cases.toDouble(),
                      title: '',
                      radius: 35,
                    ),
                    PieChartSectionData(
                      color: ColorTheme.recovered,
                      value: recovered.toDouble(),
                      title: '',
                      radius: 45,
                    ),
                    PieChartSectionData(
                      color: ColorTheme.deaths,
                      value: deaths.toDouble(),
                      title: '',
                      radius: 65,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
