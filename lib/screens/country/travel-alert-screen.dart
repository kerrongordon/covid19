import 'package:covid19/components/country-card/country-card-travel-alert.dart';
import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/models/travel-alert-model.dart';
import 'package:covid19/providers/travel-alert-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TravelAlertScreen extends StatelessWidget {
  final Country data;
  const TravelAlertScreen({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TravelAlertProvider>(
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
                return CountryCardTravelAlert(data: val);
              }
              return Container();
            } else {
              return Container();
            }
          },
        );
      },
    );
  }
}
