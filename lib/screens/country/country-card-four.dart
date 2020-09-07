import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-card-title.dart';
import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/models/travel-alert-model.dart';
import 'package:covid19/providers/travel-alert-provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CountryCardFour extends StatelessWidget {
  final Country data;
  const CountryCardFour({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Consumer<TravelAlertProvider>(
        builder: (context, value, child) {
          return FutureBuilder(
            future: value.getTravelAlert(countrycode: data.countryInfo.iso2),
            builder: (context, AsyncSnapshot<TravelAlert> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return KgpLoader();
              } else if (snapshot.hasError) {
                final error = snapshot.error;
                return Container(
                    height: 200, child: Center(child: Text(error.toString())));
              } else if (snapshot.hasData) {
                final datal = snapshot.data.data;
                for (var val in datal.values) {
                  final String _date =
                      DateFormat.yMMMMEEEEd().format(val.advisory.updated);
                  return CountryCardFourItem(date: _date, val: val);
                }
                return Container();
              } else {
                return Container();
              }
            },
          );
        },
      ),
    );
  }
}

class CountryCardFourItem extends StatelessWidget {
  const CountryCardFourItem({
    Key key,
    @required String date,
    @required this.val,
  })  : _date = date,
        super(key: key);

  final String _date;
  final Datum val;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CardComponent(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            KgpCardTitle(
              title: 'Travel Alert',
              subtitle: 'Updates as of $_date',
              icon: Icon(Ionicons.ios_airplane),
            ),
            FadeInDown(
              child: Container(
                child: Text(
                  val.advisory.message,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Lottie.asset(
              'assets/airplane.json',
              repeat: true,
              animate: true,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
