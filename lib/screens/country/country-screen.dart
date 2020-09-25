import 'package:covid19/components/ads-component.dart';
import 'package:covid19/components/country-card/country-card-detail.dart';
import 'package:covid19/components/country-card/country-card-main.dart';
import 'package:covid19/components/country-card/country-card-today.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/screens/country/country-card-five.dart';
import 'package:covid19/screens/country/travel-alert-screen.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CountryCardMain(data: data),
                CountryCardToday(data: data),
                AdsComponent(),
                CountryCardDetail(data: data),
                TravelAlertScreen(data: data),
              ],
            ),
          ),
          CountryCardFive(data: data),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
