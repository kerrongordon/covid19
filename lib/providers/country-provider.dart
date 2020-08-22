import 'package:covid19/models/country-model.dart';
import 'package:covid19/services/country-service.dart';

class CountryProvider {
  CountryService _countryService = new CountryService();
  List<Country> _country = new List<Country>();

  List<Country> get country => _country;

  Future<List<Country>> getCountry() async {
    _country = await _countryService.getCountryApi();
    print('CountryProvider $_country');
    return _country;
  }
}
