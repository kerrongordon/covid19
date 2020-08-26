import 'package:covid19/models/global-model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CardOneChart extends StatelessWidget {
  final Global data;
  const CardOneChart({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        child: AspectRatio(
          aspectRatio: 1,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: PieChart(
              PieChartData(
                borderData: FlBorderData(show: false),
                sectionsSpace: 0,
                startDegreeOffset: 40,
                sections: [
                  PieChartSectionData(
                    color: Colors.orangeAccent,
                    value: data.cases.toDouble(),
                    title: '',
                    radius: 35,
                  ),
                  PieChartSectionData(
                    color: Colors.green,
                    value: data.recovered.toDouble(),
                    title: '',
                    radius: 45,
                  ),
                  PieChartSectionData(
                    color: Colors.redAccent,
                    value: data.deaths.toDouble(),
                    title: '',
                    radius: 65,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
