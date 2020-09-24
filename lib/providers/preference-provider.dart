import 'dart:convert';

import 'package:covid19/models/country-model.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final preferencesProvider = FutureProvider.autoDispose(
  (_) async => await SharedPreferences.getInstance(),
);

final myHomeCountryProvider = ChangeNotifierProvider.autoDispose((ref) {
  return MyHomeCountryChangeNotifier();
});

class MyHomeCountryChangeNotifier extends ChangeNotifier {
  Country _homeCountry = Country();

  Country get homeCountry => _homeCountry;

  void setCountry(Country home) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('HomeCountry', jsonEncode(home));
    _homeCountry = home;
    notifyListeners();
  }

  void getCountry() async {
    final prefs = await SharedPreferences.getInstance();
    final Country home = jsonDecode(prefs.getString('HomeCountry'));
    _homeCountry = home;
    notifyListeners();
  }
}
