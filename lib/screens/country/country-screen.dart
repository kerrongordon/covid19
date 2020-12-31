import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:covid19/components/ads-component.dart';
import 'package:covid19/components/country-card/country-card-detail.dart';
import 'package:covid19/components/country-card/country-card-main.dart';
import 'package:covid19/components/country-card/country-card-today.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/routes/route-names.dart';
import 'package:covid19/screens/country/country-card-five.dart';
import 'package:covid19/screens/country/travel-alert-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';

class CountryScreen extends StatelessWidget {
  final Country data;
  const CountryScreen({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final changeTheme = AdaptiveTheme.of(context);
    final colorText = changeTheme.theme.textTheme.bodyText1.color;
    return Scaffold(
      body: KgpBasePage(
        title: data.country,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CountryCardMain(data: data),
                  CountryCardToday(data: data),
                  CountryCardDetail(data: data),
                  AdsComponent(
                    type: NativeAdmobType.full,
                    color: changeTheme.mode.isLight ? Colors.brown : null,
                    textColor:
                        changeTheme.mode.isLight ? Colors.white : colorText,
                  ),
                  TravelAlertScreen(data: data),
                  CountryCardFive(data: data),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: data.country == 'USA'
          ? FloatingActionButton.extended(
              heroTag: 'UsStatesSearch',
              onPressed: () =>
                  Navigator.of(context).pushNamed(usStatePageScreen),
              label: Text('US States'),
              icon: Icon(Ionicons.ios_list),
            )
          : null,
    );
  }
}
