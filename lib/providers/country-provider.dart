import 'package:covid19/models/country-model.dart';
import 'package:covid19/services/country-service.dart';
import 'package:covid19/utils/position.util.dart';
import 'package:geolocator/geolocator.dart';

class CountryProvider {
  CountryService _countryService = new CountryService();
  List<Country> _country = new List<Country>();

  Future<List<Country>> getCountry() async {
    _country = await _countryService.getCountryApi();
    return _country;
  }

  Future<Position> getlocation() async {
    Position position = await PositionUtil.use();
    return position;
  }
}
