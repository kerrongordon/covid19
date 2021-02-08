import 'package:covid19/components/ads-component.dart';
import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/components/kgp-card-title.dart';
import 'package:covid19/components/kgp-stats-with-title.dart';
import 'package:covid19/models/usstates-model.dart';
import 'package:covid19/themes/color-theme.dart';
import 'package:covid19/translations/app-translate.dart';
import 'package:covid19/utils/timetodate.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';

class UsState extends StatelessWidget {
  final UsStates data;
  const UsState({this.data});

  @override
  Widget build(BuildContext context) {
    final String date = TimeToDate.use(data.updated);

    return Scaffold(
      body: KgpBasePage(
        title: data.state,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CardComponent(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    KgpCardTitle(
                      title: data.state,
                      subtitle: '$updatedasof $date',
                    ),
                    SizedBox(
                      width: 300,
                      child: Row(
                        children: [
                          Expanded(
                            child: KgpStatsWithTitle(
                              title: cases,
                              amount: data.cases,
                              amountFontSize: 20,
                              titleFontSize: 15,
                              titlecolor: ColorTheme.cases,
                            ),
                          ),
                          Expanded(
                            child: KgpStatsWithTitle(
                              title: deaths,
                              amount: data.deaths,
                              amountFontSize: 20,
                              titleFontSize: 15,
                              titlecolor: ColorTheme.deaths,
                            ),
                          ),
                          Expanded(
                            child: KgpStatsWithTitle(
                              title: recovered,
                              amount: data.recovered,
                              amountFontSize: 20,
                              titleFontSize: 15,
                              titlecolor: ColorTheme.recovered,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const AdsComponent(type: NativeAdmobType.full),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CardComponent(
                          padding: const EdgeInsets.all(20),
                          child: KgpStatsWithTitle(
                            flip: true,
                            title: active,
                            amount: data.active,
                            titleFontSize: 18,
                            amountFontSize: 15,
                            titlecolor: ColorTheme.recovered,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: CardComponent(
                          padding: const EdgeInsets.all(20),
                          child: KgpStatsWithTitle(
                            flip: true,
                            title: population,
                            amount: data.population,
                            titleFontSize: 18,
                            amountFontSize: 15,
                            titlecolor: ColorTheme.recovered,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              CardComponent(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    KgpCardTitle(
                      title: today,
                      subtitle: '$updatedasof $date',
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: KgpStatsWithTitle(
                            title: cases,
                            amount: data.todayCases,
                            amountFontSize: 20,
                            titleFontSize: 15,
                            titlecolor: ColorTheme.cases,
                          ),
                        ),
                        Expanded(
                          child: KgpStatsWithTitle(
                            title: deaths,
                            amount: data.todayDeaths,
                            amountFontSize: 20,
                            titleFontSize: 15,
                            titlecolor: ColorTheme.deaths,
                          ),
                        ),
                        Expanded(
                          child: KgpStatsWithTitle(
                            title: testdone,
                            amount: data.tests,
                            amountFontSize: 20,
                            titleFontSize: 15,
                            titlecolor: ColorTheme.recovered,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
