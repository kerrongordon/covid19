import 'package:covid19/components/ads-component.dart';
import 'package:covid19/components/country-card/country-card-main.dart';
import 'package:covid19/components/country-card/country-card-today.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/screens/main/main-callback.dart';
import 'package:flutter/material.dart';

class MainCardList extends StatelessWidget {
  final Country data;
  const MainCardList({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KgpBasePage(
      title: data.country,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CountryCardMain(data: data),
              AdsComponent(),
              CountryCardToday(data: data),
              MainCallback(data: data),
            ],
          ),
        ),
      ],
    );
  }
}
