import 'package:covid19/configs/data.config.dart';
import 'package:covid19/models/country-model.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:shared_preferences/shared_preferences.dart';

final homeCountryProvider =
    ChangeNotifierProvider.autoDispose<HomeProvider>((_) => HomeProvider());

class HomeProvider extends ChangeNotifier {
  Country _country = new Country();

  Country get item => _country;

  void setCountryName(Country country) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(countryNameKey, country.country);
    _country = country;
    notifyListeners();
  }

  Future<String> getCountryName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(countryNameKey);
  }
}
