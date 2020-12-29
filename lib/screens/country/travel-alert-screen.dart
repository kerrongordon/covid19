import 'package:covid19/components/country-card/country-card-travel-alert.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/screens/country/providers/travel-alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TravelAlertScreen extends HookWidget {
  final Country data;
  const TravelAlertScreen({this.data});

  @override
  Widget build(BuildContext context) {
    final couCode = data.countryInfo.iso2;
    final travel = useProvider(travelAlert(couCode));

    return travel.when(
      data: (data) => CountryCardTravelAlert(data: data.data.values.first),
      loading: () => Container(),
      error: (error, _) => Container(),
    );
  }
}
