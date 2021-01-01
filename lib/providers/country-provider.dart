import 'package:covid19/models/country-model.dart';
import 'package:covid19/services/country-service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final countryProvider = FutureProvider.autoDispose((_) async {
  CountryService countryService = new CountryService();
  return await countryService.getCountryApi();
});

final countryProviderPicker = FutureProvider.autoDispose((ref) async {
  final prefs = await SharedPreferences.getInstance();
  final countries = await CountryService().getCountryApi();
  final name = prefs.getString('myhomecountry');
  List<Country> item =
      countries.where((element) => name == element.country).toList();
  return item;
});
