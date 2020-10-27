import 'package:covid19/components/country-card/country-card-travel-alert.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/models/travel-alert-model.dart';
import 'package:covid19/providers/travel-alert-provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TravelAlertScreen extends ConsumerWidget {
  final Country data;
  TravelAlertScreen({
    @required this.data,
  });

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final couCode = data.countryInfo.iso2;
    final travelAlert = watch(travelAlertProvider);

    return FutureBuilder(
      future: travelAlert.gettravelAlertApi(countrycode: couCode),
      builder: (context, AsyncSnapshot<TravelAlert> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        } else if (snapshot.hasError) {
          return Container();
        } else if (snapshot.hasData) {
          final datal = snapshot.data.data;
          return datal.values.length == 1
              ? CountryCardTravelAlert(data: datal.values.first)
              : Container();
        } else {
          return Container();
        }
      },
    );
  }
}
