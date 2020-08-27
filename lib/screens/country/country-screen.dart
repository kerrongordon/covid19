import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/screens/country/country-card-four.dart';
import 'package:covid19/screens/country/country-card-one.dart';
import 'package:covid19/screens/country/country-card-three.dart';
import 'package:covid19/screens/country/country-card-two.dart';
import 'package:flutter/material.dart';

class CountryScreen extends StatelessWidget {
  final Country data;
  const CountryScreen({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KgpBasePage(
        title: data.country,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CountryCardOne(data: data),
                CountryCartTwo(data: data),
                CountryCardThree(data: data),
                CountryCardFour(data: data),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
