import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/screens/country/country-card-five.dart';
import 'package:covid19/screens/country/country-card-four.dart';
import 'package:covid19/screens/country/country-card-one.dart';
import 'package:covid19/screens/country/country-card-three.dart';
import 'package:covid19/screens/country/country-card-two.dart';
import 'package:flutter/material.dart';

class CountryScreen extends StatelessWidget {
  final Country data;
  final List<Widget> actions;
  final Widget leading;
  const CountryScreen({
    Key key,
    this.data,
    this.actions,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KgpBasePage(
        title: data.country,
        leading: leading,
        actions: actions,
        children: [
          Container(
            child: Column(
              children: [
                CountryCardOne(data: data),
                CountryCartTwo(data: data),
                CountryCardThree(data: data),
                CountryCardFour(data: data),
                CountryCardFive(data: data),
              ],
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
