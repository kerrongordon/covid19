import 'package:covid19/models/country-model.dart';
import 'package:covid19/services/one-country-service.dart';

class OneCountryProvider {
  OneCountryService _oneCountryService = new OneCountryService();
  Country _country = new Country();

  Future<Country> getOneCountry({String country}) async {
    _country = await _oneCountryService.getOneCountryApi(country: country);
    return _country;
  }
}
