import 'package:covid19/services/country-service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final countryProvider = FutureProvider.autoDispose((_) async {
  final CountryService countryService = CountryService();
  return countryService.getCountryApi();
});
