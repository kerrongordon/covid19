import 'package:covid19/models/global-model.dart';
import 'package:covid19/screens/home/components/card-title-one.dart';
import 'package:flutter/material.dart';

class CardListOne extends StatelessWidget {
  final Global data;
  const CardListOne({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(right: 20),
        child: Column(
          children: [
            CardTitleOne(
              title: 'Confirmed',
              color: Colors.orangeAccent,
              number: data.cases,
            ),
            CardTitleOne(
              title: 'Recovered',
              color: Colors.green,
              number: data.recovered,
            ),
            CardTitleOne(
              title: 'Deaths',
              color: Colors.redAccent,
              number: data.deaths,
            ),
          ],
        ),
      ),
    );
  }
}
