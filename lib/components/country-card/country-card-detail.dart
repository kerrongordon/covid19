import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-stats-with-title.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/themes/color-theme.dart';
import 'package:covid19/translations/app-translate.dart';
import 'package:flutter/material.dart';

class CountryCardDetail extends StatelessWidget {
  final Country data;
  const CountryCardDetail({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final changeTheme = AdaptiveTheme.of(context);
    final colorText = changeTheme.theme.textTheme.bodyText1.color;
    final accentColor = changeTheme.theme.accentColor;
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CardComponent(
                  color: changeTheme.mode.isLight ? ColorTheme.cases : null,
                  padding: const EdgeInsets.all(20),
                  child: KgpStatsWithTitle(
                    flip: true,
                    title: active,
                    amount: data.active,
                    titleFontSize: 18,
                    amountFontSize: 15,
                    titlecolor:
                        changeTheme.mode.isLight ? Colors.white : accentColor,
                    amountcolor:
                        changeTheme.mode.isLight ? Colors.white : colorText,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: CardComponent(
                  color: changeTheme.mode.isLight ? ColorTheme.deaths : null,
                  padding: const EdgeInsets.all(20),
                  child: KgpStatsWithTitle(
                    flip: true,
                    title: critical,
                    amount: data.critical,
                    titleFontSize: 18,
                    amountFontSize: 15,
                    titlecolor:
                        changeTheme.mode.isLight ? Colors.white : accentColor,
                    amountcolor:
                        changeTheme.mode.isLight ? Colors.white : colorText,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CardComponent(
                  color: changeTheme.mode.isLight ? Colors.blue : null,
                  padding: const EdgeInsets.all(20),
                  child: KgpStatsWithTitle(
                    flip: true,
                    title: testdone,
                    amount: data.tests,
                    titleFontSize: 18,
                    amountFontSize: 15,
                    titlecolor:
                        changeTheme.mode.isLight ? Colors.white : accentColor,
                    amountcolor:
                        changeTheme.mode.isLight ? Colors.white : colorText,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: CardComponent(
                  color: changeTheme.mode.isLight ? Colors.blue : null,
                  padding: const EdgeInsets.all(20),
                  child: KgpStatsWithTitle(
                    flip: true,
                    title: population,
                    amount: data.population,
                    titleFontSize: 18,
                    amountFontSize: 15,
                    titlecolor:
                        changeTheme.mode.isLight ? Colors.white : accentColor,
                    amountcolor:
                        changeTheme.mode.isLight ? Colors.white : colorText,
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
