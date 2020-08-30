import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-card-title.dart';
import 'package:covid19/components/kgp-stats-with-title.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/providers/one-country-provider.dart';
import 'package:covid19/themes/color-theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeCardCountry extends StatelessWidget {
  const HomeCardCountry({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<OneCountryProvider, SharedPreferences>(
      builder: (_, OneCountryProvider country, SharedPreferences prefe, __) {
        return FutureBuilder(
          future:
              country.getOneCountry(country: prefe.getString('homeCountry')),
          builder: (context, AsyncSnapshot<Country> snapshot) {
            if (snapshot.hasData) {
              Country data = snapshot.data;
              return Container(
                child: CardComponent(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      KgpCardTitle(
                        title: data.country,
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: KgpStatsWithTitle(
                                title: 'Cases',
                                amount: data.cases,
                                amountFontSize: 20,
                                titleFontSize: 15,
                                titlecolor: ColorTheme.cases,
                              ),
                            ),
                            Expanded(
                              child: KgpStatsWithTitle(
                                title: 'Recovered',
                                amount: data.recovered,
                                amountFontSize: 20,
                                titleFontSize: 15,
                                titlecolor: ColorTheme.recovered,
                              ),
                            ),
                            Expanded(
                              child: KgpStatsWithTitle(
                                title: 'Deaths',
                                amount: data.deaths,
                                amountFontSize: 20,
                                titleFontSize: 15,
                                titlecolor: ColorTheme.deaths,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          'Today',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: KgpStatsWithTitle(
                                title: 'Cases',
                                amount: data.todayCases,
                                amountFontSize: 20,
                                titleFontSize: 15,
                                titlecolor: ColorTheme.cases,
                              ),
                            ),
                            Expanded(
                              child: KgpStatsWithTitle(
                                title: 'Recovered',
                                amount: data.todayRecovered,
                                amountFontSize: 20,
                                titleFontSize: 15,
                                titlecolor: ColorTheme.recovered,
                              ),
                            ),
                            Expanded(
                              child: KgpStatsWithTitle(
                                title: 'Deaths',
                                amount: data.todayDeaths,
                                amountFontSize: 20,
                                titleFontSize: 15,
                                titlecolor: ColorTheme.deaths,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        );
      },
    );
  }
}
