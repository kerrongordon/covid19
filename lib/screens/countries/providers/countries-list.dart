import 'package:covid19/models/country-model.dart';
import 'package:covid19/screens/countries/countries-item.dart';
import 'package:covid19/services/country-service.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final countriesListProvider =
    FutureProvider.autoDispose<List<Widget>>((ref) async {
  final CountryService countryService = CountryService();
  final data = await countryService.getCountryApi();

  List<Widget> items(List<Country> data) {
    final List<CountriesItem> _cardItem = [];
    for (final c in data) {
      _cardItem.add(CountriesItem(data: c));
    }
    return _cardItem;
  }

  return items(data);
});
