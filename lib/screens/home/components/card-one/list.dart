import 'package:flutter/material.dart';
import 'package:covid19/models/global-model.dart';
import 'package:covid19/screens/home/components/card-one/title.dart';

class CardOneList extends StatelessWidget {
  final Global data;
  const CardOneList({
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
            CardOneTitle(
              title: 'Confirmed',
              color: Colors.orangeAccent,
              number: data.cases,
            ),
            CardOneTitle(
              title: 'Recovered',
              color: Colors.green,
              number: data.recovered,
            ),
            CardOneTitle(
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
