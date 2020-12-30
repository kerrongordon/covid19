import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-stats-with-title.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/themes/color-theme.dart';
import 'package:flutter/material.dart';

class CountryCardDetail extends StatelessWidget {
  final Country data;
  const CountryCardDetail({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CardComponent(
                  color: ColorTheme.cases,
                  padding: const EdgeInsets.all(20),
                  child: KgpStatsWithTitle(
                    flip: true,
                    title: 'Active',
                    amount: data.active,
                    titleFontSize: 18,
                    amountFontSize: 15,
                    titlecolor: Colors.white,
                    amountcolor: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: CardComponent(
                  color: ColorTheme.deaths,
                  padding: const EdgeInsets.all(20),
                  child: KgpStatsWithTitle(
                    flip: true,
                    title: 'Critical',
                    amount: data.critical,
                    titleFontSize: 18,
                    amountFontSize: 15,
                    titlecolor: Colors.white,
                    amountcolor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CardComponent(
                  color: Colors.blue,
                  padding: const EdgeInsets.all(20),
                  child: KgpStatsWithTitle(
                    flip: true,
                    title: 'Test Done',
                    amount: data.tests,
                    titleFontSize: 18,
                    amountFontSize: 15,
                    titlecolor: Colors.white,
                    amountcolor: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: CardComponent(
                  color: Colors.blue,
                  padding: const EdgeInsets.all(20),
                  child: KgpStatsWithTitle(
                    flip: true,
                    title: 'Population',
                    amount: data.population,
                    titleFontSize: 18,
                    amountFontSize: 15,
                    titlecolor: Colors.white,
                    amountcolor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
