import 'dart:convert';

import 'package:covid19/models/country-model.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final preferencesProvider = FutureProvider.autoDispose(
  (_) async => SharedPreferences.getInstance(),
);

final myHomeCountryProvider = ChangeNotifierProvider.autoDispose((ref) {
  return MyHomeCountryChangeNotifier();
});

class MyHomeCountryChangeNotifier extends ChangeNotifier {
  Country _homeCountry = Country();

  Country get homeCountry => _homeCountry;

  Future<void> setCountry(Country home) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('HomeCountryOne', jsonEncode(home));
    _homeCountry = home;
    notifyListeners();
  }

  Future<Country> getCountry() async {
    final prefs = await SharedPreferences.getInstance();
    final Country home = Country.fromJson(
        jsonDecode(prefs.getString('HomeCountryOne')) as Map<String, dynamic>);
    _homeCountry = home;
    notifyListeners();
    return home;
  }
}
